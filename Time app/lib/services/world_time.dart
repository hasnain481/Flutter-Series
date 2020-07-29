import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;//location name for the UI
  String time;//the time in that location
  String date;//the date in the location
  String flag;//url to an asset flag icon
  String url;//location url for api
  bool isDaytime;//true or false if daytime or not


  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //get properties from data
      String dateTime = data['datetime'];

      String offset = data['utc_offset'].substring(1,3);

      String dateOnly = data['utc_datetime'].substring(0,10);

      //create a time objects
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //create a date object
      DateTime nowDate = DateTime.parse(dateOnly);

      //set time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time =DateFormat.jm().format(now);

      //set date property
      date = DateFormat.yMd().format(nowDate);
    }
    catch (e){
      print(e);
      time = 'Could not get time data';
    }
  }
}

