import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:random_images/src/commons/data/repository/random_image_repository.dart';
import 'package:random_images/src/commons/di/di.config.dart';

final _sl = GetIt.asNewInstance();
bool _initialized = false;

@InjectableInit()
void configureDependencies() {
  if (_initialized) {
    return;
  }
  _sl.init();
  _initialized = true;
}

GetIt get getIt {
  if (!_sl.isRegistered<RandomImageRepository>()) {
    configureDependencies();
  }
  return _sl;
}
