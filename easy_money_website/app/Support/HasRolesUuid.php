<?php

namespace App\Support;

use App\Models\Role as RoleEntity;
use Spatie\Permission\Contracts\Role;

trait HasRolesUuid
{
    /**
     * @param $role
     *
     * @return Role
     */
    protected function getStoredRole($role): Role
    {
        if (is_string($role)) {
            return app(RoleEntity::class)->where('name', $role)->first();
        }

        return $role;
    }
}
