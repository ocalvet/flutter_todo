import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/login/login.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Todos Login',
                style: Theme.of(context).textTheme.display1.copyWith(
                      color: Colors.blueAccent.shade700,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.lock,
                size: 34,
                color: Colors.red.shade400,
              ),
              SizedBox(
                height: 20,
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
                height: 30,
              ),
              BlocBuilder(
                bloc: _bloc,
                builder: (BuildContext context, state) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          color: Colors.blueAccent.shade700,
                          textColor: Colors.white,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(25),
                              right: Radius.circular(25),
                            ),
                          ),
                          child: Text('LOGIN'),
                          onPressed: state is! LoggingIn
                              ? () {
                                  _bloc.dispatch(
                                    Login(
                                      model: LoginModel(
                                        username: userNameCtrl.text,
                                        password: passwordNameCtrl.text,
                                      ),
                                    ),
                                  );
                                }
                              : null,
                        ),
                      ),
                      Container(
                        child: state is LoggingIn
                            ? CircularProgressIndicator()
                            : null,
                      ),
                    ],
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
