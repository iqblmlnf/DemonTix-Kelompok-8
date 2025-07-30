<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Event;
use App\Models\Pemesanan;

class DashboardController extends Controller
{
    public function statistik()
    {
        return response()->json([
            'total_user' => User::count(),
            'total_event' => Event::count(),
            'total_pemesanan' => Pemesanan::count(),
        ]);
    }
}
