<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;

// ===========================
// DASHBOARD ADMIN
// ===========================
Route::get('/admin/statistik', [DashboardController::class, 'statistik']);
