import 'dart:convert';
import 'package:http/http.dart';

class WorldTime{

  String location;
  String time;
  String flag;
  String url;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      Response response = await get(
          "http://worldtimeapi.org/api/timezone/${this.url}");
      Map map = jsonDecode(response.body);
      String dateTime = map['utc_datetime'];
      int offset = int.parse(map['utc_offset'].substring(1, 3));

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: offset));
      this.time = now.toString();
    }catch(e){
      time = "Could'nt get time data.";
      print('Cause: $e');
    }

  }
}