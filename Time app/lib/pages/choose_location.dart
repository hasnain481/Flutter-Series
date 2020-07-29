import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'America/New_York', location: 'New_York', flag: 'york.png'),
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'pak.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'sing.png'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'hon.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'dub.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'ban.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'mos.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'lon.png'),
    WorldTime(url: 'Pacific/Fiji', location: 'Fiji', flag: 'fij.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'date': instance.date,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
