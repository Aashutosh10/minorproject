import 'package:flutter/material.dart';
import 'package:prominor/user.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:prominor/dataentry.dart';
import 'package:prominor/wallet.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key,}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  var children = [
    HomePage(),
    DataEntryPage(),
    WalletPage(),
  ];

  void _onChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      // appBar: ,
      body: children[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        onTap: _onChanged,
        currentIndex: _currentIndex,
        items: [

          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.black,
          ),


          SalomonBottomBarItem(
            icon: Icon(Icons.tab_sharp),
            title: Text("Data Entry"),
            selectedColor: Colors.black,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.wallet),
            title: Text("Wallet"),
            selectedColor: Colors.black,
          ),

        ],
      ),
    );
  }
}
