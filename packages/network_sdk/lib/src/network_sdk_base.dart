import 'package:dio/dio.dart';

/// Simple wrapper around [Dio] that ensures a consistent base URL and setup.
class NetworkSdk {
  NetworkSdk({
    required this.baseUrl,
    Dio? dio,
    List<Interceptor> interceptors = const [],
    Map<String, dynamic> defaultHeaders = const {},
  }) : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl)),
       _interceptors = List<Interceptor>.from(interceptors) {
    if (_dio.options.baseUrl.isEmpty) {
      _dio.options.baseUrl = baseUrl;
    }

    if (defaultHeaders.isNotEmpty) {
      _dio.options.headers.addAll(defaultHeaders);
    }

    if (_interceptors.isNotEmpty) {
      _dio.interceptors.addAll(_interceptors);
    }
  }

  /// Base URL used by the SDK.
  final String baseUrl;

  final Dio _dio;
  final List<Interceptor> _interceptors;

  Dio get dio => _dio;

  List<Interceptor> get interceptors => List.unmodifiable(_interceptors);
}
