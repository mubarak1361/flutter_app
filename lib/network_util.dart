
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/method.dart';
import 'package:flutter_app/model/category.dart';
import 'package:flutter_app/model/feed.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class NetworkUtil {

  NetworkUtil._internal();
  static final NetworkUtil _instance = new NetworkUtil._internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future _call({@required String url, Map headers, Encoding encoding,
    @required Method method, dynamic body, @required ValueSetter<dynamic> onSuccess,
    @required ValueSetter<String> onFailure}) async {

    var responseData;

    switch (method) {
      case Method.GET:
        responseData = await http.get(url, headers: headers);
        break;
      case Method.POST:
        responseData = await http.post(url,
            body: body, headers: headers, encoding: encoding);
        break;
      case Method.PUT:
        responseData = await http.put(url,
            body: body, headers: headers, encoding: encoding);
        break;
      case Method.DELETE:
        responseData = await http.delete(url, headers: headers);
        break;
    }

    if (responseData.statusCode == HttpStatus.OK) {
      onSuccess(_decoder.convert(responseData.body));
    } else {
      onFailure('Error while fetching data');
    }

  }

  void getFeed({@required ValueSetter<Feed> onSuccess,
    @required ValueSetter<String> onFailure}) {
    _call(
        url: 'http://api.androidhive.info/feed/feed.json',
        method: Method.GET,
        onSuccess: (response){
          onSuccess(Feed.fromJson(response));
        },
        onFailure: onFailure);
  }

}
