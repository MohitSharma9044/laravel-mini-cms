<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Post;
use Illuminate\Support\Str;

class PostSeeder extends Seeder
{
    public function run(): void
    {
        // --- 3 Manually Created Posts ---
        $posts = [
            [
                'title' => 'How to Use Laravel 12 Effectively',
                'content' => 'Laravel 12 brings several new improvements...',
                'published' => true,
                'user_id' => 1,
            ],
            [
                'title' => 'React + Laravel 12 Full Stack Guide',
                'content' => 'This guide explains how to connect React with Laravel 12...',
                'published' => true,
                'user_id' => 1,
            ],
            [
                'title' => 'Why You Should Upgrade to Laravel 12',
                'content' => 'Laravel 12 introduces new architecture improvements...',
                'published' => false,
                'user_id' => 1,
            ],
        ];

        foreach ($posts as $post) {
            Post::create([
                'title' => $post['title'],
                'slug' => Str::slug($post['title']) . '-' . Str::random(5),
                'content' => $post['content'],
                'published' => $post['published'],
                'user_id' => $post['user_id'],
            ]);
        }

        // --- 20 Fake Posts from Factory ---
        Post::factory()->count(20)->create();
    }
}
