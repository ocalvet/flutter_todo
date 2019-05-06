import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/todo_app.dart';

import 'bloc_delegate.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(TodoApp());
}
