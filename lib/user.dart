import 'package:flutter/material.dart';
import 'package:prominor/sidebar.dart';
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: sideNav(),

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('HomePage'),

      ),
      body: Center(
        child: Text('Users previous items are shown here'),
      ),

    );
  }
}