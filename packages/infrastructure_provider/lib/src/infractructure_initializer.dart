import 'package:auth_sdk/auth_sdk.dart';
import 'package:dio/dio.dart';
import 'package:infrastructure_provider/src/infrastructure_sdk_initializer.dart';
import 'package:infrastructure_provider/src/infrastucture_injector.dart';
import 'package:persistence_sdk/persistence_sdk.dart';
import 'package:service_provider/service_provider.dart';

import 'initializer/initializer.dart';

/// Handles registration of infrastructure services with the service provider.
class InfrastructureInitializer implements Initializer {
  InfrastructureInitializer(
    this.config, {
    required this.authSdk,
    this.persistenceSdk,
    this.authDio,
  });

  final InfrastructureConfig config;
  final AuthSdk authSdk;
  final PersistenceSdk? persistenceSdk;
  final Dio? authDio;

  @override
  Future<bool> init() async {
    ServiceProvider.register(
      InfrastructureInjector(
        config,
        authSdk: authSdk,
        persistenceSdk: persistenceSdk,
        authDio: authDio,
      ),
    );
    return true;
  }

  @override
  Future<bool> deInit() async => true;
}
