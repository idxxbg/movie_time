import 'package:dio/dio.dart';
import 'package:film_time/core/constants/api_constants.dart';

class AppApi {
  final Dio _dio;
  AppApi(this._dio) {
    _dio.options.baseUrl = ApiConstants.phimApi;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 5);

    // Add interceptor for logging
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request URL: ${options.baseUrl}${options.path}');
        print('Query Parameters: ${options.queryParameters}');
        return handler.next(options); // Continue the request
      },
      onResponse: (response, handler) {
        // print('Response Data: ${response.data}');
        return handler.next(response); // Continue the response
      },
      onError: (DioError error, handler) {
        print('Request Error: $error');
        return handler.next(error); // Continue the error
      },
    ));
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
