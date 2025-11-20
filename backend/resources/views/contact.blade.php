@extends('layout')

@section('title', 'Contact Us')

@section('content')
<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm p-4">
                <h1 class="mb-4">Contact Us</h1>
                
                <p>If you have any questions, feedback, or inquiries, please reach out to us using the form below or the contact information provided.</p>

                <form action="#" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Your full name">
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Your email address">
                    </div>

                    <div class="mb-3">
                        <label for="message" class="form-label">Message</label>
                        <textarea class="form-control" id="message" name="message" rows="5" placeholder="Your message"></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary">Send Message</button>
                </form>

                <hr class="my-4">

                <div>
                    <p><strong>Email:</strong> contact@example.com</p>
                    <p><strong>Phone:</strong> +91 12345 67890</p>
                    <p><strong>Address:</strong> 123 Street Name, City, Country</p>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
