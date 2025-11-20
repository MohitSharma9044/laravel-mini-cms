<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Page;
use App\Models\Media;
use App\Models\User;

class DashboardController extends Controller
{
    public function stats()
    {
        return response()->json([
            'posts' => Post::count(),
            'pages' => Page::count(),
            'media' => Media::count(),
            'users' => User::count(),
        ]);
    }
}

