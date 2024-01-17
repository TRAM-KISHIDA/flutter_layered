import 'package:dio/dio.dart';

class ApiHelper {
  static const baseUrl = "https://pokeapi.co";
  static const headers = {
    "Authorization": "Bearer",
    "Content-Type": "application/json",
  };

  static final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
    ),
  );
}
