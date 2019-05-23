import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PhotoManagerEvent extends Equatable {
  PhotoManagerEvent([List props = const []]) : super(props);
}
