import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/item.dart';
import 'package:path/path.dart';

class MyBasicList extends StatefulWidget{

  MyBasicList({Key key}):super(key: key);

  @override
  MyBasicListState createState() {
    return new MyBasicListState();
  }

}

class MyBasicListState extends State<MyBasicList>{
  var httpClient = new HttpClient();
  static bool _load = true;
  final List<Item> items = [];

  MyBasicListState(){
    getFeed();
  }
  listItem(Item item){
    return new Card(
      child: new ListTile(
        //leading: new Image.network(item.logo),
        title: new Text(item.title,),
        subtitle: new Text(item.subTitle,maxLines: 2,),
      ),
    );
    return new ListTile(
      //leading: new Image.network(item.logo),
      title: new Text(item.title,),
      subtitle: new Text(item.subTitle,maxLines: 2,),
      onTap: (){
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
      var data = JSON.decode(json);
      var feeds = data['feed'];

      setState(() {
        for (var feed in feeds) {
          items.add(new Item(
            logo: feed['image'],
            title: feed['name'],
            subTitle: feed['status'],
          ));
        }
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
        ),
        body:new Stack(
            children: <Widget>[new ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children:items.map((Item item){
                return listItem(item);
              }).toList(),
            ),new Center(
                child: _load ? new Padding(padding: const EdgeInsets.all(5.0),
                  child: new Center(child: new CircularProgressIndicator()),
                ):new Container())]
        ));
  }
}