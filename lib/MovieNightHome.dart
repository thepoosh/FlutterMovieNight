import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_night/data/PopularRepository.dart';
import 'package:flutter_movie_night/pages/popular_screen.dart';
import 'package:flutter_movie_night/pages/search_screen.dart';

const popularIcon = IconData(0xe900, fontFamily: 'Fire');

class MovieNightHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MovieNightHome> {
  int _currentIndex = 0;

  List<Widget> _optionWidgets = [
    PopularScreen(PopularRepository()),
//    FavoritesScreen(),
    SearchScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(child: _optionWidgets[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(popularIcon),
            title: Text("Popular"),
          ),
//          BottomNavigationBarItem(
//            activeIcon: Icon(Icons.favorite),
//            icon: Icon(Icons.favorite_border),
//            title: Text("Favorites"),
//          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
