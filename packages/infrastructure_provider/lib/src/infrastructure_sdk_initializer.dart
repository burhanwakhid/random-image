import 'dart:async';

import 'package:auth_sdk/auth_sdk.dart';
import 'package:dio/dio.dart';
import 'package:infrastructure_provider/src/infrastructure_network_sdk_intializer.dart';
import 'package:network_sdk/network_sdk.dart';

/// Lightweight configuration describing the network environment.
class NetworkConfig {
  const NetworkConfig({required this.baseUrl, this.enableLogging = false});

  final String baseUrl;
  final bool enableLogging;
}

/// Top-level configuration for infrastructure dependencies.
class InfrastructureConfig {
  const InfrastructureConfig({required this.networkConfig});

  final NetworkConfig networkConfig;
}

/// Coordinates initialization of SDKs used by the app.
class InfrastructureSdkInitializer {
  InfrastructureSdkInitializer({
    required this.config,
    required this.authSdk,
    this.loggingInterceptors = const [],
    this.headersProvider,
    Dio? authDio,
  }) : _authDio = authDio ?? Dio();

  final InfrastructureConfig config;
  final List<Interceptor> loggingInterceptors;
  final FutureOr<Map<String, dynamic>> Function()? headersProvider;
  final AuthSdk authSdk;

  final Dio _authDio;

  NetworkSdk? _networkSdk;

  Future<NetworkSdk> get networkSdk async =>
      _networkSdk ??= await _createNetworkSdk();

  Future<NetworkSdk> _createNetworkSdk() {
    final networkConfig = config.networkConfig;

    final networkInitializer = InfrastructureNetworkSdkInitializer(
      baseUrl: networkConfig.baseUrl,
      dioFactory: Dio.new,
      headersProvider: headersProvider,
      interceptorsProvider: () async {
        final interceptors = <Interceptor>[
          AuthInterceptor(
            dio: _authDio,
            authTokenProvider: authSdk,
            authListener: authSdk,
          ),
          ...loggingInterceptors,
        ];
        if (networkConfig.enableLogging) {
          interceptors.add(
            LogInterceptor(requestBody: true, responseBody: true),
          );
        }
        return interceptors;
      },
    );

    return networkInitializer.createNetworkSdk();
  }
}
