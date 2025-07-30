<?php
namespace App\Http\Controllers;

use App\Models\Ticket;
use Illuminate\Http\Request;

class TicketController extends Controller
{
    public function index($eventId = null)
    {
        if ($eventId) {
            $tickets = Ticket::where('event_id', $eventId)
            ->with('event')
                ->orderBy('created_at', 'desc')
                ->get();
        } else {
            $tickets = Ticket::with('event')
                ->orderBy('created_at', 'desc')
                ->get();
        }

        return response()->json([
            'tickets' => $tickets
        ]);
    }

    public function indexByEvent($eventId)
    {
        $tickets = Ticket::where('event_id', $eventId)->get();
        return response()->json(['tickets' => $tickets]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'event_id' => 'required|exists:events,id',
            'nama' => 'required|string',
            'harga' => 'required|integer',
            'stock' => 'required|integer',
        ]);

        return Ticket::create($validated);
    }

    public function update(Request $request, Ticket $ticket)
    {
        $validated = $request->validate([
            'event_id' => 'required|exists:events,id',
            'nama' => 'required|string',
            'harga' => 'required|integer',
            'stock' => 'required|integer',
        ]);

        $ticket->update($validated);
        return response()->json(['message' => 'Tiket berhasil diperbarui', 'ticket' => $ticket]);
    }

    public function destroy(Ticket $ticket)
    {
        $ticket->delete();
        return response()->json(['message' => 'Ticket deleted']);
    }

    public function show($id)
    {
        $ticket = Ticket::find($id);
        if (!$ticket) {
            return response()->json(['message' => 'Tiket tidak ditemukan'], 404);
        }
        return response()->json($ticket);
    }
}
