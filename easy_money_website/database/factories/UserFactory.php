<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class UserFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = User::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition(): array
    {
        return [
            'first_name' => $this->faker->firstNameMale,
            'last_name' => $this->faker->lastName,
            'uuid' => $this->faker->uuid,
            'phone_number' => $this->faker->numerify('+855########'),
            'gender' => 'Male',
            'date_of_birth' => now(),
            'address' => 'phnom penh',
            'phone_number_verified_at' => now(),
            'password' => '11112222', // password
            'remember_token' => Str::random(10),
        ];
    }
}
