<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Pemesanan;
use App\Models\Ticket;

class PemesananController extends Controller
{
    public function store(Request $request)
    {
        $data = $request->all();

        DB::beginTransaction();

        try {
$totalQty = collect($data['tiket'])->sum('qty');

$pemesanan = Pemesanan::create([
    'nama' => $data['pemesan']['nama'],
    'email' => $data['pemesan']['email'],
    'whatsapp' => $data['pemesan']['whatsapp'],
    'subtotal' => $data['subtotal'],
    'total' => $data['total'],
    'event_id' => $data['event_id'],
    'qty' => $totalQty,
    'metode_pembayaran' => $data['metode_pembayaran'] ?? 'Transfer Bank',
    'status' => 'pending',
]);

            foreach ($data['tiket'] as $item) {
                $ticket = Ticket::where('id', $item['id'])
                                ->lockForUpdate()
                                ->firstOrFail();

                if ($ticket->stock < $item['qty']) {
                    throw new \Exception("Stok tiket '{$ticket->nama}' tidak mencukupi.");
                }

                $ticket->stock -= $item['qty'];
                $ticket->save();
            }

            DB::commit();

            return response()->json([
                'message' => 'Pemesanan berhasil.',
                'id' => $pemesanan->id,
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();

            $status = str_contains($e->getMessage(), 'Stok tiket') ? 400 : 500;

            return response()->json([
                'message' => $e->getMessage(),
            ], $status);
        }
    }

    public function show($id)
    {
        $pemesanan = Pemesanan::with('event')->find($id);

        if (!$pemesanan) {
            return response()->json(['message' => 'Data pemesanan tidak ditemukan'], 404);
        }

        return response()->json($pemesanan);
    }

    public function index()
    {
        $pemesanans = Pemesanan::with('event')
        ->orderBy('created_at', 'desc')
        ->get();
        return response()->json($pemesanans);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'nama' => 'required|string',
            'email' => 'required|email',
            'whatsapp' => 'required|string',
            'event_id' => 'required|integer',
            'subtotal' => 'required|numeric',
            'total' => 'required|numeric',
            'status' => 'required|in:pending,waiting,success,failed',
            'kembalikan_stok' => 'sometimes|boolean',
            'kurangi_stok' => 'sometimes|boolean',
        ]);

        DB::beginTransaction();

        try {
            $pemesanan = Pemesanan::findOrFail($id);

            if ($pemesanan->status === 'pending') {
                return response()->json([
                    'message' => 'Tidak dapat mengedit pemesanan dengan status pending.',
                ], 403);
            }

            if (
                $request->status === 'failed' &&
                $pemesanan->status !== 'failed' &&
                $request->has('kembalikan_stok') &&
                $request->kembalikan_stok
            ) {
                $ticket = Ticket::lockForUpdate()->find($pemesanan->event_id);
                if ($ticket) {
                    $ticket->stock += $pemesanan->qty;
                    $ticket->save();
                }
            }

            if (
                $request->status === 'success' &&
                $pemesanan->status !== 'success' &&
                $request->has('kurangi_stok') &&
                $request->kurangi_stok
            ) {
                $ticket = Ticket::lockForUpdate()->find($pemesanan->event_id);
                if ($ticket) {
                    if ($ticket->stock < $pemesanan->qty) {
                        throw new \Exception("Stok tiket tidak mencukupi untuk menyetujui pemesanan ini.");
                    }
                    $ticket->stock -= $pemesanan->qty;
                    $ticket->save();
                }
            }

            $pemesanan->nama = $request->nama;
            $pemesanan->email = $request->email;
            $pemesanan->whatsapp = $request->whatsapp;
            $pemesanan->event_id = $request->event_id;
            $pemesanan->subtotal = $request->subtotal;
            $pemesanan->total = $request->total;
            $pemesanan->status = $request->status;
            $pemesanan->save();

            DB::commit();

            return response()->json(['message' => 'Pemesanan berhasil diperbarui.']);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Gagal memperbarui pemesanan.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function destroy($id)
    {
        $pemesanan = Pemesanan::find($id);

        if (!$pemesanan) {
            return response()->json(['message' => 'Data pemesanan tidak ditemukan'], 404);
        }

        $pemesanan->delete();
        return response()->json(['message' => 'Pemesanan berhasil dihapus']);
    }

    public function batalkan(Request $request)
    {
        $request->validate([
            'pemesanan_id' => 'required|exists:pemesanans,id',
        ]);

        DB::beginTransaction();

        try {
            $pemesanan = Pemesanan::findOrFail($request->pemesanan_id);

            if ($pemesanan->status === 'success') {
                return response()->json(['message' => 'Pemesanan sudah dibayar, tidak bisa dibatalkan.'], 400);
            }

            $this->kembalikanStok($pemesanan);

            $pemesanan->status = 'failed';
            $pemesanan->save();

            DB::commit();

            return response()->json(['message' => 'Pemesanan berhasil dibatalkan dan stok tiket dikembalikan.']);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Terjadi kesalahan saat membatalkan pemesanan.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    private function kembalikanStok(Pemesanan $pemesanan)
    {
        $ticket = Ticket::lockForUpdate()->find($pemesanan->event_id);
        if ($ticket) {
            $ticket->stock += $pemesanan->qty;
            $ticket->save();
        }
    }

}
