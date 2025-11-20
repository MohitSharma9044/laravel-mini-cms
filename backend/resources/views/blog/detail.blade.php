@extends('layout')
@section('title', $post->title)
@section('content')

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">

            <div class="card shadow-sm mb-4">
                @if($post->featured_image)
                    <img src="{{ asset('storage/' . $post->featured_image) }}" 
                         class="card-img-top" 
                         alt="{{ $post->title }}" 
                         style="height:400px; object-fit:cover;">
                @endif

                <div class="card-body">
                    <h1 class="card-title mb-3">{{ $post->title }}</h1>
                    <p class="text-muted mb-4">
                        By <strong>{{ $post->user->name ?? 'Author' }}</strong> | 
                        {{ $post->created_at->format('M d, Y') }}
                    </p>

                    <div class="card-text" style="line-height:1.8; font-size:1.05rem;">
                        {!! $post->content !!}
                    </div>
                </div>
            </div>

            <a href="{{ url('/posts') }}" class="btn btn-outline-primary mt-3">&larr; Back to Posts</a>
        </div>
    </div>
</div>

@endsection
