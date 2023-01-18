import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'sidebar.dart';
class DataEntryPage extends StatefulWidget {
  @override
  _DataEntryPageState createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
  final picker = ImagePicker();
  File? file;
  String _selectedCategory = "None";

  List<String> _categories = [
    'None',
    'Solid Waste',
    'Plastic Waste',
    'Metal Waste',
    'Paper Waste',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideNav(),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Data Entry'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select Category'
                        '',
                    style: TextStyle(fontSize: 25, color: Colors.black87),
                  ),
                  SizedBox(width: 30),
                  DropdownButton(
                    hint: Text('Select Category'),
                    // this will display the hint
                    underline: null,
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                    value: _selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value as String;
                      });
                    },
                    items: _categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Input weight in kilogram',
                      style: TextStyle(fontSize: 25, color: Colors.black87)),
                  SizedBox(width: 30),
                  Center(
                    child: Container(
                      width: 200,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: 'Input weight in kilograms',
                            border: null),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            Column(
              children: [
                Row(
                  children: [
                    Text("Upload Image",
                        style: TextStyle(fontSize: 20, color: Colors.black87)),
                    SizedBox(width: 50),
// add some horizontal space between the widgets
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black87, minimumSize: Size(40, 40)),
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
                                    onPressed: () async {
                                      final pickedFile = await picker.getImage(
                                          source: ImageSource.camera);
                                      if (pickedFile != null) {
                                        setState(() {
                                          file = File(pickedFile.path);
                                        });
                                      }
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Camera"),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () async {
                                      final pickedFile = await picker.getImage(
                                          source: ImageSource.gallery);
                                      if (pickedFile != null) {
                                        setState(() {
                                          file = File(pickedFile.path);
                                        });
                                      }
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Gallery"),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if (file == null)
                  Container()
                else
                  Container(

                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                              image: FileImage(file!), fit: BoxFit.cover))),
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
                          content: Text("You will get Npr **"),
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
                                Navigator.of(context).pop();
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
      )
    );
  }
}