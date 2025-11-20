<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Page;
use Illuminate\Support\Str;
use App\Http\Requests\PageRequest;

class PageController extends Controller
{
    // List all pages
    public function index()
    {
        $pages = Page::orderBy('created_at', 'desc')->get();
        return response()->json(['data' => $pages], 200);
    }

    // Create a new page
    public function store(PageRequest $request)
    {
        $request->validated();
$published = $request->has('published') && $request->published ? 1 : 0;
        $page = Page::create([
            'title' => $request->title,
            'slug' => Str::slug($request->title),
            'content' => $request->content,
            'published' => $published,
        ]);

        return response()->json(['data' => $page], 201);
    }

    // Update a page
    public function update(PageRequest $request, Page $page)
    {
        $request->validated();

        $page->update([
            'title' => $request->title,
            'slug' => Str::slug($request->title),
            'content' => $request->content,
            'published' => $request->published ?? false,
        ]);

        return response()->json(['data' => $page], 200);
    }

    // Delete a page
    public function destroy(Page $page)
    {
        $page->delete();
        return response()->json(['message' => 'Page deleted'], 200);
    }
}
