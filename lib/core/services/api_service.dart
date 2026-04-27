import 'package:dio/dio.dart';
import 'package:k_rehab/core/constants/app_secrets.dart';

class ApiService {
  final Dio dio;

  static const String _baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models';

  ApiService({required this.dio}) {
    dio.options.baseUrl = _baseUrl;
    dio.options.queryParameters = {'key': AppSecrets.geminiApiKey};
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
  }) async {
    final response = await dio.post(endpoint, data: body);
    return response.data;
  }
}
