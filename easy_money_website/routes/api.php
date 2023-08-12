<?php

use App\Http\Controllers\Api\Assets\UploadFileController;
use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\OtpController;
use App\Http\Controllers\Api\Auth\PasswordsController;
use App\Http\Controllers\Api\Auth\RegisterController;
use App\Http\Controllers\Api\Data\CategoryController;
use App\Http\Controllers\Api\Data\LoanController;
use App\Http\Controllers\Api\Data\LoanRequestController;
use App\Http\Controllers\Api\Data\ProductController;
use App\Http\Controllers\Api\Data\ProductImageController;
use App\Http\Controllers\Api\PingController;
use App\Http\Controllers\Api\Users\ProfileController;
use App\Http\Controllers\Api\Users\RolesController;
use App\Http\Controllers\Api\Users\UsersController;
use App\Http\Controllers\Web\Data\AdminsController;
use Illuminate\Support\Facades\Route;

Route::get('ping', [PingController::class, 'index']);

Route::post('login', [LoginController::class, 'login']);

Route::post('otp', [OtpController::class, 'send']);

//Route::post('/admins', [AdminsController::class, 'store'])->name('create-admin');

//Route::get('products-images/{uuid}/render', [ProductImageController::class, 'show']);

Route::post('register', [RegisterController::class, 'store']);
Route::post('passwords/reset', [PasswordsController::class, 'store']);
Route::put('passwords/reset', [PasswordsController::class, 'update']);

Route::get('categories', [CategoryController::class, 'index']);
Route::get('categories/{category}', [CategoryController::class, 'show']);

Route::get('products', [ProductController::class, 'index']);
Route::get('products/{product}', [ProductController::class, 'show']);

Route::group(['middleware' => ['auth:api']], function () {
    Route::group(['prefix' => 'users'], function () {
        Route::get('/', [UsersController::class, 'index']);
        Route::post('/', [UsersController::class, 'store']);
        Route::get('/{uuid}', [UsersController::class, 'show']);
        Route::put('/{uuid}', [UsersController::class, 'update']);
        Route::patch('/{uuid}', [UsersController::class, 'update']);
        Route::delete('/{uuid}', [UsersController::class, 'destroy']);
    });

    Route::group(['prefix' => 'roles'], function () {
        Route::get('/', [RolesController::class, 'index']);
        Route::post('/', [RolesController::class, 'store']);
        Route::get('/{uuid}', [RolesController::class, 'show']);
        Route::put('/{uuid}', [RolesController::class, 'update']);
        Route::patch('/{uuid}', [RolesController::class, 'update']);
        Route::delete('/{uuid}', [RolesController::class, 'destroy']);
    });

    Route::get('permissions', 'Api\Users\PermissionsController@index');

    Route::group(['prefix' => 'me'], function () {
        Route::get('/', [ProfileController::class, 'index']);
        Route::put('/', [ProfileController::class, 'update']);
        Route::patch('/', [ProfileController::class, 'update']);
        Route::put('/password', [ProfileController::class, 'updatePassword']);
    });

    Route::group(['prefix' => 'assets'], function () {
        Route::post('/', [UploadFileController::class, 'store']);
    });

    Route::group(['prefix' => 'categories'], function () {
        Route::post('/', [CategoryController::class, 'store']);
        Route::put('/{category}', [CategoryController::class, 'update']);
        Route::delete('/{category}', [CategoryController::class, 'destroy']);
    });

    Route::group(['prefix' => 'products'], function () {
        Route::post('/', [ProductController::class, 'store']);
        Route::put('/{product}', [ProductController::class, 'update']);
        Route::delete('/{product}', [ProductController::class, 'destroy']);
    });

    Route::get('/my-products', [ProductController::class, 'myProduct']);

//    Route::post('assets', [UploadFileController::class, 'store']);
    Route::group(['prefix' => 'product-images'], function () {
        Route::post('/{product}', [ProductImageController::class, 'store']);
    });

    Route::delete('logout', [LoginController::class, 'logout']);

    Route::group(['prefix' => 'loan-requests'], function () {
        Route::get('/', [LoanRequestController::class, 'index']);
        Route::post('/', [LoanRequestController::class, 'store']);
        Route::get('/{loanRequest}', [LoanRequestController::class, 'show']);
        Route::put('/{loanRequest}', [LoanRequestController::class, 'update']);
        Route::delete('/{loanRequest}', [LoanRequestController::class, 'destroy']);
    });

    Route::group(['prefix' => 'loans'], function () {
        Route::get('/', [LoanController::class, 'index']);
        Route::post('/{loanRequest}', [LoanController::class, 'store']);
        Route::put('/{loan}', [LoanController::class, 'update']);
    });
});
