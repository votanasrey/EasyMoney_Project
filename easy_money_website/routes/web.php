<?php

use App\Http\Controllers\Web\Auth\AuthController;
use App\Http\Controllers\Web\Auth\LoginController;
use App\Http\Controllers\Web\Data\AdminsController;
use App\Http\Controllers\Web\Data\DashboardController;
use App\Http\Controllers\Web\Data\LoansController;
use App\Http\Controllers\Web\Data\ProductsController;
use App\Http\Controllers\Web\Data\UsersController;
use Illuminate\Support\Facades\Route;

Route::view('/apidocs', 'apidocs');

Route::get('/', [AuthController::class, 'authCheck']);

Route::get('/login', [LoginController::class, 'index'])->name('login');

Route::post('/login', [LoginController::class, 'login'])->name('auth');

Route::group(['middleware' => ['auth:web']], function () {

    Route::get('logout', [AuthController::class, 'logout'])->name('logout');

    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    Route::get('/products', [ProductsController::class, 'index'])->name('products');

    Route::get('/loans', [LoansController::class, 'index'])->name('loans');

    Route::post('/loans/{loanRequest}', [LoansController::class, 'update'])->name('update-loans');

    Route::get('/users', [UsersController::class, 'index'])->name('users');

    Route::get('/admins', [AdminsController::class, 'index'])->name('admins');

    Route::post('/admins', [AdminsController::class, 'store'])->name('create-admin');

});

