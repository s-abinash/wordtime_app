import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='Loading...';
  void setupWorldTime() async
  {
       WorldTime ind=WorldTime(location: "India", flag: "india.png", url: "Asia/Kolkata");
       await ind.getTime();
       Navigator.pushReplacementNamed(context,'/home',arguments:
       { 'location': ind.location,
         'flag': ind.flag,
         'time': ind.time,}
       );
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0,80.0,0,0),
        child: Text('Loading.....',
              style: TextStyle(
              fontSize: 25.0,
              color: Colors.greenAccent),
      ),
      ),
    );
  }
}
