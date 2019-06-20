import 'dart:convert';

import 'package:flutter/services.dart';

void getnerateMovieData() async {
  var loadString = await rootBundle.loadString("assets/sample.json");
  dummyData = PopularMovieResponse.fromJson(json.decode(loadString)).results;
}

List<MovieModel> dummyData = [];
const Map GENERS = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  99: "Documentary",
  18: "Drama",
  10751: "Family",
  14: "Fantasy",
  36: "History",
  27: "Horror",
  10402: "Music",
  9648: "Mystery",
  10749: "Romance",
  878: "Science Fiction",
  10770: "TV Movie",
  53: "Thriller",
  10752: "War",
  37: "Western",
};

class PopularMovieResponse {
  int page;
  int totalResults;
  int totalPages;
  List<MovieModel> results;

  PopularMovieResponse(
      {this.page, this.totalResults, this.totalPages, this.results});

  PopularMovieResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = new List<MovieModel>();
      json['results'].forEach((v) {
        results.add(new MovieModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieModel {
  bool adult;
  String backdropPath;
  Null belongsToCollection;
  List<Genres> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  int runtime;
  String title;
  bool video;
  double rating;

  MovieModel(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.runtime,
      this.title,
      this.video,
      this.rating});

  static const String posterBase = "https://image.tmdb.org/t/p/w342";
  static const String BANNER_BASE = "https://image.tmdb.org/t/p/w780";
  static const String YOUTUBE_BASE = "https://www.youtube.com/watch?v=";

  String getPosterImage() {
    return posterBase + posterPath;
  }

  getBannerImage() {
    return BANNER_BASE + backdropPath;
  }

  MovieModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }

    if (json['genre_ids'] != null) {
      genres = new List<Genres>();
      json['genre_ids'].forEach((v) {
        genres.add(new Genres(id: v, name: GENERS[v]));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    runtime = json['runtime'];
    title = json['title'];
    video = json['video'];
    rating = 0.0 + json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['belongs_to_collection'] = this.belongsToCollection;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this.homepage;
    data['id'] = this.id;
    data['imdb_id'] = this.imdbId;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['runtime'] = this.runtime;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.rating;
    return data;
  }
}

class Genres {
  int id;
  String name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
