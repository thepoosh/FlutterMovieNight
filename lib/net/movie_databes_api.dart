import 'dart:convert';

import 'package:flutter_movie_night/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieDatabaseApi{

  static const apiKey = "75aa7e5a8a0a1944a2cdf54aecfe605a";
  static const BASE_PATH = "https://api.themoviedb.org/3";
  static const POPULAR_ENDPOINT = "/movie/popular/?language=en-US&page=1&api_key=${apiKey}";
  static const SEARCH_ENDPOINT = "/search/company/?api_key=${apiKey}&query=";

  Future<PopularMovieResponse> getPopularMovies() {
    final url = "$BASE_PATH$POPULAR_ENDPOINT";
    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        return PopularMovieResponse.fromJson(json.decode(response.body));
      } else {
        print(response);
      }
    });

  }

  search(searchTerm) {
    final url = "$BASE_PATH$SEARCH_ENDPOINT$searchTerm";
    return http.get(url).then((response) {
      if(response.statusCode >= 200 && response.statusCode < 300) {
        return PopularMovieResponse.fromJson(json.decode(response.body));
      } else {
        print(response);
      }
    });
  }
}