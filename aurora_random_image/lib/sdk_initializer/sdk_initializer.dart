import 'package:auth_sdk/auth_sdk.dart';
import 'package:infrastructure_provider/infrastructure_provider.dart';
import 'package:persistence_sdk/persistence_sdk.dart';

class PreInitializers {
  static Future<void> init({required String baseUrl}) async {
    final persistenceSdk = await SharedPreferencesPersistenceSdk.create();
    final tokenProvider = LocalAuthTokenProvider(persistenceSdk);
    final authSdk = AuthSdkImpl(tokenProvider: tokenProvider);

    final preAppInitializers = PreAppInitializers(
      infrastructureConfig: InfrastructureConfig(
        networkConfig: NetworkConfig(baseUrl: baseUrl, enableLogging: true),
      ),
      authSdk: authSdk,
      persistenceSdk: persistenceSdk,
    );

    await preAppInitializers.init();
  }
}
