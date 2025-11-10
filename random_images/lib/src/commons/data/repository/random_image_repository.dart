import 'package:injectable/injectable.dart';
import 'package:network_sdk/network_sdk.dart';
import 'package:random_images/src/commons/data/models/images.dart';

import '../../constant.dart';

abstract class RandomImageRepository {
  Future<NetworkResult<Images>> fetchComments();
}

@Injectable(as: RandomImageRepository)
class RandomImageRepositoryImpl implements RandomImageRepository {
  RandomImageRepositoryImpl(this._networkService);

  final NetworkService _networkService;

  @override
  Future<NetworkResult<Images>> fetchComments() {
    return NetworkUtils.parseNetworkResult<Images>(
      _networkService.fromApiSpec,
      args: ApiCallSpec(path: ApiPath.randomImage, method: HttpMethod.get),
      parseResult: (data) => Images.fromJson(data as Map<String, dynamic>),
    );
  }
}
