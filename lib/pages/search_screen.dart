import 'package:flutter/material.dart';
import 'package:flutter_movie_night/model/movie_model.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {},
            controller: TextEditingController(),
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: (context, i) {
              final movie = dummyData[i];
              return ListTile(
                leading: Image.network(movie.getPosterImage()),
                title: Text(movie.name),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildListTile(MovieModel movie) {

  }
}
