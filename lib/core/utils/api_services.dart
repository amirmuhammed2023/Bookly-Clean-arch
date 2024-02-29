import 'package:dio/dio.dart';

class apiservices {
  final Dio _dio;
  final baseurl = "https://www.googleapis.com/books/v1/";

  apiservices(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get("$baseurl$endpoint");
    return response.data;
  }
}
