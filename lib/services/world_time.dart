import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //Location to show
  String time; //Time to show
  String flag; //URL for the flag icon
  String url;
  WorldTime({this.location,this.flag,this.url });
  Future<void> getTime() async{

    try{
      // Get time request response
      Response response=await get('http://worldtimeapi.org/api/timezone/$url');
      Map data=jsonDecode(response.body);

      String datetime=data['datetime'];
      String hr=data['utc_offset'].substring(1,3);
      String mi=data['utc_offset'].substring(4);

      // Create a datetime Object
      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(hr),minutes: int.parse(mi)));
//      time=now.toString();

      time=DateFormat.jm().format(now);
      time=time.toString();
    }
    catch(e){
        time='Could not get time data';
    }

  }
}