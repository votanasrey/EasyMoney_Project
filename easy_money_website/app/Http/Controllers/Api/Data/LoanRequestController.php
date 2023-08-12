<?php

namespace App\Http\Controllers\Api\Data;

use App\Http\Controllers\Controller;
use App\Models\LoanRequest;
use App\Transformers\Data\LoanRequestTransformer;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Spatie\Fractalistic\ArraySerializer;

class LoanRequestController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:Delete loan requests')->only('destroy');
    }

    public function index(Request $request): JsonResponse
    {
        $user = Auth::user();
        if ($user->hasPermissionTo('List loan requests')) {
            $paginator = LoanRequest::query()
                ->paginate($request->get('limit', config('app.pagination_limit', 20)));
            if ($request->has('limit')) {
                $paginator->appends($request->get('limit'));
            }
            return fractal($paginator, new LoanRequestTransformer())
                ->parseIncludes(['user'])
                ->respond();
        }

        $loanRequests = LoanRequest::query()
            ->where('user_id', $user->uuid)
            ->where('status', '!=', 'refused')
            ->orderBy('created_at', 'desc')
            ->get();
        return fractal($loanRequests, new LoanRequestTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    public function show(LoanRequest $loanRequest): JsonResponse
    {
        $user = Auth::user();
        if ($loanRequest->user_id == $user->uuid) {
            return fractal($loanRequest, new LoanRequestTransformer())
                ->serializeWith(new ArraySerializer())
                ->respond();
        }
        if ($user->hasPermissionTo('List loan requests')) {
            return fractal($loanRequest, new LoanRequestTransformer())
                ->parseIncludes(['user'])
                ->respond();
        }

        return response()->json(["success" => false], 401);
    }

    public function store(Request $request): JsonResponse
    {
        $request->validate([
            'installment' => 'required',
            'term' => 'required',
            'borrower_month_income' => 'required',
            'borrower_length_experience' => 'required',
            'home_ownership' => 'required',
            'address_state' => 'required',
            'loan_amount' => 'required',
            'bank_statement' => 'required',
        ]);

        $result = Http::post('http://54.179.57.140:8080/predict_api', [
            [
                'installment' => $request['installment'],
                'term' => $request['term'],
                'borrower_month_income' => $request['borrower_month_income'],
                'borrower_length_experience' => $request['borrower_length_experience'],
                'home_ownership' => $request['home_ownership'],
                'address_state' => $request['address_state'],
            ],
        ])['result'][0];
        $user = Auth::user();
        $loanRequest = LoanRequest::query()->create([
            'installment' => $request->get('installment'),
            'term' => $request->get('term'),
            'borrower_month_income' => $request->get('borrower_month_income'),
            'borrower_length_experience' => $request->get('borrower_length_experience'),
            'home_ownership' => $request->get('home_ownership'),
            'loan_amount' => $request->get('loan_amount'),
            'bank_statement' => $request->get('bank_statement'),
            'loan_predict' => $result,
            'pay_amount' => $result * 1.1,
            'address_state' => $request->get('address_state'),
            'user_id' => $user->uuid,
            'status' => 'pending'
        ]);

        return fractal($loanRequest, new LoanRequestTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    public function update(Request $request, LoanRequest $loanRequest): JsonResponse
    {
        $request->validate([
            'pay_amount' => 'sometimes|required',
            'loan_amount' => 'sometimes|required',
            'status' => 'required',
        ]);

        $user = Auth::user();

        if ($user->hasPermissionTo('Update loan requests') || $user->uuid == $loanRequest->user_id) {
            $loanRequest->status = $request->get('status');

            if ($request->has('pay_amount') && $user->hasPermissionTo('Update loan requests')) {
                $loanRequest->pay_amount = $request->get('pay_amount');
            }

            if ($request->has('loan_amount') && $user->hasPermissionTo('Update loan requests')) {
                $loanRequest->loan_amount = $request->get('loan_amount');
            }

            $loanRequest->save();
            return fractal($loanRequest, new LoanRequestTransformer())
                ->serializeWith(new ArraySerializer())
                ->respond();
        }

        return response()->json("", 401);
    }

    public function destroy(LoanRequest $loanRequest): JsonResponse
    {
        if ($loanRequest->loan == null) {
            $loanRequest->delete();
            return response()->json(['success' => true]);
        }
        return response()->json(['success' => false], 401);
    }
}
