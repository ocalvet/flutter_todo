import 'package:flutter/material.dart';

class PhotoManagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Photos'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              onPressed: () {},
              child: Text('Take Picture'),
            ),
          ),
        ],
      ),
    );
  }
}
