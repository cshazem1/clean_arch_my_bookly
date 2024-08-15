
import 'package:dio/dio.dart';

class ApiService{
  final Dio dio;

  ApiService(this.dio);
  final baseUrl="https://www.googleapis.com/books/v1/";

  get({required String endpoints}) async {
    var response= await dio.get("$baseUrl$endpoints");
    return response.data;

  }

}