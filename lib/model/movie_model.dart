class MovieModel {
  final String name;
  final String posterPath;
  final String poster_base = "https://image.tmdb.org/t/p/w342";

  MovieModel({this.name, this.posterPath});

  String getPosterImage() {
    return poster_base + posterPath;
  }
}

List<MovieModel> dummyData = [
  new MovieModel(
      name: "Dworzec", posterPath: "/wPSpKWTMcMBgXAYyKIr9PdVGvX7.jpg"),
  new MovieModel(
      name: "Lock, Stock and Two Smoking Barrels",
      posterPath: "/qV7QaSf7f7yC2lc985zfyOJIAIN.jpg"),
  new MovieModel(
      name: "Fight Club", posterPath: "/adw6Lq9FiC9zjYEpOqfq03ituwp.jpg"),
  new MovieModel(
      name: "Idioterne", posterPath: "/myMAaET7kCGSp3vyUcvd8hwTnD6.jpg")
];
