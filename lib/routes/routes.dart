import 'package:core_flutter_exam/screens/addscreen/addscreen.dart';
import 'package:core_flutter_exam/screens/homescreen/homescreen.dart';
import 'package:flutter/material.dart';

class Routes{
  static Map<String, Widget Function(BuildContext)> myRoutes = {
    '/home': (context)=> const Homescreen(),
    '/': (context)=> const AddScreen(),
  };
}