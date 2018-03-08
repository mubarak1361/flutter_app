import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/feed.dart';

class MyBasicList extends StatefulWidget {

  MyBasicList({Key key}) :super(key: key);

  @override
  MyBasicListState createState() {
    return new MyBasicListState();
  }

}

class MyBasicListState extends State<MyBasicList> {
  var httpClient = new HttpClient();
  static bool _load = true;
  final List<Item> items = [];

  @override
  void initState() {
    super.initState();
    getFeed();
  }

  listItem(Item item) {
    return new Card(
      child: new Container(
          padding: const EdgeInsets.all(12.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              item.logo != null ?
              new Image.network(item.logo,
                width: 80.0,
                height: 80.0) : new Container(),
              new Expanded(
                  child: new Container(
                      padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: new Text(item.title,
                              textAlign: TextAlign.start,
                              style: new TextStyle(fontWeight: FontWeight.bold)
                              ,),),
                          new Text(item.subTitle)
                        ],
                      )))
            ],
          ))
    );

    return new ListTile(
      //leading: new Image.network(item.logo),
      title: new Text(item.title,),
      subtitle: new Text(item.subTitle, maxLines: 2,),
      onTap: () {
        Scaffold.of(this.context).showSnackBar(
          new SnackBar(
            content: new Text('tapped ${item.title}'),
            action: new SnackBarAction(
              label: 'OK',
              onPressed: () => Scaffold.of(this.context).hideCurrentSnackBar(),
            ),
          ),
        );
      },
    );
  }

  getFeed() async {
    var httpClient = new HttpClient();
    var uri = new Uri.http(
      'api.androidhive.info', '/feed/feed.json',);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    if (response.statusCode == HttpStatus.OK) {
      var json = await response.transform(UTF8.decoder).join();
     /* var data = JSON.decode(json);
      var feeds = data['feed'];*/
     Feed feed = new Feed.fromJson(JSON.decode(json) as Map<String,dynamic>);

      setState(() {
        /*for (var feed in feeds) {
          items.add(new Item(
            logo: feed['profilePic'],
            title: feed['name'],
            subTitle: feed['status'],
          ));
        }*/
        items.addAll(feed.items);
        _load = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: new Icon(Icons.list),
          title: new Text("Basic List View"),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.close), onPressed: (){ Navigator.of(context).pop();})
          ],
        ),
        body: new Stack(
            children: <Widget>[
              new ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: items.map((Item item) {
                  return listItem(item);
                }).toList(),
              ), new Center(
                  child: _load ? new Padding(padding: const EdgeInsets.all(5.0),
                    child: new Center(child: new CircularProgressIndicator()),
                  ) : new Container()),
            ]
        ));
  }
}