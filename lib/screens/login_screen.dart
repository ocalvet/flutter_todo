import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          'login screen',
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
