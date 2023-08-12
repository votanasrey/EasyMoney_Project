<?php

namespace App\Transformers\Data;

use App\Models\Loan;
use App\Transformers\TransactionTransformer;
use App\Transformers\Users\UserTransformer;
use League\Fractal\Resource\Collection;
use League\Fractal\Resource\Item;
use League\Fractal\TransformerAbstract;

class LoanTransformer extends TransformerAbstract
{
    /**
     * List of resources possible to include
     *
     * @var array
     */
    protected $availableIncludes = [
        'user',
        'loan_request',
        'transactions'
    ];

    /**
     * A Fractal transformer.
     *
     * @param Loan $loan
     * @return array
     */
    public function transform(Loan $loan): array
    {
        return [
            'id' => $loan->id,
            'loan_mount' => $loan->loan_amount,
            'pay_mount' => $loan->pay_amount,
            'start_date' => $loan->start_date,
            'end_date' => $loan->end_date,
            'status' => $loan->status,
            'paid_at' => $loan->paid_at,
        ];
    }

    public function includeUser(Loan $loan): Item
    {
        return $this->item($loan->user, new UserTransformer());
    }

    public function includeLoanRequest(Loan $loan): Item
    {
        return $this->item($loan->loanRequest, new LoanRequestTransformer());
    }

    public function includeTransactions(Loan $loan): Collection
    {
        return $this->collection($loan->transactions, new TransactionTransformer());
    }
}
