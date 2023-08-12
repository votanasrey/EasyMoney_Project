<?php

namespace Database\Seeders\Users;

use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeders.
     *
     * @return void
     */
    public function run()
    {
        $users = [
            [
                'first_name' => 'Ossa',
                'last_name' => 'Soeun',
                'phone_number' => '+85593997801',
                'gender' => 'Male',
                'date_of_birth' => Carbon::create(2000, 07, 26)->toDateTime(),
                'address' => 'Takeo',
                'kyc_verified' => true,
                'password' => '11223344',
            ],
            [
                'first_name' => 'Manuth',
                'last_name' => 'Vann',
                'phone_number' => '+85586586696',
                'gender' => 'Female',
                'date_of_birth' => Carbon::create(2002, 01, 06)->toDateTime(),
                'address' => 'Takeo',
                'kyc_verified' => true,
                'password' => '11223344',
            ],
        ];
        collect($users)->map(function ($user){
            $registeredUser = User::create($user);
            $registeredUser->assignRole('SuperAdmin');
        });
    }
}
