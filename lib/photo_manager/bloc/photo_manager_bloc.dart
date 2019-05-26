import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_todo/models/photo_info.dart';
import './bloc.dart';

class PhotoManagerBloc extends Bloc<PhotoManagerEvent, PhotoManagerState> {
  List<PhotoInfo> cachedPhotos = [];
  @override
  PhotoManagerState get initialState => InitialPhotoManagerState();

  @override
  Stream<PhotoManagerState> mapEventToState(
    PhotoManagerEvent event,
  ) async* {
    if (event is AddPhoto) {
      cachedPhotos.add(event.photo);
      yield LoadedPhotosState(List.from(cachedPhotos));
    }
  }
}
