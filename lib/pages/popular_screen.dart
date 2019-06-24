import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_movie_night/data/PopularRepository.dart';
import 'package:flutter_movie_night/model/movie_model.dart';
import 'package:flutter_movie_night/pages/movie_details.dart';

class PopularScreen extends StatefulWidget {
  PopularScreen(this._repository);

  final PopularRepository _repository;

  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  bool isLoading = true;
  List<MovieModel> _movieData = [];

  void fetchData() {
    widget._repository.getPopularMovies().then((data) {
      setState(() {
        _movieData = data;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchData());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading ? _getLoading() : _getList(),
    );
  }

  Widget _getLoading() {
    print("am loading now");

    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getList() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(4.0),
      childAspectRatio: 8.0 / 9.0,
      children: _movieData
          .map(
            (item) => MovieTile(item),
          )
          .toList(),
    );
  }
}

class MovieTile extends StatelessWidget {
  MovieTile(this.movie);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetails(movie),
          ),
        );
        print("clicked on ${movie.title}");
      },
      child: Column(
        children: <Widget>[
          Container(
            child: Material(
              elevation: 3.0,
              child: AspectRatio(
                aspectRatio: 2 / 1.9,
                child: Image.network(
                  movie.getPosterImage(),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Text(
                      movie.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
