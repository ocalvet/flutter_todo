import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/login/login_bloc.dart';
import 'package:flutter_todo/login/login_events.dart';
import 'package:flutter_todo/login/login_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController passwordNameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    LoginBloc _bloc = BlocProvider.of<LoginBloc>(context);
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
                controller: userNameCtrl,
                decoration: InputDecoration(
                  labelText: "Username",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordNameCtrl,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder(
                bloc: _bloc,
                builder: (BuildContext context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text('LOGIN'),
                      onPressed: () {
                        _bloc.dispatch(
                          Login(
                            model: LoginModel(
                              username: userNameCtrl.text,
                              password: passwordNameCtrl.text,
                            ),
                          ),
                        );
                        // Navigator.pushReplacementNamed(context, '/todos');
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
