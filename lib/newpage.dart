import 'package:flutter/material.dart';
import 'package:prominor/user.dart';
import 'bottomnavigation.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select '),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width*1.9,
              height: MediaQuery.of(context).size.height*0.05,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.teal,minimumSize: Size(40, 40)),
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                    return BottomNavigation();
                  },),);
                },
                child: Text('User', style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width*1.9,
              height: MediaQuery.of(context).size.height*0.05,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.teal,minimumSize: Size(40, 40)),
                onPressed: () { /* action for business button */ },
                child: Text('Business', style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width*1.9,
              height: MediaQuery.of(context).size.height*0.01,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.teal,minimumSize: Size(40, 40)),
                onPressed: () { /* action for collector button */ },
                child: Text('Collector', style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
