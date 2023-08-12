<?php

namespace App\Models;

use App\Traits\Uuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;

class LoanRequest extends Model
{
    use HasFactory, Uuids;

    protected $fillable = [
        'installment',
        'term',
        'borrower_month_income',
        'borrower_length_experience',
        'home_ownership',
        'address_state',
        'loan_amount',
        'bank_statement',
        'loan_predict',
        'pay_amount',
        'user_id',
        'status'
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id', 'uuid');
    }

    public function loan(): HasOne
    {
        return $this->hasOne(Loan::class);
    }
}
