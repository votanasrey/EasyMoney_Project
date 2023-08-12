<?php

namespace App\Transformers\Users;

use App\Models\User;
use League\Fractal\Resource\Collection;
use League\Fractal\TransformerAbstract;

/**
 * Class UserTransformer.
 */
class UserTransformer extends TransformerAbstract
{
    /**
     * @var array
     */
    protected $availableIncludes = ['roles'];

    /**
     * @param User $model
     * @return array
     */
    public function transform(User $model): array
    {
        return [
            'id' => $model->uuid,
            'first_name' => $model->first_name,
            'last_name' => $model->last_name,
            'phone_number' => $model->phone_number,
            'gender' => $model->gender,
            'date_of_birth' => $model->date_of_birth,
            'address' => $model->address,
            'user_profile' => $model->user_profile,
            'kyc_verified' => $model->kyc_verified,
            'phone_number_verified_at' => $model->phone_number_verified_at,
            'created_at' => $model->created_at->toIso8601String(),
            'updated_at' => $model->updated_at->toIso8601String(),
        ];
    }

    /**
     * @param User $model
     * @return Collection
     */
    public function includeRoles(User $model): Collection
    {
        return $this->collection($model->roles, new RoleTransformer());
    }
}
