<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\MediaController;
use App\Http\Controllers\Api\PageController;
use App\Http\Controllers\Api\DashboardController;

Route::post('login',[AuthController::class,'login']);
Route::post('logout',[AuthController::class,'logout'])->middleware('auth:sanctum');
Route::get('me',[AuthController::class,'me'])->middleware('auth:sanctum');

Route::get('posts', [PostController::class, 'index']);
Route::get('posts/{post}', [PostController::class, 'show']);
Route::middleware('auth:sanctum')->group(function () {
    Route::post('posts', [PostController::class, 'store']);
    Route::put('posts/{post}', [PostController::class, 'update']);
    Route::delete('posts/{post}', [PostController::class, 'destroy']);
     Route::patch('/posts/{post}/publish', [PostController::class, 'togglePublish']);

     Route::get('/media', [MediaController::class, 'index']); 
    Route::post('/media', [MediaController::class, 'store']); 
    Route::delete('/media/{media}', [MediaController::class, 'destroy']);

    Route::get('/pages', [PageController::class, 'index']);  
    Route::post('/pages', [PageController::class, 'store']); 
    Route::post('/pages/{page}', [PageController::class, 'update']);
    Route::delete('/pages/{page}', [PageController::class, 'destroy']);

    Route::get('/dashboard-stats', [DashboardController::class, 'stats']);





});

