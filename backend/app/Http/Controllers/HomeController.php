<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Page;

class HomeController extends Controller
{
    public function index()
    {
        $posts = Post::where('published',true)->latest()->take(6)->get();
        return view('welcome', compact('posts'));
    }

    public function blog()
    {
        $posts = Post::where('published',true)->latest()->paginate(10);
        return view('blog.index', compact('posts'));
    }

    public function detail($slug)
    {
        $post = Post::where('slug',$slug)->firstOrFail();
        return view('blog.detail', compact('post'));
    }

    public function page($slug)
    {
        $page = Page::where('slug',$slug)->firstOrFail();
        return view('page', compact('page'));
    }

    public function contact()
    {
        return view('contact');
    }

        public function about()
    {
        return view('about');
    }
}
