import 'package:flutter/material.dart';

import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading...';
  void setupTime() async{
    WorldTime worldTime = WorldTime(location: "Cairo", flag: "egypt.png", url: "Africa/Cairo");
    await worldTime.getTime();
    print(worldTime.time);
    setState(() {
      time = worldTime.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text(time),
      )
    );
  }
}
