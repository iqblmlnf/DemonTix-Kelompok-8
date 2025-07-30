<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pemesanan extends Model
{
    use HasFactory;

    protected $table = 'pemesanans';

    protected $fillable = [
        'nama',
        'email',
        'whatsapp',
        'subtotal',
        'total',
        'event_id',
        'qty', // ✅ pastikan ini ada!
        'metode_pembayaran',
        'status',
        'bukti_pembayaran',
    ];

    // Relasi dengan Event (jika ada model Event)
    public function event()
    {
        return $this->belongsTo(Event::class);
    }
}
