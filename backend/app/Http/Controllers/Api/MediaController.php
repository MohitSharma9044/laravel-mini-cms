<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Media;

class MediaController extends Controller
{
    public function index()
    {
        $media = Media::orderBy('created_at', 'desc')->get();
        return response()->json(['data' => $media]);
    }

    public function store(Request $request)
{
    $request->validate([
        'file' => 'required|file|mimes:jpg,jpeg,png,gif|max:5120'
    ]);

    $file = $request->file('file');

    // Create a unique filename
    $filename = time() . '_' . $file->getClientOriginalName();

    // Store the file using Storage facade in public disk
    $storedPath = Storage::disk('public')->putFileAs('media', $file, $filename);
    // $storedPath will be "media/filename.jpg"

    // Save media record
    $media = Media::create([
        'filename' => $filename,
        'path' => asset('storage/' . $storedPath), // public URL
        'mime' => $file->getClientMimeType(),
        'size' => $file->getSize(),
    ]);

    return response()->json(['data' => $media]);
}
    public function destroy($id)
    {
        $media = Media::findOrFail($id);
        $storagePath = 'public/media/' . basename($media->path);

        if (Storage::exists($storagePath)) {
            Storage::delete($storagePath);
        }

        $media->delete();

        return response()->json(['success' => true]);
    }
}
