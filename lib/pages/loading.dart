import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupTime() async{
    WorldTime worldTime = WorldTime(location: "Cairo", flag: "egypt.png", url: "Africa/Cairo");
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments:
      {
        'time': worldTime.time,
        'location': worldTime.location,
        'flag': worldTime.flag,
        'is_daytime': worldTime.isDayTime
      }
    );
  }

  @override
  void initState() {
    super.initState();
    setupTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
