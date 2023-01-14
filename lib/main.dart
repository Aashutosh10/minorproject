import 'package:flutter/material.dart';
import 'package:prominor/bottomnavigation.dart';
import 'user.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waste Recyclers',
      home: BottomNavigation(),
    );
  }
}