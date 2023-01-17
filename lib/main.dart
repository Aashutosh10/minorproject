import 'package:flutter/material.dart';
import 'package:prominor/bottomnavigation.dart';
import 'user.dart';
import 'package:prominor/setting.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waste Recyclers',
      home: BottomNavigation(),
    );
  }
}