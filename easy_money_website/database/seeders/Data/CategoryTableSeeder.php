<?php

namespace Database\Seeders\Data;

use App\Models\Category;
use Illuminate\Database\Seeder;
use Illuminate\Support\Collection;

class CategoryTableSeeder extends Seeder
{
    /**
     * @var array|Collection
     */
    public $categories = [
        ['name' => 'Phones'],
        ['name' => 'Cars'],
        ['name' => 'Accessories'],
        ['name' => 'Lands'],
        ['name' => 'Houses'],
    ];

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createCategories();
    }

    public function createCategories(): CategoryTableSeeder
    {
        $this->categories = collect($this->categories)->map(function ($category){
            return Category::create($category);
        });
        return $this;
    }
}
