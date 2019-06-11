import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_night/pages/favorites_screen.dart';
import 'package:flutter_movie_night/pages/popular_screen.dart';
import 'package:flutter_movie_night/pages/search_screen.dart';

class MovieNightHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MovieNughtHomeState();
}

class _MovieNughtHomeState extends State<MovieNightHome>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  var _index;

  @override
  void initState() {
    super.initState();
    this._controller = new TabController(
      vsync: this,
      initialIndex: 1,
      length: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Movie Night"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.sentiment_very_satisfied)),
            new Tab(
              icon: new Icon(Icons.favorite_border),
            ),
            new Tab(icon: new Icon(Icons.search),
            )
          ],
        ),
      ),
      body: new TabBarView(
      controller: _controller,
        children: <Widget>[
          new PopularScreen(),
          new FavoritesScreen(),
          new SearchScreen(),
      ],

      ),
    );
  }
}
