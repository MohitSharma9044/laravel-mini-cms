<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Http\Resources\PostResource;
use Illuminate\Support\Str;
use App\Http\Requests\PostStoreRequest;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->except(['index', 'show']);
    }

    // List
    public function index()
    {
        $posts = Post::latest()->paginate(10);
        return PostResource::collection($posts);
    }

    // Show
    public function show(Post $post)
    {
        return new PostResource($post);
    }

    // Store
    public function store(PostStoreRequest $request)
    {
        $this->authorize('create', Post::class);

        $request->validated();

        $post = new Post();
        $post->title = $request->title;
        $post->slug = $request->slug ?: Str::slug($request->title);
        $post->content = $request->content;

        // FIXED
        $post->published = (bool) $request->published;

        $post->user_id = $request->user()->id;
        $post->meta = [
            'title' => $request->meta_title,
            'description' => $request->meta_description,
        ];

        if ($request->hasFile('featured_image')) {
            $post->featured_image = $request->file('featured_image')->store('posts', 'public');
        }

        $post->save();

        return new PostResource($post);
    }

    // Update
    public function update(PostStoreRequest $request, Post $post)
    {
        $this->authorize('update', $post);

        $request->validated();

        $post->title = $request->title;
        $post->slug = $request->slug ?: Str::slug($request->title);
        $post->content = $request->content;

        // FIXED
        $post->published = (bool) $request->published;

        $post->meta = [
            'title' => $request->meta_title,
            'description' => $request->meta_description,
        ];

        if ($request->hasFile('featured_image')) {

            if ($post->featured_image && Storage::disk('public')->exists($post->featured_image)) {
                Storage::disk('public')->delete($post->featured_image);
            }

            $post->featured_image = $request->file('featured_image')->store('posts', 'public');
        }

        $post->save();

        return new PostResource($post);
    }

    // Toggle publish
    public function togglePublish(Post $post)
    {
        $this->authorize('update', $post);
        $post->published = !$post->published;
        $post->save();

        return response()->json([
            'success' => true,
            'data' => $post,
            'message' => $post->published ? 'Post published' : 'Post unpublished',
        ]);
    }

    // Delete
    public function destroy(Post $post)
    {
        $this->authorize('delete', $post);
        $post->delete();
        return response()->json(['message' => 'Post deleted']);
    }
}

