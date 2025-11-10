import 'package:auto_route/auto_route.dart';
import 'package:random_images/random_images.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final randomImageRoutes = RandomImageRouter();
  @override
  List<AutoRoute> get routes => [
    ...randomImageRoutes.routes,

    /// other feature routes go here
  ];
}
