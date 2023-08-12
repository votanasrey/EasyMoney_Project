<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Transformers\Users\UserTransformer;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Spatie\Fractalistic\ArraySerializer;

class RegisterController extends Controller
{
    public function store(Request $request): JsonResponse
    {
        $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'phone_number' => 'required|unique:users,phone_number|max:15',
            'password' => 'required|min:8|confirmed',
            'gender' => 'required',
            'date_of_birth'  => 'required',
            'address' => 'required',
        ]);
        $request['kyc_verified'] = false;
        $user = User::create($request->all());
        $user->assignRole('User');
        event(new Registered($user));

        return fractal($user, new UserTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }
}
