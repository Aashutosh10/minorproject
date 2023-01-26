import 'package:flutter/material.dart';
import 'package:prominor/feedback.dart';
import 'package:prominor/setting.dart';
import 'package:prominor/profile.dart';
import 'package:prominor/login.dart';
import 'package:prominor/user.dart';

class sideNav extends StatelessWidget {
  const sideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(

            child: Text(
              'User',

              style: TextStyle(color: Colors.black, fontSize: 25),
            ),

          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()))
            },
          ),

          ListTile(
            leading: Icon(Icons.supervised_user_circle_outlined),
            title: Text('Profile'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()))
            },
          ),


          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()))
            },
          ),

          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeedbackPage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()))
            },
          ),
        ],
      ),
    );
  }
}