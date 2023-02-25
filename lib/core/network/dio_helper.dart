import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static Dio getDioObject() {
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = const Duration(seconds: 120)
        ..options.receiveTimeout = const Duration(seconds: 120);

      dio!.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: true,
          requestBody: true));

      return dio!;
    } else {
      return dio!;
    }
  }
}
