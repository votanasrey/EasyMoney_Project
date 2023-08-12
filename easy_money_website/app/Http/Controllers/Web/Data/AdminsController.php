<?php

namespace App\Http\Controllers\Web\Data;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Transformers\Users\UserTransformer;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\Fractalistic\ArraySerializer;

class AdminsController extends Controller
{
    public function index(Request $request)
    {
        $user = Auth::user();

        if ($user->hasRole('SuperAdmin')) {
            $paginator = User::query()
                ->orderBy('created_at', 'desc')
                ->role('Admin')
                ->paginate($request->get('limit', config('app.pagination_limit', 15)));
            if ($request->has('limit')) {
                $paginator->appends('limit', $request->get('limit'));
            }

            return view('admins')->with(['users' => $paginator]);
        }

        return response()->json(["message" => "Permission denied.", "status_code" => 401], 401);
    }

    public function store(Request $request)
    {
        $user = Auth::user();

        if ($user->hasRole('SuperAdmin')) {
            $request->validate([
                'first_name' => 'required',
                'last_name' => 'required',
                'phone_number' => 'required|unique:users,phone_number|max:15',
                'password' => 'required|min:8|confirmed',
                'gender' => 'required',
                'date_of_birth'  => 'required',
                'address' => 'required',
            ]);
            $request['kyc_verified'] = true;
            $user = User::create($request->all());
            $user->assignRole('Admin');
            event(new Registered($user));

            return fractal($user, new UserTransformer())
                ->serializeWith(new ArraySerializer())
                ->respond();
        }

        return response()->json(["message" => "Permission denied.", "status_code" => 401], 401);
    }
}
