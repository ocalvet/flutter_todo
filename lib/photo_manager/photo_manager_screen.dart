import 'package:flutter/material.dart';

class PhotoManagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
      ),
      body: Center(
        child: Container(
          child: Text('Manage Photos here'),
        ),
      ),
    );
  }
}
