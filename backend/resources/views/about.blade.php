@extends('layout')

@section('title', 'About Us')

@section('content')
<div class="container my-5">
    <div class="card shadow-sm p-4">
        <h1 class="mb-4">About Us</h1>
        <p>
            Welcome to {{ config('app.name') }}! We are dedicated to providing the best content management system experience. Our mission is to help you manage your website easily and efficiently.
        </p>
        <p>
            Our team consists of experienced developers, designers, and content creators committed to delivering high-quality solutions for your digital needs.
        </p>
        <p>
            Feel free to explore our platform and discover how we can help you streamline your website management.
        </p>
    </div>
</div>
@endsection
