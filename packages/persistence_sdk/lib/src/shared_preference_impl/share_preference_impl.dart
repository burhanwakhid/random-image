import 'package:shared_preferences/shared_preferences.dart';

import '../../persistence_sdk.dart';

/// [PersistenceSdk] backed by the global [SharedPreferences] instance.
class SharedPreferencesPersistenceSdk implements PersistenceSdk {
  SharedPreferencesPersistenceSdk(this._preferences);

  factory SharedPreferencesPersistenceSdk.from(SharedPreferences prefs) =>
      SharedPreferencesPersistenceSdk(prefs);

  final SharedPreferences _preferences;

  static Future<SharedPreferencesPersistenceSdk> create() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPreferencesPersistenceSdk(prefs);
  }

  @override
  SharedPreferences get instance => _preferences;

  @override
  T getValue<T>(String key, T defaultValue) {
    if (!_preferences.containsKey(key)) {
      return defaultValue;
    }

    final value = _preferences.get(key);
    if (value == null) {
      return defaultValue;
    }

    if (value is T) {
      return value as T;
    }

    throw UnsupportedError(
      'Unsupported type ${value.runtimeType} for key $key. Expected $T.',
    );
  }

  @override
  Future<bool> setValue<T>(String key, T value) {
    if (value is int) {
      return _preferences.setInt(key, value);
    }
    if (value is double) {
      return _preferences.setDouble(key, value);
    }
    if (value is String) {
      return _preferences.setString(key, value);
    }
    if (value is bool) {
      return _preferences.setBool(key, value);
    }
    if (value is List<String>) {
      return _preferences.setStringList(key, value);
    }
    throw UnsupportedError(
      'Unsupported type ${value.runtimeType} when setting key $key.',
    );
  }

  @override
  Future<bool> delete(String key) {
    return _preferences.remove(key);
  }

  @override
  bool isKeyExist(String key) => _preferences.containsKey(key);
}
