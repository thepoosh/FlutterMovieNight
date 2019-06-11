import 'package:flutter/material.dart';
import 'package:flutter_movie_night/MovieNightHome.dart';

void main() => runApp(MovieNightApp());

class MovieNightApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Movie Night",
      theme: new ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent
      ),
      home: new MovieNightHome(),

    );
  }
}

