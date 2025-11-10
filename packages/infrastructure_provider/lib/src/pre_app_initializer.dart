import 'package:auth_sdk/auth_sdk.dart';
import 'package:dio/dio.dart';
import 'package:infrastructure_provider/src/infractructure_initializer.dart';
import 'package:infrastructure_provider/src/initializer/initializer.dart';
import 'package:persistence_sdk/persistence_sdk.dart';
import 'package:service_provider/service_provider.dart';

import '../infrastructure_provider.dart';

/// Executes the required infrastructure setup before the Flutter app starts.
class PreAppInitializers extends Initializer {
  PreAppInitializers({
    required InfrastructureConfig infrastructureConfig,
    required AuthSdk authSdk,
    PersistenceSdk? persistenceSdk,
    Dio? authDio,
  }) : _infrastructureInitializer = InfrastructureInitializer(
         infrastructureConfig,
         authSdk: authSdk,
         persistenceSdk: persistenceSdk,
         authDio: authDio,
       );

  final InfrastructureInitializer _infrastructureInitializer;

  InfrastructureConfig get infrastructureConfig =>
      _infrastructureInitializer.config;

  @override
  Future<bool> init() async {
    await _infrastructureInitializer.init();
    await ServiceProvider.instance.allReady();
    return true;
  }

  @override
  Future<bool> deInit() async {
    await _infrastructureInitializer.deInit();
    ServiceProvider.reset();
    return true;
  }
}
