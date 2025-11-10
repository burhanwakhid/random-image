import 'dart:io';
import 'package:dio/dio.dart';
import 'package:auth_sdk/auth_sdk.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure_provider/src/infrastructure_sdk_initializer.dart';
import 'package:network_sdk/network_sdk.dart';
import 'package:persistence_sdk/persistence_sdk.dart';
import 'package:service_provider/service_provider.dart';

/// Registers infrastructure-level SDKs with the service provider.
class InfrastructureInjector extends ServiceInjector {
  InfrastructureInjector(
    this._config, {
    required this.authSdk,
    this.persistenceSdk,
    this.authDio,
  });

  final InfrastructureConfig _config;
  final AuthSdk authSdk;
  final PersistenceSdk? persistenceSdk;
  final Dio? authDio;

  @override
  void init(GetIt getIt) {
    _registerPersistenceIfNeeded(getIt);

    final initializer = InfrastructureSdkInitializer(
      config: _config,
      authDio: authDio,
      authSdk: authSdk,
      headersProvider: () => <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
      },
    );

    getIt.registerSingletonAsync<NetworkSdk>(() => initializer.networkSdk);
  }

  void _registerPersistenceIfNeeded(GetIt getIt) {
    if (persistenceSdk != null && !getIt.isRegistered<PersistenceSdk>()) {
      getIt.registerSingleton<PersistenceSdk>(persistenceSdk!);
    }
  }
}
