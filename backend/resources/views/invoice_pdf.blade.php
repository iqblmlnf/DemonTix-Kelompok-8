<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Invoice Tiket</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            font-size: 14px;
            color: #333;
            padding: 30px;
            line-height: 1.6;
        }

        h2 {
            color: #c0392b;
            text-align: center;
            margin-bottom: 30px;
            text-transform: uppercase;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px 12px;
            border: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr td:first-child {
            font-weight: 600;
            background-color: #f2f2f2;
            width: 35%;
        }

        .footer {
            text-align: center;
            font-style: italic;
            color: #555;
            margin-top: 40px;
        }

        .status {
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
            display: inline-block;
        }

        .status.Berhasil {
            background-color: #27ae60;
            color: white;
        }

        .status['Menunggu Pembayaran'] {
            background-color: #f39c12;
            color: white;
        }

        .status.Gagal {
            background-color: #e74c3c;
            color: white;
        }
    </style>
</head>
<body>
    <h2>Invoice Pemesanan Tiket</h2>

    <table>
        <tr>
            <td>ID Pemesanan</td>
            <td>{{ $pemesanan->id }}</td>
        </tr>
        <tr>
            <td>Nama</td>
            <td>{{ $pemesanan->nama }}</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>{{ $pemesanan->email }}</td>
        </tr>
        <tr>
            <td>Metode Pembayaran</td>
            <td>{{ $pemesanan->metode_pembayaran }}</td>
        </tr>
        <tr>
            <td>Status</td>
            <td>
                <span class="status {{ $pemesanan->status }}">{{ $pemesanan->status }}</span>
            </td>
        </tr>
        <tr>
            <td>Total Pembayaran</td>
            <td>Rp {{ number_format($pemesanan->total, 0, ',', '.') }}</td>
        </tr>
        <tr>
            <td>Nama Event</td>
            <td>{{ $pemesanan->event->title ?? '-' }}</td>
        </tr>
        <tr>
            <td>Tanggal Event</td>
            <td>{{ \Carbon\Carbon::parse($pemesanan->event->date ?? null)->translatedFormat('d F Y') }}</td>
        </tr>
    </table>

    <div class="footer">
        Terima kasih telah memesan tiket di <strong>DemonTix</strong>. <br>
        Harap simpan invoice ini sebagai bukti pembayaran Anda.
    </div>
</body>
</html>
