import 'package:flutter/material.dart';

class ActionPage extends StatefulWidget {

  IconData iconData;

  ActionPage({Key key, this.iconData}) :super(key: key);

  @override
  _MyActionPageState createState() => new _MyActionPageState();

}

class _MyActionPageState extends State<ActionPage> {

  @override
  void initState() => super.initState();

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Icon(widget.iconData,
          size: 100.0,
          color: Colors.grey,),
      )
    );
  }

}