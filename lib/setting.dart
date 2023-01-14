import 'package:flutter/material.dart';
import 'package:prominor/bottomnavigation.dart';
import 'package:prominor/sidebar.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:sideNav(),

      appBar: AppBar(
        backgroundColor: Colors.green,
        title:Text ('Setting Page'),
      ),
      body: Center(
        child: Text('hhh'),
      ),

    );
  }
}