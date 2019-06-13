import 'package:flutter/material.dart';
import 'package:flutter_movie_night/model/movie_model.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                return _buildListTile(context, movie);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, MovieModel movie) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 8.0,
      ),
      child: Container(
          child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Image.network(
            movie.getPosterImage(),
            fit: BoxFit.fill,
          ),
        ),
        title: Text(
          movie.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    " this is a very long flipping line and I like it a lot even though it takes more than one line",
                    style: TextStyle(color: Colors.black38),
                    maxLines: 3,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    "this is the bottom",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
//      ;
  }
}
