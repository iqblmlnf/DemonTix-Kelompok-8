<?php
namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Event;
use Illuminate\Support\Facades\Storage;

class EventController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->query('search');

        $events = Event::when($search, function ($query) use ($search) {
            $query->where('title', 'like', "%{$search}%");
        })
        ->with('tickets')
        ->orderBy('created_at', 'desc')
        ->get();

        foreach ($events as $event) {
            $event->image = $event->image ? Storage::url($event->image) : null;
            $event->image1 = $event->image1 ? Storage::url($event->image1) : null;
        }

        return response()->json($events);

    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'date' => 'required|date',
            'time' => 'required|string',
            'location' => 'required|string',
            'category' => 'required|string',
            'deskripsi' => 'required|string',
            'syaratKetentuan' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'image1' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'organizer' => 'required|string',
            'socialLink' => 'nullable|string',
        ]);

        // Simpan file gambar jika ada
        if ($request->hasFile('image')) {
            $validated['image'] = $request->file('image')->store('events', 'public');
        }

        if ($request->hasFile('image1')) {
            $validated['image1'] = $request->file('image1')->store('events', 'public');
        }

        $event = \App\Models\Event::create($validated);

        return response()->json(['message' => 'Event berhasil dibuat', 'event' => $event]);
    }

    public function show($id)
    {
        $event = Event::with('tickets')->findOrFail($id);

        $event->image = $event->image ? Storage::url($event->image) : null;
        $event->image1 = $event->image1 ? Storage::url($event->image1) : null;

        $event->tickets->transform(function ($ticket) {
            return [
                'id' => $ticket->id,
                'nama' => $ticket->nama,
                'harga' => $ticket->harga,
                'stock' => $ticket->stock,
            ];
        });

        return response()->json($event);
    }

    public function update(Request $request, $id)
    {
        $event = Event::findOrFail($id);

        $event->title = $request->title;
        $event->date = $request->date;
        $event->time = $request->time;
        $event->location = $request->location;
        $event->category = $request->category;
        $event->deskripsi = $request->deskripsi;
        $event->syaratKetentuan = $request->syaratKetentuan;
        $event->organizer = $request->organizer;
        $event->socialLink = $request->socialLink;

        if ($request->hasFile('image')) {
            $filename = $request->file('image')->getClientOriginalName();
            $path = $request->file('image')->storeAs('events', $filename);
            $event->image = 'events/'.$filename;
        }

        if ($request->hasFile('image1')) {
            $filename1 = $request->file('image1')->getClientOriginalName();
            $path1 = $request->file('image1')->storeAs('events', $filename1);
            $event->image1 = 'events/'.$filename1;
        }

        $event->save();

        return response()->json(['message' => 'Event berhasil diperbarui', 'event' => $event]);
    }

    public function destroy($id)
    {
        $event = Event::findOrFail($id);
        $event->delete();

        return response()->json(['message' => 'Event berhasil dihapus']);
    }
}
