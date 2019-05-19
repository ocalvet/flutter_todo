import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AddtodoBloc extends Bloc<AddtodoEvent, AddtodoState> {
  @override
  AddtodoState get initialState => InitialAddtodoState();

  @override
  Stream<AddtodoState> mapEventToState(
    AddtodoEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
