import 'package:dio/dio.dart';

class BackendServices {
  static const String baseUrl = 'https://sungod.demospro2023.in.net/api';
  static const String imageBaseUrl = 'https://sungod.demospro2023.in.net';

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  // ✅ LOGIN — POST + form-data
  Future<Response> login({
    required String emailOrPhone,
    required String password,
  }) async {
    return await _dio.post(
      '/login',
      data: FormData.fromMap({
        'email_phone': emailOrPhone,
        'password': password,
      }),
    );
  }

  // ✅ HOME — GET
  Future<Response> fetchHome({
    required String id,
    required String token,
  }) async {
    return await _dio.get(
      '/home/en',
      queryParameters: {
        'id': id,
        'token': token,
      },
    );
  }

  // ✅ PRODUCTS — GET
  Future<Response> fetchProducts({
    required String id,
    required String token,
    String? by,
    String? value,
  }) async {
    return await _dio.get(
      '/products/en',
      queryParameters: {
        'id': id,
        'token': token,
        'by': by,
        'value': value,
      },
    );
  }
}
