import 'package:flutter/material.dart';
import 'package:flutter_todo/authentication.dart';
import 'package:flutter_todo/todos_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Username",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text('LOGIN'),
                  onPressed: () {
                    todosBloc.authenticate(Authentication(token: '123'));
                    todosBloc.auth$.listen((a) {
                      Navigator.pushReplacementNamed(context, '/todos');
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
