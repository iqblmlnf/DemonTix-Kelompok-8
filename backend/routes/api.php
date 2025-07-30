<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\EventController;
use App\Http\Controllers\TicketController;
use App\Http\Controllers\API\ContactController;
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

// ===========================
// CONTACT (HUBUNGI KAMI)
// ===========================
Route::apiResource('contact', ContactController::class)->only(['index', 'store', 'destroy']);

// ===========================
// EVENT CRUD
// ===========================
Route::get('/events', [EventController::class, 'index']);
Route::get('/events/{id}', [EventController::class, 'show']);
Route::post('/events', [EventController::class, 'store']);
Route::put('/events/{id}', [EventController::class, 'update']);
Route::delete('/events/{id}', [EventController::class, 'destroy']);

// ===========================
// TIKET
// ===========================
// Semua tiket
Route::get('/tickets', [TicketController::class, 'index']);
Route::get('/tickets/{id}', [TicketController::class, 'show']);

// Tiket per event & CRUD
Route::prefix('tickets')->group(function () {
    Route::get('/event/{eventId}', [TicketController::class, 'indexByEvent']);
    Route::post('/', [TicketController::class, 'store']);
    Route::put('/{ticket}', [TicketController::class, 'update']);
    Route::delete('/{ticket}', [TicketController::class, 'destroy']);
});
