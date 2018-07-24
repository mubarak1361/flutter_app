import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/model/feed.dart';
import 'package:flutter_app/network_util.dart';

class MyBasicList extends StatefulWidget {
  MyBasicList({Key key}) : super(key: key);

  @override
  MyBasicListState createState() {
    return new MyBasicListState();
  }
}

class MyBasicListState extends State<MyBasicList> {
  var httpClient = new HttpClient();
  static bool _load = true;
  final List<Item> items = [];
  final key = new GlobalKey<ScaffoldState>();
  static const platform = const MethodChannel('flutterapp.sample.com/battery');

  @override
  void initState() {
    super.initState();

    _getBatteryLevel();

    //getFeed();

    NetworkUtil().getFeed(
        onSuccess: (feed){
          setState(() {
            items.addAll(feed.items);
            _load = false;
          });
        },
        onFailure: (error){
        debugPrint(error);
    });

  }

  Card listItem(Item item) {
    return new Card(
        child: new FlatButton(
            onPressed: () {
              debugPrint('Item ${item.title} clicked');
              key.currentState.showSnackBar(
                new SnackBar(
                  duration: new Duration(seconds: 20),
                  content: new Text('Tapped ${item.title}'),
                  action: new SnackBarAction(
                    label: 'OK',
                    onPressed: () => key.currentState.hideCurrentSnackBar(),
                  ),
                ),
              );
            },
            padding: const EdgeInsets.all(12.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                item.logo != null
                    ? new Image.network(item.logo, width: 80.0, height: 80.0)
                    : new Container(),
                new Expanded(
                    child: new Container(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: new Text(
                                item.title,
                                textAlign: TextAlign.start,
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            new Text(
                              item.subTitle,
                              style:
                                  new TextStyle(fontWeight: FontWeight.normal),
                            )
                          ],
                        )))
              ],
            )));

    /*return new ListTile(
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
    );*/
  }

  _getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      debugPrint('Battery level at $result % .');
    } on PlatformException catch (e) {
      debugPrint('Failed to get battery level: ${e.message}.');
    }
  }

 Future getFeed() async {
    var httpClient = new HttpClient();
    var uri = new Uri.http(
      'api.androidhive.info',
      '/feed/feed.json',
    );
    var request = await httpClient.getUrl(uri);
    var response = await request.close();

    if (response.statusCode == HttpStatus.OK) {
      var json = await response.transform(Utf8Decoder()).join();
      var data = jsonDecode(json);
      /*var feeds = data['feed'];*/
      debugPrint(data.toString());
      Feed feed = new Feed.fromJson(jsonDecode(json) as Map<String, dynamic>);

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
        key: key,
        appBar: new AppBar(
          leading: new Icon(Icons.list),
          title: new Text("Basic List View"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.close),
                onPressed: () {
                  SystemNavigator.pop();
                })
          ],
        ),
        body: new Stack(children: <Widget>[
          new ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: new EdgeInsets.all(4.0),
            children: items.map((Item item) {
              return listItem(item);
            }).toList(),
          ),
          new Center(
              child: _load
                  ? new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Center(child: new CircularProgressIndicator()),
                    )
                  : new Container()),
        ]));
  }
}
