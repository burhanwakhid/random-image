import 'package:auto_route/auto_route.dart';

import 'route.gr.dart';

@AutoRouterConfig()
class RandomImageRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: RandomImageRoute.page,
      initial: true,
      path: '/random-image',
    ),

    /// routes go here
  ];
}
