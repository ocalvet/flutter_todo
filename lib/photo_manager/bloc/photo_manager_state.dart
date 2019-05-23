import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PhotoManagerState extends Equatable {
  PhotoManagerState([List props = const []]) : super(props);
}

class InitialPhotoManagerState extends PhotoManagerState {
  toString() => 'InitialPhotoManagerState';
}

class LoadedPhotosState extends PhotoManagerState {
  final List<ImageInfo> photos;
  LoadedPhotosState(this.photos) : super([photos]);
  toString() => 'LoadedPhotosState';
}
