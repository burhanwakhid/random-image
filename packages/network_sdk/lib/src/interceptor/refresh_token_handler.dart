// ignore_for_file: discarded_futures, inference_failure_on_untyped_parameter

import 'dart:async';

import 'auth_interceptor.dart';

class RefreshTokenHandler {
  RefreshTokenHandler(this.authTokenProvider);
  Completer<RefreshTokenResult>? _completer;
  final AuthTokenProvider authTokenProvider;

  FutureOr<RefreshTokenResult> refreshToken() {
    if (_completer == null) {
      _completer = Completer();
      authTokenProvider
          .refreshToken()
          .then(
            (value) {
              if (value.isNotEmpty) {
                _completer?.complete(RefreshTokenSuccessResult(value));
              } else {
                _completer?.complete(const RefreshTokenErrorResult());
              }
            },
            onError: (e) {
              _completer?.complete(
                RefreshTokenErrorResult(exception: e as Exception?),
              );
              return;
            },
          )
          .catchError((e) {
            _completer?.complete(const RefreshTokenErrorResult());
          });
    }
    return _completer!.future;
  }
}

abstract class RefreshTokenResult {}

class RefreshTokenSuccessResult implements RefreshTokenResult {
  const RefreshTokenSuccessResult(this.token);
  final String token;
}

class RefreshTokenErrorResult implements RefreshTokenResult {
  const RefreshTokenErrorResult({this.exception});
  final Exception? exception;
}
