import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_images/src/commons/data/repository/random_image_repository.dart';
import 'package:random_images/src/commons/di/di.dart';
import 'package:random_images/src/screens/random_image/bloc/random_image_bloc.dart';
import 'package:random_images/src/screens/random_image/views/random_image_view.dart';

@RoutePage()
class RandomImagePage extends StatefulWidget {
  const RandomImagePage({super.key});

  @override
  State<RandomImagePage> createState() => _RandomImagePageState();
}

class _RandomImagePageState extends State<RandomImagePage>
    implements RandomImageHandler {
  late final _bloc = RandomImageBloc(
    repository: getIt.get<RandomImageRepository>(),
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc..add(FetchRandomImage()),
      child: RandomImageView(handler: this),
    );
  }

  @override
  void fetchRandomImage() {
    _bloc.add(FetchRandomImage());
  }
}

abstract class RandomImageHandler {
  void fetchRandomImage();
}
