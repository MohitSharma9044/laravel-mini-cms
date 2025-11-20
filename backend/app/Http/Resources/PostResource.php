<?php
namespace App\Http\Resources;
use Illuminate\Http\Resources\Json\JsonResource;

class PostResource extends JsonResource
{
   public function toArray($request)
{
    return [
        'id' => $this->id,
        'title' => $this->title,
        'slug' => $this->slug,
        'excerpt' => $this->excerpt,
        'content' => $this->content,
        'published' => $this->published,
        'published_at' => $this->published_at,
        'featured_image' => $this->featured_image ? asset('storage/' . $this->featured_image) : null,
        'meta' => [
            'title' => $this->meta['title'] ?? null,
            'description' => $this->meta['description'] ?? null,
        ],
        'author' => [
            'id' => $this->user->id ?? null,
            'name' => $this->user->name ?? null,
        ],
        'created_at' => $this->created_at,
        'updated_at' => $this->updated_at,
    ];
}

}
