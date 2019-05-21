import 'package:equatable/equatable.dart';

class PhotoInfo extends Equatable {
  String title;
  String description;
  String diskLocation;
  String networkUrl;

  PhotoInfo({this.title, this.description, this.diskLocation, this.networkUrl});

  PhotoInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    diskLocation = json['diskLocation'];
    networkUrl = json['networkUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['diskLocation'] = this.diskLocation;
    data['networkUrl'] = this.networkUrl;
    return data;
  }
}
