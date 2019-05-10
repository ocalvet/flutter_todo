import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/authentication/authentication_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc _authBloc = BlocProvider.of<AuthenticationBloc>(context);
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
              BlocBuilder(
                bloc: _authBloc,
                builder: (BuildContext context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text('LOGIN'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/todos');
                        // todosBloc.auth$.listen((a) {
                        //   Navigator.pushReplacementNamed(context, '/todos');
                        // });
                        // todosBloc.authenticate(Authentication(token: '123'));
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
