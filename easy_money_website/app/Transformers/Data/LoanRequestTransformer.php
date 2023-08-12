<?php

namespace App\Transformers\Data;

use App\Models\LoanRequest;
use App\Transformers\Users\UserTransformer;
use League\Fractal\Resource\Item;
use League\Fractal\TransformerAbstract;

class LoanRequestTransformer extends TransformerAbstract
{
    /**
     * List of resources possible to include
     *
     * @var array
     */
    protected $availableIncludes = [
        'user'
    ];

    /**
     * A Fractal transformer.
     *
     * @param LoanRequest $loanRequest
     * @return array
     */
    public function transform(LoanRequest $loanRequest): array
    {
        return [
            'id' => $loanRequest->id,
            'installment' => $loanRequest->installment,
            'term' => $loanRequest->term,
            'borrower_month_income' => $loanRequest->borrower_month_income,
            'borrower_length_experience' => $loanRequest->borrower_length_experience,
            'home_ownership' => $loanRequest->home_ownership,
            'address_state' => $loanRequest->address_state,
            'loan_amount' => $loanRequest->loan_amount,
            'loan_predict' => $loanRequest->loan_predict,
            'pay_amount' => $loanRequest->pay_amount,
            'bank_statement' => $loanRequest->bank_statement,
            'status' => $loanRequest->status,
        ];
    }

    public function includeUser(LoanRequest $loanRequest): Item
    {
        return $this->item($loanRequest->user, new UserTransformer());
    }
}
