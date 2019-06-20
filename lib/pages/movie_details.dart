import 'package:flutter/material.dart';
import 'package:flutter_movie_night/model/movie_model.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails(this.movie);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MovieDetailsHeader(movie),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: StoryLine(movie),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryLine extends StatelessWidget {
  StoryLine(this.movie);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Story line",
          style: textTheme.subhead.copyWith(fontSize: 18.0),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          movie.overview,
          style:
              textTheme.body1.copyWith(color: Colors.black45, fontSize: 16.0),
        )
      ],
    );
  }
}

class Poster extends StatelessWidget {
  static const POSTER_RATIO = 0.7;

  Poster(this.bannerImage, {this.height});

  final height;

  final bannerImage;

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    return Material(
      borderRadius: BorderRadius.circular(4.0),
      elevation: 2.0,
      child: Image.network(
        bannerImage,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}

class ArcBannerImage extends StatelessWidget {
  ArcBannerImage(this.bannerImage);

  final bannerImage;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      clipper: ArcClipper(),
      child: Image.network(
        bannerImage,
        width: screenWidth,
        height: 230.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RatingInformation extends StatelessWidget {
  RatingInformation(this.movie);

  final MovieModel movie;

  Widget _buildRatingBar(ThemeData theme) {
    var stars = <Widget>[];

    for (var i = 1; i <= 5; i++) {
      var color =
          i <= this.movie.rating.toInt() ? theme.accentColor : Colors.black12;
      var star = Icon(
        Icons.star,
        color: color,
      );

      stars.add(star);
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var ratingCaptionStyle = textTheme.caption.copyWith(color: Colors.black45);

    var numericRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          movie.rating.toString(),
          style: textTheme.title.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.accentColor,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          'Ratings',
          style: ratingCaptionStyle,
        ),
      ],
    );

    var starRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRatingBar(theme),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4.0),
          child: Text(
            'Grade now',
            style: ratingCaptionStyle,
          ),
        ),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        numericRating,
        SizedBox(width: 16.0),
        starRating,
      ],
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  MovieDetailsHeader(this.movie);

  final MovieModel movie;

  List<Widget> _buildCategories(TextTheme textTheme) {
    return movie.genres.map((category) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(category.name),
          labelStyle: textTheme.caption,
          backgroundColor: Colors.black12,
        ),
      );
    }).toList();
  }

  @override
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            movie.title,
            style: textTheme.title,
          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 120)
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        RatingInformation(movie),
        SizedBox(
          height: 12.0,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _buildCategories(textTheme),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 140.0),
          child: ArcBannerImage(movie.getBannerImage()),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Poster(
                movie.getPosterImage(),
                height: 180.0,
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: movieInformation,
              ),
            ],
          ),
        )
      ],
    );
  }
}
