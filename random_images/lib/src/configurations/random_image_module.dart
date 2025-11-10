import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network_sdk/network_sdk.dart';
import 'package:service_provider/service_provider.dart';

@module
abstract class RandomImageModule {
  Dio get dio => ServiceProvider.get<NetworkSdk>().dio;

  NetworkService get networkApiService => NetworkService(dio);
}
