part of 'random_image_bloc.dart';

@immutable
sealed class RandomImageState extends Equatable {
  const RandomImageState({
    this.imageUrl,
    this.paletteColors = const [],
    this.message,
  });

  final String? imageUrl;
  final List<Color> paletteColors;
  final String? message;

  @override
  List<Object?> get props => [imageUrl, paletteColors, message];
}

final class RandomImageInitial extends RandomImageState {
  const RandomImageInitial();
}

final class RandomImageLoading extends RandomImageState {
  const RandomImageLoading({
    super.imageUrl,
    super.paletteColors,
  });
}

final class RandomImageLoaded extends RandomImageState {
  const RandomImageLoaded({
    required super.imageUrl,
    required super.paletteColors,
  });
}

final class RandomImageError extends RandomImageState {
  const RandomImageError({
    required super.message,
    super.imageUrl,
    super.paletteColors,
  });
}
