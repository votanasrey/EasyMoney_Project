<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition(): array
    {
        return [
            'title' => $this->faker->text(50),
            'price' => $this->faker->numberBetween(),
            'description' => $this->faker->text(),
            'category_id' => 'a93aaa1e-e7bf-4865-9245-b727e2b4b91e',
            'user_id' => 'f984b007-815c-3276-a80d-f1b61670a240',
        ];
    }
}
