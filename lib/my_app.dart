import 'package:flutter/material.dart';
import 'package:flutter_app/form_page.dart';
import 'package:flutter_app/my_basic_list_page.dart';
import 'package:flutter_app/my_home_page.dart';
import 'package:flutter_app/my_pager_page.dart';
import 'package:flutter_app/welcome_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.green,
      ),
      home: new MyBasicList(),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) =>
        new MyHomePage(pageTitle: "Flutter Home Page"),
        "/welcome": (BuildContext context) =>
        new WelcomePage(pageTitle: "Hello, Welcome !!"),
        "/list": (BuildContext context) => new MyBasicList(),
        "/slide": (BuildContext context) =>
        new MyPagerPage(title: "Pager View"),
      },
    );
  }
}
