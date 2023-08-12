<?php

namespace App\Transformers\Users;

use App\Models\Role;
use League\Fractal\Resource\Collection;
use League\Fractal\TransformerAbstract;

/**
 * Class RolTransformer.
 */
class RoleTransformer extends TransformerAbstract
{
    /**
     * @var array
     */
    protected $defaultIncludes = ['permissions'];

    /**
     * @param Role $model
     * @return array
     */
    public function transform(Role $model): array
    {
        return [
            'id' => $model->uuid,
            'name' => $model->name,
            'created_at' => $model->created_at->toIso8601String(),
            'updated_at' => $model->updated_at->toIso8601String(),
        ];
    }

    /**
     * @param Role $model
     * @return Collection
     */
    public function includePermissions(Role $model): Collection
    {
        return $this->collection($model->permissions, new PermissionTransformer());
    }
}
