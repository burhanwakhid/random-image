import 'package:get_it/get_it.dart';

import 'service_provider_module.dart';

extension ModuleRegistryGetItExt on GetIt {
  void loadModule(ModuleInjector module) {
    ModuleRegistry(this, module).load();
  }

  void unloadModule(ModuleInjector module) {
    ModuleRegistry(this, module).unload();
  }
}
