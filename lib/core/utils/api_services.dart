import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);
  final baseURL = "https://www.googleapis.com/books/v1/";
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$baseURL$endPoint");
    return response.data;
  }
}
