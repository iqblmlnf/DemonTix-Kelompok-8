<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;

    public $timestamps = true;

    protected $fillable = [
        'title',
        'date',
        'time',
        'location',
        'category',
        'deskripsi',
        'syaratKetentuan',
        'image',
        'image1',
        'organizer',
        'socialLink'
    ];

    public function tickets()
    {
        return $this->hasMany(Ticket::class, 'event_id');

    }
}
