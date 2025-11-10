import 'package:get_it/get_it.dart';

import 'service_provider_module.dart';

typedef ModuleFactory<T extends ModuleInjector> = T Function();

/// Tracks module factories to ensure modules are loaded/unloaded in a consistent way.
class ServiceProviderFactoryRegistry {
  ServiceProviderFactoryRegistry(this._getIt);

  final GetIt _getIt;
  final Map<Type, ModuleRegistry> _moduleRegistries = {};

  /// Ensures a module of type [T] is loaded, instantiating it via [factory] when necessary.
  T ensureModule<T extends ModuleInjector>(
    ModuleFactory<T> factory, {
    bool reload = false,
  }) {
    final existingRegistry = _moduleRegistries[T];
    if (existingRegistry != null && !reload) {
      existingRegistry.load();
      return existingRegistry.module as T;
    }

    final module = factory();
    final registry = ModuleRegistry(_getIt, module);

    if (existingRegistry != null) {
      existingRegistry.unload();
    }

    registry.load();
    _moduleRegistries[T] = registry;
    return module;
  }

  /// Unloads and removes a module of type [T] if present.
  void unloadModule<T extends ModuleInjector>() {
    final registry = _moduleRegistries.remove(T);
    registry?.unload();
  }

  /// Unloads every registered module.
  void unloadAll() {
    for (final registry in _moduleRegistries.values) {
      registry.unload();
    }
    _moduleRegistries.clear();
  }

  bool isModuleLoaded<T extends ModuleInjector>() {
    final registry = _moduleRegistries[T];
    return registry?.isLoaded ?? false;
  }
}
