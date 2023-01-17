import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? file;
  ImagePicker image = ImagePicker();
  String _name = '';
  String _email = '';
  String _location = '';
  String _contactNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 180,
                    width: 180,
                    child: ClipOval(
                      child: file == null
                          ? Icon(
                              Icons.image,
                              size: 50,
                            )
                          : Image.file(
                              file!,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    getgall();
                  },
                  color: Colors.black,
                  child: Text(
                    "Upload from gallery",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    getcam();
                  },
                  color: Colors.black,
                  child: Text(
                    "Upload from camera",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blueGrey),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _name = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Location',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _location = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Contact Number',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _contactNumber = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black87, minimumSize: Size(40, 40)),
                  onPressed: () {
                    print('Name: $_name');
                    print('Email: $_email');
                    print('Location: $_location');
                    print('Contact Number: $_contactNumber');
                  },
                  child: Text('Save Profile'),
                ),
              ],
            ),
          ),
        ));
  }

  getcam() async {
// ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgall() async {
// ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}
