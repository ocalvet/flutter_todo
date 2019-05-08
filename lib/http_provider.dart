import 'package:dio/dio.dart';

class HttpProvider {
  Future<List<Map<String, dynamic>>> getAll(String endpoint) async {
    Response response = await Dio().get(endpoint);
    return response.data;
  }
}
