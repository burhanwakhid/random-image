/// Base contract for app initialization routines.
abstract class Initializer {
  Future<bool> init();

  Future<bool> deInit();
}
