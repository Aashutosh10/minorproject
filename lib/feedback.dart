import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prominor/sidebar.dart';
import 'package:prominor/bottomnavigation.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String feedbackText = '';
  double rating = 0;
  bool showDialog = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: sideNav(),
      appBar: AppBar(

        title: Text("Feedback"),
        backgroundColor: Colors.green,
      ),
      

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: 450,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your feedback',
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      feedbackText = value;
                    });
                  },
                ),
              ),
            ),
            RatingBar.builder(
              initialRating: 2,
                minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  ),
                onRatingUpdate: (newRating) {
                setState(() {
                rating = newRating;
            });
            },
            ),
              ElevatedButton(
              onPressed: () {
                setState(() {
                  showDialog = true;
                });
              },
              child: Text('Submit'),
            ),
            Visibility(
              visible: showDialog,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  AlertDialog(
                    title: Text('Thank you for your feedback!'),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            feedbackText = '';
                            rating = 0;
                            showDialog = false;
                          });
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}