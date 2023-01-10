import 'package:flutter/material.dart';
import 'package:prominor/dataentry.dart';
import 'package:prominor/wallet.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

  class _HomeScreenState extends State<HomeScreen> {

    var children =
    [
      DataEntryPage(),
      WalletPage()
    ];
    int _currentindex =0;
    void onTappedBar(int index) {
      setState(() {
        _currentindex = index;
      });

      switch (index) {
        case 0:
        // do something
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DataEntryPage()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WalletPage()),
          );
          break;
      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person_pin),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('User'),
              accountEmail: Text('user@email.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1307731275781177344/k5aVBG5Z_400x400.jpg',
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('User Old Items Are Displayed Here'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Data',
            backgroundColor: Colors.white,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
            backgroundColor: Colors.white,
          ),

        ],
      ),
    );
  }
}




