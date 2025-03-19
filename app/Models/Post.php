<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $fillable = ['user_id','title', 'content'];

    // Relationship with User
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Relationship with Comments
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    // Relationship with Likes
    public function likes()
    {
        return $this->belongsToMany(User::class, 'post_likes');
    }
    
}

