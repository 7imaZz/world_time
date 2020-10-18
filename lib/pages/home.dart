import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isEmpty? ModalRoute.of(context).settings.arguments: data;
    print(data);

    String bgPng = data['is_daytime']? 'day.png':'night.png';
    Color bgColor = data['is_daytime']? Colors.blue[300]: Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgPng'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: ()async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'is_daytime': result['is_daytime']
                        };
                      });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300]
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        letterSpacing: 2.0
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 66.0
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

