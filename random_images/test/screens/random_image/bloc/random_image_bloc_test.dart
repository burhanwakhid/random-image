import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_sdk/network_sdk.dart';
import 'package:random_images/src/commons/data/models/images.dart';
import 'package:random_images/src/commons/data/repository/random_image_repository.dart';
import 'package:random_images/src/screens/random_image/bloc/random_image_bloc.dart';
import 'package:test/test.dart';

class _MockRandomImageRepository extends Mock
    implements RandomImageRepository {}

void main() {
  late _MockRandomImageRepository repository;
  const imageUrl = 'https://example.com/image.jpg';
  const fallbackPalette = <Color>[Color(0xFFFF5722), Color(0xFF00BCD4)];
  final image = Images(url: imageUrl);
  final generalError = GeneralError(
    code: 'oops',
    message: 'Something went wrong',
  );

  setUp(() {
    repository = _MockRandomImageRepository();
  });

  RandomImageBloc buildBloc({PaletteExtractor? extractor}) {
    return RandomImageBloc(
      repository: repository,
      paletteExtractor: extractor ?? (_) async => fallbackPalette,
    );
  }

  blocTest<RandomImageBloc, RandomImageState>(
    'emits loading then loaded when fetch succeeds',
    build: () {
      when(
        () => repository.fetchComments(),
      ).thenAnswer((_) async => NetworkResult.success(image));
      return buildBloc();
    },
    act: (bloc) => bloc.add(FetchRandomImage()),
    expect: () => [
      const RandomImageLoading(),
      const RandomImageLoaded(
        imageUrl: imageUrl,
        paletteColors: fallbackPalette,
      ),
    ],
    verify: (_) => verify(() => repository.fetchComments()).called(1),
  );

  blocTest<RandomImageBloc, RandomImageState>(
    'keeps previous image when fetch results in error',
    build: () {
      when(
        () => repository.fetchComments(),
      ).thenAnswer((_) async => NetworkResult.error(generalError));
      return buildBloc();
    },
    seed: () => const RandomImageLoaded(
      imageUrl: imageUrl,
      paletteColors: fallbackPalette,
    ),
    act: (bloc) => bloc.add(FetchRandomImage()),
    expect: () => [
      const RandomImageLoading(
        imageUrl: imageUrl,
        paletteColors: fallbackPalette,
      ),
      RandomImageError(
        message: generalError.message,
        imageUrl: imageUrl,
        paletteColors: fallbackPalette,
      ),
    ],
  );

  blocTest<RandomImageBloc, RandomImageState>(
    'emits empty error message when repository returns empty result',
    build: () {
      when(
        () => repository.fetchComments(),
      ).thenAnswer((_) async => NetworkResult.empty());
      return buildBloc();
    },
    seed: () => const RandomImageLoaded(
      imageUrl: imageUrl,
      paletteColors: fallbackPalette,
    ),
    act: (bloc) => bloc.add(FetchRandomImage()),
    expect: () => [
      const RandomImageLoading(
        imageUrl: imageUrl,
        paletteColors: fallbackPalette,
      ),
      const RandomImageError(
        message: 'No image found',
        imageUrl: imageUrl,
        paletteColors: fallbackPalette,
      ),
    ],
  );
}
