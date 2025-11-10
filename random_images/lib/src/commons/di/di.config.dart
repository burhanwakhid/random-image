// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:network_sdk/network_sdk.dart' as _i1023;
import 'package:random_images/src/commons/data/repository/random_image_repository.dart'
    as _i1059;
import 'package:random_images/src/configurations/random_image_module.dart'
    as _i555;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final randomImageModule = _$RandomImageModule();
    gh.factory<_i361.Dio>(() => randomImageModule.dio);
    gh.factory<_i1023.NetworkService>(
      () => randomImageModule.networkApiService,
    );
    gh.factory<_i1059.RandomImageRepository>(
      () => _i1059.RandomImageRepositoryImpl(gh<_i1023.NetworkService>()),
    );
    return this;
  }
}

class _$RandomImageModule extends _i555.RandomImageModule {}
