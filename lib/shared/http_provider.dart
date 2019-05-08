import 'dart:async';

import 'package:dio/dio.dart';

class HttpProvider {
  Future<List> getAll(String endpoint) async {
    Response response = await Dio().get(endpoint);
    return response.data;
  }
}
