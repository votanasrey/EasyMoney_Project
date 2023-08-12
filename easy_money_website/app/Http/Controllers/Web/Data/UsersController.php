<?php

namespace App\Http\Controllers\Web\Data;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    public function index(Request $request) {
        $paginator = User::query()
            ->orderBy('created_at', 'desc')
            ->paginate($request->get('limit', config('app.pagination_limit', 15)));
        if ($request->has('limit')) {
            $paginator->appends('limit', $request->get('limit'));
        }

        return view('users')->with(['users' => $paginator]);
    }
}
