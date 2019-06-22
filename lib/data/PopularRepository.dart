import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_night/model/movie_model.dart';
import 'package:flutter_movie_night/net/movie_databes_api.dart';

class PopularRepository {
  final api = new MovieDatabaseApi();


  Future<List<MovieModel>> getPopularMovies() async {
//    var response = await rootBundle.loadString("assets/sample.json");
//    var parsed = PopularMovieResponse.fromJson(json.decode(response));
//    return parsed.result
      var response = await api.getPopularMovies();
      return response.results;
  }


  Future<List<MovieModel>> search(searchTerm) async {
    final PopularMovieResponse response = await api.search(searchTerm);
        return response.results;
  }
}