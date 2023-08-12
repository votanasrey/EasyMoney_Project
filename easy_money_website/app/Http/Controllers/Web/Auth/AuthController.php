<?php

namespace App\Http\Controllers\Web\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function authCheck(): RedirectResponse
    {
        if (Auth::guard('web')->check()) {
            return redirect('dashboard');
        }
        return redirect('login');
    }

    public function logout() {
        Auth::guard('web')->logout();
        return redirect('login');
    }
}
