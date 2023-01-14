import 'sidebar.dart';
import 'package:flutter/material.dart';
class DataEntryPage extends StatefulWidget {

  @override
  _DataEntryPageState createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
  String _selectedCategory="None" ;
  List<String> _categories = ['None','Solid Waste', 'Plastic Waste', 'Metal Waste', 'Paper Waste',];
  @override
  Widget build(BuildContext context) {

    return Scaffold
      (
      drawer: sideNav(),
        backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Data Entry'),

      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Select Category:',style: TextStyle(fontSize: 20,color: Colors.black87),),
                  SizedBox(width: 30),
                  DropdownButton(
                    hint: Text('Select Category'), // this will display the hint
                    underline: null,
                    style: TextStyle(fontSize: 20,color: Colors.black87),
                    value:_selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value as String;
                      });
                    },
                    items: _categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Text('Input weight:', style: TextStyle(fontSize: 20, color: Colors.black87)),
                  SizedBox(width: 30),
                  Center(
                    child: Container(
                      width: 200,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: 'Input weight in kilograms', border: null),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 50),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Upload Image",style: TextStyle(fontSize: 20, color: Colors.black87)),
                      SizedBox(width: 50), // add some horizontal space between the widgets
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.black87,minimumSize: Size(40, 40)),
                        child: Text("Upload Image"),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                backgroundColor: Colors.blueAccent,
                                title: Text("Choose"),
                                children: [
                                  SimpleDialogOption(
                                    onPressed: () {
                                      // Code to execute when the "Gallery" option is selected
                                    },

                                    child: Text("Camera"),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: ()  {
                                      // Code to display the image picker

                                    },
                                    child: Text("Files"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(height:50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.black87,minimumSize: Size(80, 40)),
                        child: Text("Sell"),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.blueAccent,
                                title: Text("Sell"),
                                content: Text("You will get Npr ****"),
                                actions: [
                                  ElevatedButton(
                                    child: Text("Bargain"),
                                    onPressed: () {
                                      Navigator.of(context).pop();

                                    },
                                  ),
                                  ElevatedButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      },
                                  )

                                ],
                              );
                            },
                          );
                        },
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  )

                ],
              )
            ],
          )
      ),
    );
  }
}