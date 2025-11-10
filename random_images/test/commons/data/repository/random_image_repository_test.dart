import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_sdk/network_sdk.dart';
import 'package:random_images/src/commons/constant.dart';
import 'package:random_images/src/commons/data/models/images.dart';
import 'package:random_images/src/commons/data/repository/random_image_repository.dart';
import 'package:test/test.dart';

class _MockNetworkService extends Mock implements NetworkService {}

void main() {
  group('RandomImageRepositoryImpl', () {
    late _MockNetworkService networkService;
    late RandomImageRepositoryImpl repository;

    const response = {'url': 'https://example.com/image.jpg'};

    setUpAll(() {
      registerFallbackValue(
        ApiCallSpec(path: '/', method: HttpMethod.get),
      );
    });

    setUp(() {
      networkService = _MockNetworkService();
      repository = RandomImageRepositoryImpl(networkService);
    });

    test('returns success when network call succeeds', () async {
      when(() => networkService.fromApiSpec(any()))
          .thenAnswer((_) async => response);

      final result = await repository.fetchComments();

      expect(result, isA<ResultSuccess<Images>>());
      result.when(
        success: (image) => expect(image.url, response['url']),
        empty: () => fail('Should not emit empty'),
        error: (_) => fail('Should not emit error'),
      );
    });

    test('returns error when network call throws', () async {
      when(() => networkService.fromApiSpec(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ApiPath.randomImage),
          error: GeneralError(code: 'network', message: 'Offline'),
        ),
      );

      final result = await repository.fetchComments();

      expect(result, isA<ResultError<Images>>());
    });

    test('invokes API with expected specification', () async {
      ApiCallSpec? capturedSpec;
      when(() => networkService.fromApiSpec(any())).thenAnswer((invocation) async {
        capturedSpec = invocation.positionalArguments.first as ApiCallSpec;
        return response;
      });

      await repository.fetchComments();

      expect(capturedSpec, isNotNull);
      expect(capturedSpec!.path, ApiPath.randomImage);
      expect(capturedSpec!.method, HttpMethod.get);
    });
  });
}
