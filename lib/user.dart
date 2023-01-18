import 'package:flutter/material.dart';
import 'package:prominor/sidebar.dart';

class HomePage extends StatelessWidget {
  final List<String> items = ["Item 1", "Item 2", "Item 3",'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideNav(),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Home Page"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                String message;
                if (index == 0) {
                  message = "You have sold this on May at a price of Rs. 4 per kg.";
                } else if (index == 1) {
                  message = "You have sold this on June at a price of Rs. 5 per kg.";
                } else if (index==2){
                  message = "You have sold this on Juky at a price of Rs. 3 per kg.";
                }
                else {
                  message="You have sold this on April at a price of Rs. 6 per kg.";
                }
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(message),
                    );
                  },
                );
              },
              child: ListTile(
                title: Text(items[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}