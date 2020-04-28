import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleeptracker/pages/add_new_sleeping_record.dart';
import 'package:sleeptracker/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context)=> Home(),
    '/add_new': (context) => AddNewRecord(),
  }

));
