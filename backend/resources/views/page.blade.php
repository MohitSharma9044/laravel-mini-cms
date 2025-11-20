@extends('layout')
@section('title', $page->title)
@section('content')

@section('content')
<div class="card p-4 shadow-sm">
    <h1 class="mb-3">{{ $page->title }}</h1>
    <div>{!! $page->content !!}</div>
</div>
@endsection


@endsection
