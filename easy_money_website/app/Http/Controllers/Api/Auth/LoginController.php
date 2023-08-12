<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(Request $request): JsonResponse
    {
        $request->validate([
            'phone_number' => 'required',
            'password' => 'required',
        ]);

        $user = (new User)->where('phone_number', $request['phone_number'])->first();
        if ($user != null) {
            if (Hash::check($request['password'], $user->password)) {
                $token = $user->createToken('authUser');
                return response()->json($token);
            } else {
                return response()->json(['error' => 'Password is incorrect'], 401);
            }
        }

        return response()->json(['error' => 'Phone number not found'], 401);
    }

    public function logout(): JsonResponse
    {
        $user = Auth::user();
        $user->token()->delete();
        return response()->json(['success' => true]);
    }
}
