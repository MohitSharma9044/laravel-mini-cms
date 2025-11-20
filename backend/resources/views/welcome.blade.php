@extends('layout')
@section('title','Home')
@section('content')

<h1 class="mb-4 text-center fw-bold">Latest Posts</h1>

<div class="row g-4">
    @foreach($posts as $p)
        <div class="col-md-4">
            <div class="card h-100 shadow-sm">
                @if($p->featured_image) 
                    <img src="{{ asset('storage/'.$p->featured_image) }}" class="card-img-top" alt="{{ $p->title }}">
                @endif
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">
                        <a href="{{ url('posts/'.$p->slug) }}" class="text-decoration-none text-dark">
                            {{ $p->title }}
                        </a>
                    </h5>
                    <p class="card-text flex-grow-1">
                        {{ Str::limit(strip_tags($p->content), 120) }}
                    </p>
                    <a href="{{ url('posts/'.$p->slug) }}" class="btn btn-primary mt-auto">Read More</a>
                </div>
                <div class="card-footer text-muted text-end">
                    {{ $p->created_at->format('d M, Y') }}
                </div>
            </div>
        </div>
    @endforeach
</div>

@endsection
