<?php

namespace App\Transformers\Users;

use App\Models\Permission;
use League\Fractal\TransformerAbstract;

/**
 * Class PermissionTransformer.
 */
class PermissionTransformer extends TransformerAbstract
{
    public function transform(Permission $model): array
    {
        return [
            'id' => $model->uuid,
            'name' => $model->name,
            'created_at' => $model->created_at->toIso8601String(),
            'updated_at' => $model->updated_at->toIso8601String(),
        ];
    }
}
