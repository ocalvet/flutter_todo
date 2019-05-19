import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddtodoEvent extends Equatable {
  AddtodoEvent([List props = const []]) : super(props);
}
