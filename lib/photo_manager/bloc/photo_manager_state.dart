import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PhotoManagerState extends Equatable {
  PhotoManagerState([List props = const []]) : super(props);
}

class InitialPhotoManagerState extends PhotoManagerState {}
