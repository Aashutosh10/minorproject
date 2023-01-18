import 'package:flutter/material.dart';
import 'package:prominor/sidebar.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _availableBalance = 1000;
  int _amountToBeReleased = 500;
  int _releasedAmount = 200;
  bool _showDialog = false;
  bool _showWithdrawDialog = false;
  int _withdrawAmount = 0;
  int _withdrawnAmount = 0;
  String _selectedPaymentOption = "Khalti";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideNav(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Wallet Page'),
      ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Available Balance'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _availableBalance = int.parse(value);
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Amount to be Released'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _amountToBeReleased = int.parse(value);
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Released Amount'
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _releasedAmount = int.parse(value);
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black87,minimumSize: Size(40, 40)),
              onPressed: () {
                setState(() {
                  _showDialog = true;
                });
              },
              child: Text('Make Release Request'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black87,minimumSize: Size(40, 40)),
              onPressed: () {
                setState(() {
                  _showWithdrawDialog = true;
                });
              },
              child: Text('Withdraw Amount'),
            ),
            _showDialog
                ? AlertDialog(
                    title: Text("Request Successful"),
                    content: Text("Your request for release has been sent."),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showDialog = false;
                          });
                        },
                        child: Text("OK"),
                      )
                    ],
                  )
                : Container(),
            _showWithdrawDialog
                ? AlertDialog(
                    title: Text("Withdraw"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Enter withdraw amount"),
                        SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _withdrawAmount = int.parse(value);
                          },
                        ),
                        SizedBox(height: 10),
                        Text("Available Payment Options"),
                        SizedBox(height: 10),
                        DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text("Khalti"),
                              value: "Khalti",
                            ),
                            DropdownMenuItem(
                              child: Text("Esewa"),
                              value: "Esewa",
                            ),
                            DropdownMenuItem(
                              child: Text("Ime Pay"),
                              value: "Ime Pay",
                            ),
                            DropdownMenuItem(
                              child: Text("Bank Transfer"),
                              value: "Bank Transfer",
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentOption = value as String;
                            });
                          },
                          value: _selectedPaymentOption,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_withdrawAmount > _releasedAmount) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Error"),
                                  content: Text(
                                      "You cannot withdraw more than the released amount"),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                              );
                              return;
                            }
                            setState(() {
                              _releasedAmount -= _withdrawAmount;
                              _showWithdrawDialog = false;
                              _withdrawnAmount = _withdrawAmount;

                              _selectedPaymentOption = "Khalti";
                            });
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Withdraw Successful"),
                                content: Text(
                                    "Rs$_withdrawAmount has been withdrawn"),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                          child: Text("Withdraw"),
                        )
                      ],
                    ))
                : Container(),
          ],
        ),
      ),
    )
    );
  }
}
