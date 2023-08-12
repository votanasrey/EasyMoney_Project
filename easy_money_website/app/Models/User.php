<?php

namespace App\Models;

use App\Support\HasRolesUuid;
use App\Support\HasSocialLogin;
use App\Support\UuidScopeTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticate;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Laravel\Passport\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

/**
 * Class User.
 * @method where(string $string, $value)
 * @method static byUuid($uuid)
 */
class User extends Authenticate
{
    use Notifiable, UuidScopeTrait, HasFactory, HasApiTokens, HasRoles, SoftDeletes, HasSocialLogin, HasRolesUuid {
        HasRolesUuid::getStoredRole insteadof HasRoles;
    }

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = [
        'deleted_at',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'uuid',
        'first_name',
        'last_name',
        'phone_number',
        'gender',
        'date_of_birth',
        'address',
        'kyc_verified',
        'user_profile',
        'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function products(): HasMany
    {
        return $this->hasMany(Product::class, 'user_id', 'uuid');
    }

    public function loanRequests(): HasMany
    {
        return $this->hasMany(LoanRequest::class, 'user_id', 'uuid');
    }

    public function loans(): HasMany
    {
        return $this->hasMany(Loan::class,'user_id', 'uuid');
    }

    public function socialProviders(): HasMany
    {
        return $this->hasMany(SocialProvider::class);
    }

    /////////////////////////////////////////////////////////
    public static function create(array $attributes = [])
    {
        if (array_key_exists('password', $attributes)) {
            $attributes['password'] = Hash::make($attributes['password']);
        }

        return static::query()->create($attributes);
    }

    public function findForPassport($value)
    {
        return $this->where('phone_number', $value)->first();
    }
}
