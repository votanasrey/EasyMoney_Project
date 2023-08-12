<?php

namespace App\Http\Controllers\Api\Users;

use App\Exceptions\StoreResourceFailedException;
use App\Http\Controllers\Controller;
use App\Transformers\Users\UserTransformer;
use Illuminate\Contracts\Hashing\Hasher;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Spatie\Fractalistic\ArraySerializer;

class ProfileController extends Controller
{
    public function index(): JsonResponse
    {
        return fractal(Auth::user(), new UserTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    /**
     * @throws ValidationException
     */
    public function update(Request $request): JsonResponse
    {
        $user = Auth::user();
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
        $this->validate($request, $rules);
        // Except password as we don't want to let the users change a password from this endpoint
        $user->update($request->except('_token', 'password'));

        return fractal($user->fresh(), new UserTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    /**
     * @throws StoreResourceFailedException
     * @throws ValidationException
     */
    public function updatePassword(Request $request): JsonResponse
    {
        $user = Auth::user();
        $this->validate($request, [
            'current_password' => 'required',
            'password' => 'required|min:8|confirmed',
        ]);
        // verify the old password given is valid
        if (! app(Hasher::class)->check($request->get('current_password'), $user->password)) {
            throw new StoreResourceFailedException('Validation Issue', [
                'old_password' => 'The current password is incorrect',
            ]);
        }
        $user->password = bcrypt($request->get('password'));
        $user->save();

        return fractal($user->fresh(), new UserTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }
}
