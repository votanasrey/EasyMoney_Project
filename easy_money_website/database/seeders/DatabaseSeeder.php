<?php

namespace Database\Seeders;

use App\Models\Product;
use Database\Factories\ProductImageFactory;
use Database\Seeders\Data\CategoryTableSeeder;
use Database\Seeders\Users\RoleTableSeeder;
use Database\Seeders\Users\UsersTableSeeder;
use App\Models\ProductImage;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeders.
     *
     * @return void
     */
    public function run()
    {
//        ProductImage::factory(3)->create();
        $this->call(RoleTableSeeder::class);
        $this->call(UsersTableSeeder::class);
//        $this->call(CategoryTableSeeder::class);
//        Product::factory(3)->create();
//        $users = \App\Models\User::factory(10)->create()->assignRole('User');
    }
}
