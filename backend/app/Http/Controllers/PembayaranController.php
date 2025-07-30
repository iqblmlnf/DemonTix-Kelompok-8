<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pemesanan;
use Illuminate\Support\Facades\Storage;

class PembayaranController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'pemesanan_id' => 'required|exists:pemesanans,id',
            'metode' => 'required|string',
            'bukti' => 'required|image|max:2048', 
        ]);

        $pemesanan = Pemesanan::findOrFail($request->pemesanan_id);

        $path = $request->file('bukti')->store('bukti_pembayaran', 'public');

        $pemesanan->metode_pembayaran = $request->metode;
        $pemesanan->bukti_pembayaran = $path;
        $pemesanan->status = 'waiting'; 
        $pemesanan->save();

        return response()->json([
            'message' => 'Pembayaran berhasil disimpan.',
            'pemesanan' => $pemesanan,
            'bukti_url' => asset('storage/' . $path),
        ]);
    }
}
