import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/models/models.dart';
import 'package:flutter_todo/photo_manager/bloc/bloc.dart';

class PhotoManagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PhotoManagerBloc photosBloc = BlocProvider.of<PhotoManagerBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Photos'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              onPressed: () {
                photosBloc.dispatch(AddPhoto(PhotoInfo()));
              },
              child: Text('Take Photo'),
            ),
          ),
          Expanded(
            child: BlocBuilder(
              bloc: photosBloc,
              builder: (BuildContext context, PhotoManagerState state) {
                if (state is LoadedPhotosState) {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Text(state.photos[index].title),
                      );
                    },
                    itemCount: state.photos.length,
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
