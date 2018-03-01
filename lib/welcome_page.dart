import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget{

  final String pageTitle;

  WelcomePage({this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text(pageTitle),
            ),
    body:new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "Hello Welcome !!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.display1 ,
          ),
          new RaisedButton(child: new Text("Go Home"),
            onPressed: () => goHome(context),)
        ],
      ),
    ));
  }

  void goHome(BuildContext context){
    Navigator.of(context).pushNamed('/home');
  }

}