<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PostController;

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/post', [PostController::class, 'create']);
    Route::put('/post/{postId}', [PostController::class, 'update']);
    Route::get('/posts', [PostController::class, 'getAllPosts']);
    Route::get('/post/{postId}', [PostController::class, 'getPostById']);
    Route::post('/post/{postId}/like', [PostController::class, 'likePost']);
    Route::delete('/comment/{commentId}', [PostController::class, 'deleteComment']);
    Route::get('/posts/liked', [PostController::class, 'getMyLikedPosts']);
});
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->get('profile', [AuthController::class, 'profile']);
Route::middleware('auth:sanctum')->put('update-profile', [AuthController::class, 'updateProfile']);

Route::middleware('auth:sanctum')->post('post', [PostController::class, 'create']);
Route::middleware('auth:sanctum')->get('posts', [PostController::class, 'getAllPosts']);
Route::middleware('auth:sanctum')->post('post/{postId}/like', [PostController::class, 'likePost']);
Route::middleware('auth:sanctum')->post('post/{postId}/comment', [PostController::class, 'addComment']);
Route::middleware('auth:sanctum')->get('search-user', [AuthController::class, 'searchUser']);
Route::middleware('auth:sanctum')->get('user/{userId}', [AuthController::class, 'getOtherUserProfile']);
Route::middleware('auth:sanctum')->get('user/{userId}/followers', [AuthController::class, 'getFollowers']);
Route::middleware('auth:sanctum')->get('user/{userId}/following', [AuthController::class, 'getFollowing']);
Route::middleware('auth:sanctum')->post('user/{userId}/follow', [AuthController::class, 'followUser']);
Route::middleware('auth:sanctum')->post('user/{userId}/unfollow', [AuthController::class, 'unfollowUser']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
