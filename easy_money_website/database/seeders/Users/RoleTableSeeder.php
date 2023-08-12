<?php

namespace Database\Seeders\Users;

use App\Models\Permission;
use App\Models\Role;
use Illuminate\Database\Seeder;
use Illuminate\Support\Collection;

class RoleTableSeeder extends Seeder
{
    /**
     * @var array|Collection
     */
    public $roles = [
        ['name' => 'SuperAdmin'],
        ['name' => 'User'],
        ['name' => 'Admin']
    ];

    /**
     * @var array|Collection
     */
    public $permissions = [
        'users' => [
            ['name' => 'List users'],
            ['name' => 'Create users'],
            ['name' => 'Delete users'],
            ['name' => 'Update users'],
        ],
        'roles' => [
            ['name' => 'List roles'],
            ['name' => 'Create roles'],
            ['name' => 'Delete roles'],
            ['name' => 'Update roles'],
        ],
        'permissions' => [
            ['name' => 'List permissions'],
        ],
        'Products' => [
            ['name' => 'List products'],
            ['name' => 'Create products'],
            ['name' => 'Update products'],
            ['name' => 'Delete products'],
        ],
        'product_images' => [
            ['name' => 'List product_images'],
            ['name' => 'Create product_images'],
            ['name' => 'Update product_images'],
            ['name' => 'Delete product_images'],
        ],
        'loan_requests' => [
            ['name' => 'List loan requests'],
            ['name' => 'Create loan requests'],
            ['name' => 'Update loan requests'],
            ['name' => 'Delete loan requests'],
        ],
        'loans' => [
            ['name' => 'List loans'],
            ['name' => 'Create loans'],
            ['name' => 'Update loans'],
            ['name' => 'Delete loans'],
        ],
        'transactions' => [
            ['name' => 'List transactions'],
            ['name' => 'Create transactions'],
            ['name' => 'Update transactions'],
            ['name' => 'Delete transactions'],
        ],
        'categories' => [
            ['name' => 'List categories'],
            ['name' => 'Create categories'],
            ['name' => 'Update categories'],
            ['name' => 'Delete categories'],
        ],
    ];

    /**
     * Run the database seeders.
     *
     * @return void
     */
    public function run()
    {
       $this->createRoles()->createPermissions()->assignAllPermissionsToAdminRole();
        // $this->createPermissions()->assignAllPermissionsToAdminRole();
        // $this->createRoles()->assignAllPermissionsToAdminRole();
    }

    /**
     * @return $this
     */
    public function createRoles(): RoleTableSeeder
    {
        $this->roles = collect($this->roles)->map(function ($role) {
            return Role::create($role);
        });

        return $this;
    }

    /**
     * @return $this
     */
    public function createPermissions(): RoleTableSeeder
    {
        $this->permissions = collect($this->permissions)->map(function ($group) {
            return collect($group)->map(function ($permission) {
                return Permission::create($permission);
            });
        });

        return $this;
    }

    /**
     * @return $this
     */
    public function assignAllPermissionsToAdminRole(): RoleTableSeeder
    {
        $superAdmin = Role::where('name', 'SuperAdmin')->get()->firstOrfail();
        $admin = Role::where('name', 'Admin')->get()->firstOrfail();
        $superAdmin->givePermissionTo(Permission::all());
        $admin->givePermissionTo(Permission::all());

        return $this;
    }
}
