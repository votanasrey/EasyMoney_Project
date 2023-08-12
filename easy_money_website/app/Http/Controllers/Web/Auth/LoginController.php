<?php

namespace App\Http\Controllers\Web\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function index() {
        if (Auth::guard('web')->check()) {
            return redirect('dashboard');
        }
        return view('login');
    }

    public function login(Request $request)
    {
        if (Auth::guard('web')->check()) {
            return redirect('dashboard');
        }

        $request->validate([
            'phone_number' => ['required'],
            'password' => ['required'],
        ]);

        $user = User::query()
            ->where('phone_number', '=', $request['phone_number'])
            ->get()->first();

        if ($user != null && Hash::check($request['password'], $user->password)) {
            if ($user->hasRole('SuperAdmin') || $user->hasRole('Admin')) {
                Auth::guard('web')->login($user);
                return redirect('dashboard');
            }
        }

        return back()->withErrors([
            'The provided credentials do not match our records.',
        ]);
    }
}
