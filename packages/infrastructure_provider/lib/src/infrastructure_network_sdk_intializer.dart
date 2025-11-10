import 'dart:async';

import 'package:dio/dio.dart';
import 'package:network_sdk/network_sdk.dart';

typedef HeadersProvider = FutureOr<Map<String, dynamic>> Function();
typedef InterceptorsProvider = FutureOr<List<Interceptor>> Function();
typedef DioFactory = Dio Function();

/// Builds configured [NetworkSdk] instances for the application.
class InfrastructureNetworkSdkInitializer {
  InfrastructureNetworkSdkInitializer({
    required this.baseUrl,
    this.dioFactory,
    this.headersProvider,
    this.interceptorsProvider,
  });

  /// Base URL that will be assigned to every [NetworkSdk] instance.
  final String baseUrl;

  /// Factory for building a custom [Dio] instance.
  final DioFactory? dioFactory;

  /// Provider for default headers that should be attached to every request.
  final HeadersProvider? headersProvider;

  /// Provider for interceptors that will be attached to the underlying [Dio].
  final InterceptorsProvider? interceptorsProvider;

  /// Builds a configured [NetworkSdk] instance.
  Future<NetworkSdk> createNetworkSdk() async {
    final dio = dioFactory?.call() ?? Dio();
    final headers = await _resolveHeaders();
    final interceptors = await _resolveInterceptors();

    return NetworkSdk(
      baseUrl: baseUrl,
      dio: dio,
      defaultHeaders: headers,
      interceptors: interceptors,
    );
  }

  Future<Map<String, dynamic>> _resolveHeaders() async {
    if (headersProvider == null) {
      return const {};
    }
    final headers = await Future<Map<String, dynamic>>.value(
      headersProvider!(),
    );
    return Map<String, dynamic>.from(headers);
  }

  Future<List<Interceptor>> _resolveInterceptors() async {
    if (interceptorsProvider == null) {
      return const [];
    }
    final interceptors = await Future<List<Interceptor>>.value(
      interceptorsProvider!(),
    );
    return List<Interceptor>.from(interceptors);
  }
}
