<?php

namespace App\Models;

use App\Support\UuidScopeTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Asset.
 */
class Asset extends Model
{
    use UuidScopeTrait, HasFactory;

    /**
     * @var array
     */
    protected $guarded = ['id'];
}
