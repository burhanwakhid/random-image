import 'package:shared_preferences/shared_preferences.dart';

/// Contract for persistence access used throughout the infrastructure layer.
abstract class PersistenceSdk {
  SharedPreferences get instance;

  T getValue<T>(String key, T defaultValue);

  Future<bool> setValue<T>(String key, T value);

  Future<bool> delete(String key);

  bool isKeyExist(String key);
}
