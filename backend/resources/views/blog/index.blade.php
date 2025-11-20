@extends('layout')
@section('title','Posts')
@section('content')

<div class="container py-4">
    <h1 class="mb-4">Posts</h1>

    <div class="row">
    @foreach($posts as $post)
    <div class="col-md-4 mb-4">
        <div class="card shadow-sm h-100">
            @if($post->featured_image)
                <img src="{{ asset('storage/' . $post->featured_image) }}" class="card-img-top" alt="{{ $post->title }}" style="height:200px; object-fit:cover;">
            @endif
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">
                    <a href="{{ url('posts/'.$post->slug) }}" class="text-decoration-none">{{ $post->title }}</a>
                </h5>
                <p class="card-text flex-grow-1">{{ Str::limit(strip_tags($post->content), 150) }}</p>
                <a href="{{ url('posts/'.$post->slug) }}" class="btn btn-primary btn-sm mt-auto">Read More →</a>
            </div>
        </div>
    </div>
    @endforeach
</div>


    <!-- Pagination -->
    <div class="d-flex justify-content-center">
        {{ $posts->links('pagination::bootstrap-5') }}
    </div>
</div>

@endsection
