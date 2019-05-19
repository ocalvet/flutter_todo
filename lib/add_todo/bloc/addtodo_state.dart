import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddtodoState extends Equatable {
  AddtodoState([List props = const []]) : super(props);
}

class InitialAddtodoState extends AddtodoState {}
