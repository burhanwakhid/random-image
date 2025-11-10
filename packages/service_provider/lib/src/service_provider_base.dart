import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:service_provider/src/service_provider_injector.dart';
import 'package:service_provider/src/service_provider_module.dart';

abstract class ServiceProvider {
  static GetIt get instance => GetIt.instance;

  /// A function to retrieve or create registered dependency of [T]
  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return instance.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }

  /// A function to retrieve dependency of type [T] that is registered with
  /// [registerSingletonAsync] or [registerLazySingletonAsync]
  static Future<T> getAsync<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return instance.getAsync<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }

  /// Function to register dependency using [ServiceInjector] instance.
  static void register(ServiceInjector injector) {
    injector.init(instance);
  }

  /// Function to register using module [ModuleInjector]
  /// By default it will use root [GetIt] instance, if [getIt] instance passed,
  /// then dependencies will registered into it.
  /// example
  /// ```dart
  /// ServiceProvider.loadModule(module);
  /// ```
  static void loadModule(ModuleInjector module, {GetIt? getIt}) {
    ModuleRegistry(getIt ?? instance, module).load();
  }

  /// Function to unregister using module [ModuleInjector]
  /// By default it will use root [GetIt] instance, if [getIt] instance passed,
  /// then dependencies will registered into it.
  /// example
  /// ```dart
  /// ServiceProvider.unloadModule(module);
  /// ```
  static void unloadModule(ModuleInjector module, {GetIt? getIt}) {
    ModuleRegistry(getIt ?? instance, module).unload();
  }

  /// Function to reset all getIt instances
  static void reset({bool dispose = true}) {
    unawaited(instance.reset(dispose: dispose));
  }

  /// Get instance with isRegistered check
  static T? safeGet<T extends Object>({GetIt? getIt}) {
    final currentInstance = getIt ?? instance;
    if (currentInstance.isRegistered<T>()) {
      return currentInstance.get<T>();
    }
    return null;
  }

  /// Get instance with isReadySync & isRegistered check
  static T? safeGetIfReady<T extends Object>({GetIt? getIt}) {
    final currentInstance = getIt ?? instance;
    if (currentInstance.isReadySync<T>() && currentInstance.isRegistered<T>()) {
      return currentInstance.get<T>();
    }
    return null;
  }
}
