<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\DashboardController;

// ===========================
// DASHBOARD ADMIN
// ===========================
Route::get('/admin/statistik', [DashboardController::class, 'statistik']);

// ===========================
// AUTH
// ===========================
// REGISTER
Route::post('/register', function (Request $request) {
    $validated = $request->validate([
        'username' => 'required|string|max:255',
        'email' => 'required|string|email|unique:users',
        'password' => 'required|string|min:6',
    ]);

    $user = User::create([
        'username' => $validated['username'],
        'email' => $validated['email'],
        'password' => Hash::make($validated['password']),
    ]);

    return response()->json(['message' => 'Register berhasil', 'user' => $user]);
});

// LOGIN
Route::post('/login', function (Request $request) {
    $user = User::where('username', $request->username)->first();

    if (!$user || !Hash::check($request->password, $user->password)) {
        return response()->json(['message' => 'Login gagal'], 401);
    }

    $role = $user->username === 'admin' ? 'admin' : 'user';

    return response()->json([
        'message' => 'Login berhasil',
        'role' => $role,
        'user' => $user,
    ]);
});

// ===========================
// USER CRUD
// ===========================
Route::get('/users', [UserController::class, 'index']);
Route::get('/users/{id}', [UserController::class, 'show']);
Route::post('/users', [UserController::class, 'store']);
Route::put('/users/{id}', [UserController::class, 'update']);
Route::delete('/users/{id}', [UserController::class, 'destroy']);
