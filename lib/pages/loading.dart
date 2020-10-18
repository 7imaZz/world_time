import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {

    Response response = await get("http://worldtimeapi.org/api/timezone/Africa/Cairo");
    Map map = jsonDecode(response.body);
    String dateTime = map['utc_datetime'];
    int offset = int.parse(map['utc_offset'].substring(1, 3));

    print(dateTime);
    print(offset);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: offset));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading'),
    );
  }
}
