import 'package:equatable/equatable.dart';
import 'package:flutter_todo/models/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PhotoManagerEvent extends Equatable {
  PhotoManagerEvent([List props = const []]) : super(props);
}

class LoadPhotos extends PhotoManagerEvent {
  final Todo todo;
  LoadPhotos(this.todo) : super([todo]);
}

class AddPhoto extends PhotoManagerEvent {
  final PhotoInfo photo;
  AddPhoto(this.photo) : super([photo]);
}
