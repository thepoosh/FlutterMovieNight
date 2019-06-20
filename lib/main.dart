import 'package:flutter/material.dart';
import 'package:flutter_movie_night/MovieNightHome.dart';
import 'package:flutter_movie_night/model/movie_model.dart';

void main() => runApp(MovieNightApp());

class MovieNightApp extends StatelessWidget {
  MovieNightApp(){
    getnerateMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Movie Night",
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
      ),
      home: MovieNightHome(),
    );
  }
}
