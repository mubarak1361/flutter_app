import 'package:flutter/material.dart';
import 'package:flutter_app/fragment/action_page.dart';
import 'package:flutter_app/model/page_data.dart';

class MyBottomNavigation extends StatefulWidget {
  @override
  _MyBottonNavigationState createState() {
    return new _MyBottonNavigationState();
  }
}

class _MyBottonNavigationState extends State<MyBottomNavigation> {
  int _selectedPage = 0;
  List<PageData> _items = [
    new PageData('Home', Icons.home),
    new PageData('Navigation', Icons.navigation),
    new PageData('Playlist', Icons.playlist_play),
  ];

  @override
  void initState() => super.initState();

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Bottom Navigation"),
        backgroundColor: Colors.blueAccent,
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(flex: 9, child: _getPage(_selectedPage)),
          new Expanded(
              flex: 1,
              child: new Row(
                children: _items.map((PageData pageData) {
                  return new Expanded(
                      flex: 1,
                      child: new FlatButton(
                        onPressed: () {
                          setState(
                              () => _selectedPage = _items.indexOf(pageData));
                        },
                        shape: new Border.all(
                            width: 0.0, color: Colors.transparent),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(
                              pageData.iconData,
                              color: Colors.white,
                            ),
                            new Text(
                              pageData.name,
                              style: new TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        color: Colors.blueAccent,
                      ));
                }).toList(),
              ))
        ],
      ),
    );
  }

  _getPage(int index) {
    switch (index) {
      case 0:
        return new ActionPage(iconData: Icons.home);
      case 1:
        return new ActionPage(iconData: Icons.navigation);
      case 2:
        return new ActionPage(iconData: Icons.playlist_play);
    }
  }

  /** new Expanded(flex: 1, child: new FlatButton(onPressed: (){
      setState(()=> _selectedPage = 0);
      },shape: new Border.all(width: 0.0,color: Colors.transparent),
      child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      new Icon(Icons.home,color: Colors.white,),
      new Text("Home", style: new TextStyle(
      color: Colors.white
      ),)
      ],
      ),color: Colors.blueAccent,)) **/

}
