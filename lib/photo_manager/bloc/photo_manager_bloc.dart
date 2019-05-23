import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PhotoManagerBloc extends Bloc<PhotoManagerEvent, PhotoManagerState> {
  @override
  PhotoManagerState get initialState => InitialPhotoManagerState();

  @override
  Stream<PhotoManagerState> mapEventToState(
    PhotoManagerEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
