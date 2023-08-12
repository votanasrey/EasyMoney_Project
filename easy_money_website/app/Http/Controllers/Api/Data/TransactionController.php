<?php

namespace App\Http\Controllers\Api\Data;

use App\Exceptions\BodyTooLargeException;
use App\Exceptions\StoreResourceFailedException;
use App\Http\Controllers\Api\Assets\RenderFileController;
use App\Http\Controllers\Api\Assets\UploadFileController;
use App\Http\Controllers\Controller;
use App\Models\Loan;
use App\Models\Transaction;
use App\Transformers\Data\TransactionTransformer;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\Fractalistic\ArraySerializer;

class TransactionController extends Controller
{
    public function show(Request $request, Transaction $transaction)
    {
        $user = Auth::user();
        if ($user == $transaction->user_id || $user->hasPermission('List transactions')) {
            $image = new RenderFileController();
            return $image->show($request, $transaction->image_path, 'transactions');
        }

        return response()->json(['success' => false]);
    }

    /**
     * @throws StoreResourceFailedException
     * @throws BodyTooLargeException
     */
    public function store(Request $request, Loan $loan): JsonResponse
    {
        $upload = new UploadFileController();
        $asset = $upload->store($request, 'transactions');

        $productImage = Transaction::create([
            'image_path' => $asset->uuid,
            'loan_id' => $loan->id,
        ]);

        return fractal($productImage, new TransactionTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }
}
