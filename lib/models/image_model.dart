import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  String title;
  String description;
  String diskLocation;
  String networkUrl;

  ImageModel(
      {this.title, this.description, this.diskLocation, this.networkUrl});

  ImageModel.fromJson(Map<String, dynamic> json) {
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
