import 'package:flutter/material.dart';
import 'package:flutter_movie_night/model/movie_model.dart';

class PopularScreen extends StatefulWidget {
  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, i) => new Card(
            child: new Column(
              children: <Widget>[
                new Image(
                  image: new NetworkImage(dummyData[i].getPosterImage()),
                ),
                new Text(
                  dummyData[i].name,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18.0),
                )
              ],
            )));
//    return ListView.builder(
//        itemCount: dummyData.length,
//        itemBuilder: (context, i) => new Column(
//              children: <Widget>[
//                new Divider(
//                  height: 10.0,
//                ),
//                new ListTile(
//                  leading: new CircleAvatar(
//                    foregroundColor: Theme.of(context).primaryColor,
//                    backgroundColor: Theme.of(context).accentColor,
//                    backgroundImage:
//                        new NetworkImage(dummyData[i].getPosterImage()),
//                  ),
//                  title: new Text(
//                    dummyData[i].name,
//                    style: new TextStyle(
//                        fontSize: 18.0, fontWeight: FontWeight.bold),
//                  ),
//                )
//              ],
//            ));
  }
}
