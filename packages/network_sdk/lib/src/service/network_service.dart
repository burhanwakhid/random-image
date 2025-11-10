// ignore_for_file: inference_failure_on_function_invocation, document_ignores

import 'package:dio/dio.dart';

class NetworkService {
  NetworkService(this.dio, {this.baseUrl});
  final Dio dio;
  final String? baseUrl;

  Future<dynamic> createRequest(
    String path,
    String method, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? params,
  }) async {
    headers?.removeWhere((k, v) => v == null);
    requestBody?.removeWhere((k, v) => v == null);
    params?.removeWhere((k, v) => v == null);
    final result = await dio.fetch(
      Options(method: method, headers: headers)
          .compose(
            dio.options,
            path,
            queryParameters: params,
            data: requestBody,
          )
          .copyWith(baseUrl: _combineBaseUrls(dio.options.baseUrl, baseUrl)),
    );

    return result.data;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }
    final url = Uri.parse(baseUrl);
    if (url.isAbsolute) {
      return url.toString();
    }
    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }

  Future<dynamic> fromApiSpec(ApiCallSpec spec) {
    return createRequest(
      spec.path,
      spec.method ?? HttpMethod.get,
      headers: spec.headers,
      requestBody: spec.requestBody,
      params: spec.params,
    );
  }
}

class ApiCallSpec {
  ApiCallSpec({
    required this.path,
    this.method,
    this.requestBody,
    this.params,
    this.headers,
  });
  final String path;
  final String? method;
  final Map<String, dynamic>? requestBody;
  final Map<String, dynamic>? params;
  final Map<String, dynamic>? headers;

  @override
  String toString() {
    return 'ApiCallSpec(path: $path, method: $method, requestBody: $requestBody, params: $params, headers: $headers)';
  }
}

class HttpMethod {
  HttpMethod._(); // prevent instantiation

  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
  static const String head = 'HEAD';

  static const List<String> values = [get, post, put, delete, patch, head];

  static const Set<String> _idempotent = {get, put, delete, head};

  /// Returns uppercased method if supported, otherwise throws.
  static String parse(String method) {
    final up = method.toUpperCase();
    if (values.contains(up)) return up;
    throw ArgumentError('Unsupported HTTP method: $method');
  }

  /// Returns null if unsupported.
  static String? tryParse(String method) {
    final up = method.toUpperCase();
    return values.contains(up) ? up : null;
  }

  static bool isValid(String method) => values.contains(method.toUpperCase());

  static bool isIdempotent(String method) =>
      _idempotent.contains(method.toUpperCase());
}
