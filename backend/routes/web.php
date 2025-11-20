<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\HomeController;

Route::get('/', [HomeController::class,'index']);
Route::get('/posts', [HomeController::class,'blog']);
Route::get('/posts/{slug}', [HomeController::class,'detail']);

Route::get('/contact-us', [HomeController::class, 'contact']);
Route::get('/about-us', [HomeController::class, 'about']);

Route::get('/{slug}', [HomeController::class,'page']);
