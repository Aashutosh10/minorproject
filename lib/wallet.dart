import 'package:flutter/material.dart';


class WalletPage extends StatefulWidget {
@override
_WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Wallet"),
      ),
      body: new Center(
        child:new Text ("This is wallet"),
      ),
    );
  }
}