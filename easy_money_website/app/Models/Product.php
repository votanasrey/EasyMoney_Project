<?php

namespace App\Models;

use App\Traits\Uuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;


class Product extends Model
{
    use Uuids, HasFactory;

    protected $fillable = [
        'title',
        'price',
        'description',
        'category',
        'is_sold',
        'user_id',
    ];

    public function productImages(): HasMany
    {
        return $this->hasMany(ProductImage::class);
    }

//    public function category(): BelongsTo
//    {
//        return $this->belongsTo(Category::class);
//    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(
            User::class,
            'user_id',
            'uuid'
        );
    }
}
