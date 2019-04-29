import 'package:flutter/material.dart';
import 'package:flutter_todo/authentication.dart';
import 'package:flutter_todo/todos_bloc.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'login screen',
              style: Theme.of(context).textTheme.title,
            ),
            RaisedButton(
              child: Text('LOGIN'),
              onPressed: () {
                todosBloc.authenticate(Authentication(token: '123'));
                todosBloc.auth$.listen((a) {
                  print(a);
                  Navigator.pushReplacementNamed(context, '/');
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
