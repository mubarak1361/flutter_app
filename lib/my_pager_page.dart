import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/feed.dart';

class MyPagerPage extends StatefulWidget {
  final String title;

  MyPagerPage({Key key, this.title}) : super(key: key);

  @override
  MyPagerPageState createState() {
    return new MyPagerPageState();
  }
}

class MyPagerPageState extends State<MyPagerPage> {
  var httpClient = new HttpClient();
  final List<Item> items = [];

  @override
  void initState() {
    super.initState();
    _getFeed();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          backgroundColor: Colors.red,
        ),
        body: new PageView(
          children: items.map((Item item) {
            return _itemView(item);
          }).toList(),
        ),
        bottomNavigationBar: new Card(
            color: Colors.red,
            child: new Row(
              children: <Widget>[
                new Expanded(
                    flex: 1,
                    child: new IconButton(
                        onPressed: () {},
                        icon: new Icon(
                          Icons.add,
                          color: Colors.white,
                        ))),
                new Expanded(
                    flex: 1,
                    child: new IconButton(
                        onPressed: () {},
                        icon: new Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ))),
                new Expanded(
                    flex: 1,
                    child: new IconButton(
                        onPressed: () {},
                        icon: new Icon(
                          Icons.people,
                          color: Colors.white,
                        ))),
              ],
            ))
        /*new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.add),
                  title: new Text("trends")
              ),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.location_on),
                  title: new Text("feed")
              ),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.people),
                  title: new Text("community"),
                  backgroundColor: Colors.red
              )
            ],
            fixedColor: Colors.red,
            currentIndex: 2
        )*/
        );
  }

  _getFeed() async {
    var httpClient = new HttpClient();
    var uri = new Uri.http(
      'api.androidhive.info',
      '/feed/feed.json',
    );
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    if (response.statusCode == HttpStatus.OK) {
      var jsonData = await response.transform(UTF8.decoder).join();
      var data = json.decode(jsonData);
      var feeds = data['feed'];

      setState(() {
        for (var feed in feeds) {
          items.add(new Item(
            logo: feed['profilePic'],
            title: feed['name'],
            subTitle: feed['status'],
          ));
        }
      });
    }
  }

  Widget _itemView(Item item) {
    return new Card(
        child: new Container(
            padding: const EdgeInsets.all(12.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                item.logo != null
                    ? new Image.network(item.logo, width: 100.0, height: 100.0)
                    : new Container(),
                new Container(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                  child: new Text(
                    item.title,
                    textAlign: TextAlign.start,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Text(item.subTitle)
              ],
            )));
  }
}
