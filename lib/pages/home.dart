import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {}; //To receive data given by loading

  @override
  Widget build(BuildContext context) {

    data=ModalRoute.of(context).settings.arguments; //Getting data given through context
    print(data);

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/location');
                    },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location'),
              ),
            ],
          )),
    );
  }
}
