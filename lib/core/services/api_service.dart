import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio}) {
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.post(
      endpoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }
}
