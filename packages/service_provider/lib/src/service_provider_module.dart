import 'package:get_it/get_it.dart';

/// Defines lifecycle hooks for loading and unloading a module of services.
abstract class ModuleInjector {
  void load(GetIt getIt);

  void unload(GetIt getIt);
}

/// Manages the lifecycle of a [ModuleInjector] instance for a [GetIt] container.
class ModuleRegistry {
  ModuleRegistry(this._getIt, this._module);

  final GetIt _getIt;
  final ModuleInjector _module;

  bool _loaded = false;

  ModuleInjector get module => _module;

  bool get isLoaded => _loaded;

  void load() {
    if (_loaded) {
      return;
    }
    _module.load(_getIt);
    _loaded = true;
  }

  void unload() {
    if (!_loaded) {
      return;
    }
    _module.unload(_getIt);
    _loaded = false;
  }
}
