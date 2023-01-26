import 'package:flutter/material.dart';
import 'package:prominor/sidebar.dart';
import 'package:prominor/sidebar.dart';
import 'package:prominor/bottomnavigation.dart';
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],


      drawer:sideNav(),
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Option 1'),
            onTap: () {
              // Handle option 1 tap
            },
          ),
          ListTile(
            title: Text('Option 2'),
            onTap: () {
              // Handle option 2 tap
            },
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}