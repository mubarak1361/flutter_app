import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/my_home_page_state.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.pageTitle}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String pageTitle;

  @override
  MyHomePageState createState() => new MyHomePageState();

}