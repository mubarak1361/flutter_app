import 'package:flutter/material.dart';


class MyCalculatorPage extends StatefulWidget{

  @override
  _MyCalculatorPageState createState() => new _MyCalculatorPageState();

}

class _MyCalculatorPageState extends State<MyCalculatorPage>{

  int value;

  @override
  void initState() {
    super.initState();
    value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.brown,
      ),
        body: new Column(
          children: <Widget>[
        new Expanded(flex:2,
          child: new Container(
            padding: new EdgeInsets.only(top: 12.0,left: 12.0,right: 12.0,bottom: 12.0),
            color: Colors.grey,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              new Text(value.toString(),
                maxLines: 1,
                style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0),)
            ], )
            ,) ,) ,
        new Expanded(flex: 6, child: new Container( color: Colors.black45)),
    ],
    ),
    );
  }

}