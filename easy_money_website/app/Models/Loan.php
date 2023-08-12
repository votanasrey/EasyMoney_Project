<?php

namespace App\Models;

use App\Traits\Uuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Loan extends Model
{
    use HasFactory, Uuids;

    protected $fillable = [
        'loan_amount',
        'pay_amount',
        'start_date',
        'end_date',
        'paid_at',
        'status',
        'loan_request_id',
        'user_id',
    ];

    public function loanRequest(): BelongsTo
    {
        return $this->belongsTo(LoanRequest::class);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id', 'uuid');
    }

    public function transactions(): HasMany
    {
        return $this->hasMany(Transaction::class);
    }
}
