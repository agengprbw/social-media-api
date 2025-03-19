<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Comment;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    // Add a new post
    public function create(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string'
        ]);

        $post = Post::create([
            'user_id' => $request->user()->id,
            'title' => $request->title,
            'content' => $request->content,
        ]);

        return response()->json($post, 201);
    }

    // Edit a post
    public function update(Request $request, $postId)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string'
        ]);

        $post = Post::where('id', $postId)->where('user_id', Auth::id())->first();

        if (!$post) {
            return response()->json(['message' => 'Post not found or unauthorized'], 404);
        }

        $post->update([
            'title' => $request->title,
            'content' => $request->content,
        ]);

        return response()->json(['message' => 'Post updated successfully', 'post' => $post]);
    }

    // Get all posts (all users, my posts, by user ID, following users)
    public function getAllPosts(Request $request)
    {
        $query = Post::with('user');

        if ($request->has('user_id')) {
            $query->where('user_id', $request->user_id);
        }

        if ($request->has('my_posts') && $request->my_posts) {
            $query->where('user_id', Auth::id());
        }

        if ($request->has('following')) {
            $followingIds = Auth::user()->following()->pluck('users.id');
            $query->whereIn('user_id', $followingIds);
        }

        $posts = $query->orderBy('created_at', 'desc')->get();
        return response()->json($posts);
    }

    // Get a specific post by ID
    public function getPostById($postId)
    {
        $post = Post::with(['user', 'comments.user'])->find($postId);

        if (!$post) {
            return response()->json(['message' => 'Post not found'], 404);
        }

        return response()->json($post);
    }

    // Like/unlike a post
    public function likePost(Request $request, $postId)
    {
        $post = Post::findOrFail($postId);
        $post->likes()->toggle(Auth::id());

        return response()->json(['message' => 'Post liked/unliked']);
    }

    // Add a comment to a post
    public function addComment(Request $request, $postId)
    {
        $request->validate(['content' => 'required|string']);

        $post = Post::findOrFail($postId);
        $comment = $post->comments()->create([
            'user_id' => Auth::id(),
            'content' => $request->content,
        ]);

        return response()->json($comment, 201);
    }

    // Delete a comment
    public function deleteComment($commentId)
    {
        $comment = Comment::where('id', $commentId)->where('user_id', Auth::id())->first();

        if (!$comment) {
            return response()->json(['message' => 'Comment not found or unauthorized'], 404);
        }

        $comment->delete();
        return response()->json(['message' => 'Comment deleted successfully']);
    }

    // Get posts that I have liked
    public function getMyLikedPosts()
    {
        $likedPosts = Auth::user()->likedPosts()->with('user')->get();
        return response()->json($likedPosts);
    }
}
