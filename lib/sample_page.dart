import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {

  final String firstText;

  SamplePage(this.firstText);

  factory SamplePage.forDesignTime() {
    return SamplePage('AA');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        buildText(firstText),
        buildText('BBBB'),
        buildText('CCCCCC'),
        buildText('DDDDDDDD'),
      ],
    );
  }

  Text buildText(String text) {
    return Text(text, style: TextStyle(fontSize: 24.0));
  }

}
