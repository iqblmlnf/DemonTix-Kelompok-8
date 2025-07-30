<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pemesanan;
use PDF;

class InvoiceController extends Controller
{
    public function cetak($id)
    {
        $pemesanan = Pemesanan::findOrFail($id);

        $pdf = PDF::loadView('invoice_pdf', compact('pemesanan'));
        return $pdf->download('Invoice-' . $pemesanan->id . '.pdf');
    }
}

