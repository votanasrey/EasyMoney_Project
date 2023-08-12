<?php

namespace App\Http\Controllers\Api\Data;

use App\Http\Controllers\Controller;
use App\Models\Loan;
use App\Models\LoanRequest;
use App\Transformers\Data\LoanTransformer;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\Fractalistic\ArraySerializer;

class LoanController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:Create loans')->only('store');
        $this->middleware('permission:Update loans')->only('update');
    }

    public function index(Request $request): JsonResponse
    {
        $user = Auth::user();
        if ($user->hasPermissionTo('List loans')) {
            $paginator = Loan::paginate($request->get('limit', config('app.pagination_limit', 20)));
            if ($request->has('limit')) {
                $paginator->appends($request->get('limit'));
            }
            return fractal($paginator, new LoanTransformer())
                ->parseIncludes(['user'])
                ->respond();
        }

        $loans = Loan::query()->where('user_id', $user->uuid)->get();
        return fractal($loans, new LoanTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    // when loan approved
    public function store(LoanRequest $loanRequest): JsonResponse
    {
        if ($loanRequest->status == 'refused') {
            return response()->json(["success" => false], 401);
        }
        $statDate = Carbon::now();
        $numberOfTerm = $loanRequest->number_of_term;
        $endDate = Carbon::now();
        $endDate->addMonths($numberOfTerm);
        $loan = Loan::create([
            'loan_amount' => $loanRequest->loan_amount,
            'pay_amount' => $loanRequest->pay_amount,
            'start_date' => $statDate,
            'end_date' => $endDate,
            'paid' => false,
            'status' => 'active',
            'loan_request_id' => $loanRequest->id,
            'user_id' => $loanRequest->user_id,
        ]);

        return fractal($loan, new LoanTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    public function show(Loan $loan): JsonResponse
    {
        $user = Auth::user();
        if ($loan->user_id == $user->uuid) {
            return fractal($loan, new LoanTransformer())
                ->serializeWith(new ArraySerializer())
                ->respond();
        }
        if ($user->hasPermissionTo('List loan requests')) {
            return fractal($loan, new LoanTransformer())
                ->parseIncludes(['user'])
                ->serializeWith(new ArraySerializer())
                ->respond();
        }

        return response()->json(["success" => false], 401);
    }

    public function update(Request $request, Loan $loan): JsonResponse
    {
        $request->validate([
            'status' => 'required',
        ]);
        if ($request->status != 'active') {
            $request->validate([
                'paid_at' => 'required',
            ]);
        }
        $loan->status = $request->status;
        $loan->paid_at = $request->paid_at;
        $loan->save();
        return fractal($loan, new LoanTransformer())
            ->parseIncludes(['user'])
            ->serializeWith(new ArraySerializer())
            ->respond();
    }
}
