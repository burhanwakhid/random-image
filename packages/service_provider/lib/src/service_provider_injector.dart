import 'package:get_it/get_it.dart';

/// Base contract for registering services into a [GetIt] container.
// ignore: one_member_abstracts
abstract class ServiceInjector {
  void init(GetIt getIt);
}
