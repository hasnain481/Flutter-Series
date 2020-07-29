import 'package:flutter/material.dart';
import 'package:learning/pages/choose_location.dart';
import 'package:learning/pages/home.dart';
import 'package:learning/pages/loading.dart';

void main() => runApp(MaterialApp(
  /*initialRoute: '/home', //overwrite below and go to home page*/
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },

));

