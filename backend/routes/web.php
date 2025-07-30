<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\InvoiceController;

Route::get('/', function () {
    return view('welcome');
});
Route::get('/invoice/pdf/{id}', [InvoiceController::class, 'cetak']);
