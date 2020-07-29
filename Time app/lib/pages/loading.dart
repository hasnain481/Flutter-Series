import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:learning/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Karachi', flag: 'Pak.jpg', url: 'Asia/Karachi');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'date': instance.date,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
     body: Center(
       child: Padding(
         padding: const EdgeInsets.fromLTRB(0, 320, 0, 0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             SpinKitFadingCube(
               size: 70.0,
               color: Colors.blue[900],
             ),
             SizedBox(height: 40.0,),
             Text('Date Time App',
             style: TextStyle(
               fontSize: 20.0,
               color: Colors.black,
             ),),
           ],
         ),
       ),
     ),
    );
  }
}
