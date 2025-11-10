import 'dart:async';
import 'dart:isolate';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:network_sdk/network_sdk.dart';
import 'package:palette_generator_master/palette_generator_master.dart';
import 'package:random_images/src/commons/data/repository/random_image_repository.dart';

part 'random_image_event.dart';
part 'random_image_state.dart';

typedef PaletteExtractor = Future<List<Color>> Function(String imageUrl);

class RandomImageBloc extends Bloc<RandomImageEvent, RandomImageState> {
  final RandomImageRepository _repository;
  final PaletteExtractor _paletteExtractor;

  RandomImageBloc({
    required RandomImageRepository repository,
    PaletteExtractor? paletteExtractor,
  }) : _repository = repository,
       _paletteExtractor = paletteExtractor ?? _defaultPaletteExtractor,
       super(const RandomImageInitial()) {
    on<FetchRandomImage>(_onFetchRandomImage);
  }

  Future<void> _onFetchRandomImage(
    FetchRandomImage event,
    Emitter<RandomImageState> emit,
  ) async {
    emit(
      RandomImageLoading(
        imageUrl: state.imageUrl,
        paletteColors: state.paletteColors,
      ),
    );

    final result = await _repository.fetchComments();

    await result.when(
      success: (data) async {
        final colors = await _paletteExtractor(data.url);
        emit(RandomImageLoaded(imageUrl: data.url, paletteColors: colors));
      },
      empty: () async => emit(
        RandomImageError(
          message: 'No image found',
          imageUrl: state.imageUrl,
          paletteColors: state.paletteColors,
        ),
      ),
      error: (error) async => emit(
        RandomImageError(
          message: error.message,
          imageUrl: state.imageUrl,
          paletteColors: state.paletteColors,
        ),
      ),
    );
  }

  static Future<List<Color>> _defaultPaletteExtractor(String imageUrl) async {
    try {
      final ui.Image image = await _decodeImage(imageUrl);
      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.rawRgba,
      );
      image.dispose();

      if (byteData == null) {
        return [];
      }

      final payload = _PaletteComputePayload(
        bytes: TransferableTypedData.fromList(<Uint8List>[
          byteData.buffer.asUint8List(),
        ]),
        width: image.width,
        height: image.height,
      );

      final colorValues = await compute(_computePaletteColors, payload);
      return colorValues.map(Color.new).toList();
    } catch (_) {
      return [];
    }
  }

  static Future<ui.Image> _decodeImage(String url) {
    final completer = Completer<ui.Image>();
    final imageProvider = NetworkImage(url);
    final stream = imageProvider.resolve(const ImageConfiguration());
    late ImageStreamListener listener;

    listener = ImageStreamListener(
      (ImageInfo info, bool synchronousCall) {
        stream.removeListener(listener);
        completer.complete(info.image);
      },
      onError: (Object error, StackTrace? stackTrace) {
        stream.removeListener(listener);
        completer.completeError(error, stackTrace);
      },
    );

    stream.addListener(listener);
    return completer.future;
  }
}

class _PaletteComputePayload {
  const _PaletteComputePayload({
    required this.bytes,
    required this.width,
    required this.height,
  });

  final TransferableTypedData bytes;
  final int width;
  final int height;
}

Future<List<int>> _computePaletteColors(_PaletteComputePayload payload) async {
  final byteData = payload.bytes.materialize().asByteData();
  final generator = await PaletteGeneratorMaster.fromByteData(
    EncodedImageMaster(byteData, width: payload.width, height: payload.height),
    maximumColorCount: 16,
    colorSpace: ColorSpace.lab,
    generateHarmony: true,
  );

  return generator.paletteColors.map((e) => e.color.toARGB32()).toList();
}
