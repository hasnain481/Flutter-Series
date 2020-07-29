import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments ;

    //set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.orangeAccent : Colors.blue[900];
    Color elColor = data ['isDaytime'] ? Colors.black: Colors.grey[300];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'date': result['date'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDaytime': result['isDaytime'],
                      };
                    });
                  },
                      icon: Icon(Icons.edit_location,
                      size: 25.0,
                      color: elColor,
                      ),
                      label: Text('Edit Location',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: elColor,
                      ),
                      ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 25.0,
                          letterSpacing: 2.0,
                          color: elColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 50.0,
                      color: elColor,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['date'],
                    style: TextStyle(
                      fontSize: 30.0,
                      color: elColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
