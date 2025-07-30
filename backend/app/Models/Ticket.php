<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;

    protected $fillable = [
        'event_id',
        'nama',
        'harga',
        'stock',
    ];

    public function event()
    {
        return $this->belongsTo(Event::class, 'event_id');
    }

    // 🔁 Relasi ke Pemesanan (pivot)
    public function pemesanans()
    {
        return $this->belongsToMany(\App\Models\Pemesanan::class, 'pemesanan_ticket')
                    ->withPivot('qty')
                    ->withTimestamps();
    }
}
