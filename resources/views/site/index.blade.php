@extends('master')

  @section('content')

    <ul>
    @foreach($posts as $post)
        <li>
            <h2>{{ $post->title }}</h2>
            <div>{!! $post->body !!}</div>
        </li> 
    @endforeach
    </ul>

    @endsection
