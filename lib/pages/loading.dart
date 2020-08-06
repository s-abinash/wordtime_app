import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //Spinner
  static const spinner = SpinKitFadingCube(
    color: Colors.lightGreen,
    size: 80.0,
  );

  String time='Loading...';
  void setupWorldTime() async
  {
       WorldTime ind=WorldTime(location: "India", flag: "india.png", url: "Asia/Kolkata");
       await ind.getTime();
       Navigator.pushReplacementNamed(context,'/home',arguments:
       { 'location': ind.location,
         'flag': ind.flag,
         'time': ind.time,
         'isDayTime': ind.isDayTime}
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
      backgroundColor: Colors.black87,
      body: Center(
        child: spinner,
      ),
    );
  }
}
