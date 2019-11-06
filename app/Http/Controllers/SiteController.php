<?php

namespace App\Http\Controllers;

use App\Post;
use Illuminate\Http\Request;

class SiteController extends Controller
{
    function index() {

        $posts = Post::where('status', 'PUBLISHED')->get();

        return view('site.index', [
            'posts' => $posts
        ]);
    }
}
