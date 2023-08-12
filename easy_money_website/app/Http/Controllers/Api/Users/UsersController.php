<?php

namespace App\Http\Controllers\Api\Users;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Transformers\Users\UserTransformer;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:List users')->only('index');
        $this->middleware('permission:List users')->only('show');
        $this->middleware('permission:Create users')->only('store');
        $this->middleware('permission:Update users')->only('update');
        $this->middleware('permission:Delete users')->only('destroy');
    }

    public function index(Request $request): JsonResponse
    {
        $paginator = User::query()
            ->paginate($request->get('limit', config('app.pagination_limit', 20)));
        if ($request->has('limit')) {
            $paginator->appends('limit', $request->get('limit'));
        }

        return fractal($paginator, new UserTransformer())
            ->parseIncludes(['roles'])
            ->respond();
    }

    public function show($id): JsonResponse
    {
        /** @var User $user */
        $user = User::with('roles.permissions')->byUuid($id)->firstOrFail();

        return fractal($user, new UserTransformer())
            ->parseIncludes(['roles'])
            ->respond();
    }

    public function store(Request $request): JsonResponse
    {
        $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'phone_number' => 'required|unique:users,phone_number|max:15',
            'password' => 'required|min:8|confirmed',
            'gender'  => 'required',
            'date_of_birth'  => 'required',
            'address' => 'required',
        ]);
        $user = User::create($request->all());

        if ($request->has('roles')) {
            $user->syncRoles($request['roles']);
        } else {
            $user->assignRole('User');
        }

        return fractal($user, new UserTransformer())
            ->parseIncludes(['roles'])
            ->respond(201);
    }

    public function update(Request $request, $uuid): JsonResponse
    {
        $rules = [
            'first_name' => 'required',
            'last_name' => 'required',
            'phone_number' => 'required|unique:users,phone_number|max:15',
            'gender'  => 'required',
            'date_of_birth'  => 'required',
            'address' => 'required',
        ];
        if ($request->method() == 'PATCH') {
            $rules = [
                'first_name' => 'sometimes|required',
                'last_name' => 'sometimes|required',
                'phone_number' => 'sometimes|required|unique:users,phone_number|max:15',
                'gender'  => 'sometimes|required',
                'date_of_birth'  => 'sometimes|required',
                'address' => 'required',
            ];
        }
        $request->validate($rules);
        $user = User::byUuid($uuid)->firstOrFail();
        // Except password as we don't want to let the users change a password from this endpoint
        $user->update($request->except('_token', 'password'));
        if ($request->has('roles')) {
            $user->syncRoles($request['roles']);
        }

        return fractal($user->fresh(), new UserTransformer())
            ->parseIncludes(['roles'])
            ->respond();
    }

    public function destroy($uuid): JsonResponse
    {
        $user = User::byUuid($uuid)->firstOrFail();
        $user->delete();

        return response()->json(["success" => true], 204);
    }
}
