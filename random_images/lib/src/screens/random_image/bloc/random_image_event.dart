part of 'random_image_bloc.dart';

@immutable
sealed class RandomImageEvent {}

final class FetchRandomImage extends RandomImageEvent {}
