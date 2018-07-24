import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final String pageTitle;

  WelcomePage({this.pageTitle});
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(pageTitle),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                pageTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display1,
              ),
              new RaisedButton(
                child: new Text("Go To List Page"),
                onPressed: () => _goToList(context),
              )
            ],
          ),
        ));
  }

  void _goToList(BuildContext context) {
    Navigator.of(context).pushNamed('/list');
  }
}
