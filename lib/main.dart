import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/shared/bloc_delegate.dart';
import 'package:flutter_todo/todo_app.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(TodoApp());
}
