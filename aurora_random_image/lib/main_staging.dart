import 'package:aurora_random_image/app/app.dart';
import 'package:aurora_random_image/bootstrap.dart';
import 'package:aurora_random_image/sdk_initializer/sdk_initializer.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreInitializers.init(
    baseUrl: 'https://november7-730026606190.europe-west1.run.app',
  );
  await bootstrap(() => const App());
}
