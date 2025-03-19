<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    // Register
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $token = $user->createToken('SocialMediaApp')->plainTextToken;

        return response()->json(['user' => $user, 'token' => $token], 201);
    }

    // Login
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
        
        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $token = $user->createToken('SocialMediaApp')->plainTextToken;

            return response()->json(['user' => $user, 'token' => $token]);
        }

        return response()->json(['message' => 'Unauthorized'], 401);
    }

    // Get user profile
    public function profile(Request $request)
    {
        return response()->json($request->user());
    }

    // Update user profile
    public function updateProfile(Request $request)
    {
        $user = $request->user();
        $user->update($request->only(['name', 'email']));
        return response()->json(['message' => 'Profile updated successfully']);
    }
    public function searchUser(Request $request)
{
    $users = User::where('name', 'like', '%' . $request->name . '%')->get();
    return response()->json($users);
}

public function getOtherUserProfile($userId)
{
    $user = User::find($userId);
    if (!$user) {
        return response()->json(['message' => 'User not found'], 404);
    }
    return response()->json($user);
}
// Get followers
public function getFollowers($userId)
{
    $user = User::find($userId);
    if (!$user) {
        return response()->json(['message' => 'User not found'], 404);
    }

    return response()->json($user->followers);
}

// Get following
public function getFollowing($userId)
{
    $user = User::find($userId);
    if (!$user) {
        return response()->json(['message' => 'User not found'], 404);
    }

    return response()->json($user->following);
}
public function followUser($userId, Request $request)
{
    $user = $request->user();
    $userToFollow = User::find($userId);
    
    if (!$userToFollow) {
        return response()->json(['message' => 'User not found'], 404);
    }

    // Follow the user
    $user->following()->attach($userId);
    return response()->json(['message' => 'User followed successfully']);
}
public function unfollowUser($userId, Request $request)
{
    $user = $request->user();
    $userToUnfollow = User::find($userId);
    
    if (!$userToUnfollow) {
        return response()->json(['message' => 'User not found'], 404);
    }

    // Unfollow the user
    $user->following()->detach($userId);
    return response()->json(['message' => 'User unfollowed successfully']);
}

}

