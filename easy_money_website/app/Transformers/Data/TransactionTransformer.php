<?php

namespace App\Transformers\Data;

use App\Models\Transaction;
use League\Fractal\Resource\Item;
use League\Fractal\TransformerAbstract;

class TransactionTransformer extends TransformerAbstract
{
    /**
     * List of resources to automatically include
     *
     * @var array
     */
    protected $defaultIncludes = [
        //
    ];

    /**
     * List of resources possible to include
     *
     * @var array
     */
    protected $availableIncludes = [
        'loan'
    ];

    /**
     * A Fractal transformer.
     *
     * @param Transaction $transaction
     * @return array
     */
    public function transform(Transaction $transaction): array
    {
        return [
            'id' => $transaction->id,
            'loan_id' => $transaction->loan_id,
            'image_path' => $transaction->image_path,
        ];
    }

    public function includeLoan(Transaction $transaction): Item
    {
        return $this->item($transaction->loan, new TransactionTransformer());
    }
}
