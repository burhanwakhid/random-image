import 'package:network_sdk/network_sdk.dart';
import 'package:persistence_sdk/persistence_sdk.dart';

/// Stores authentication tokens using the provided [PersistenceSdk].
class LocalAuthTokenProvider implements AuthTokenProvider {
  LocalAuthTokenProvider(this._persistence);

  static const _accessTokenKey = 'auth_access_token';
  static const _refreshTokenKey = 'auth_refresh_token';

  final PersistenceSdk _persistence;
  // Function()? _onAuthorizationFailure;

  Future<void> saveTokens({String? accessToken, String? refreshToken}) async {
    if (accessToken != null) {
      await _persistence.setValue<String>(_accessTokenKey, accessToken);
    }
    if (refreshToken != null) {
      await _persistence.setValue<String>(_refreshTokenKey, refreshToken);
    }
  }

  Future<void> clear() async {
    await _persistence.delete(_accessTokenKey);
    await _persistence.delete(_refreshTokenKey);
  }

  // set authorizationFailureCallback(Function()? callback) {
  //   _onAuthorizationFailure = callback;
  // }

  @override
  Future<String?> get accessToken async {
    return persistence.getValue(_accessTokenKey, '');
  }

  @override
  Future<String> refreshToken() async {
    return persistence.getValue(_refreshTokenKey, '');
  }

  // @override
  // void onAuthorizationFailure() {
  //   _onAuthorizationFailure?.call();
  // }

  PersistenceSdk get persistence => _persistence;
}
