// ignore_for_file: one_member_abstracts

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network_sdk/src/interceptor/refresh_token_handler.dart';

/// Interceptor that refreshes access tokens transparently when a `401`
/// response is returned. Once a new token is obtained, the failed request is
/// replayed with the updated credentials.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required Dio dio,
    required this.authTokenProvider,
    this.authListener,
    this.retryAttempts = 2,
  }) : _dio = dio;

  final Dio _dio;
  final AuthTokenProvider authTokenProvider;
  final AuthListener? authListener;

  /// API call will be retried up to this many additional attempts after a 401.
  final int retryAttempts;

  RefreshTokenHandler? _refreshTokenHandler;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await authTokenProvider.accessToken;
    if ((accessToken ?? '').isNotEmpty) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    await _handleOnError(err, handler, retryAttempts);
  }

  Future<void> _handleOnError(
    DioException err,
    ErrorInterceptorHandler handler,
    int attemptsRemaining,
  ) async {
    if (!_shouldRetryWithNewToken(err)) {
      handler.next(err);
      return;
    }

    final handlerInstance = _refreshTokenHandler ??= RefreshTokenHandler(
      authTokenProvider,
    );
    final refreshResult = await handlerInstance.refreshToken();

    if (refreshResult is RefreshTokenSuccessResult) {
      try {
        final response = await _retryApiCall(
          refreshResult.token,
          err.requestOptions,
        );
        _refreshTokenHandler = null;
        handler.resolve(response);
        return;
      } on DioException catch (retryError) {
        _refreshTokenHandler = null;
        await _handleRetryFailure(retryError, err, handler, attemptsRemaining);
        return;
      }
    }

    _refreshTokenHandler = null;

    if (err.response?.statusCode != HttpStatus.unauthorized) {
      handler.next(err);
      return;
    }

    authListener?.onAuthorizationFailure();
    handler.reject(err);
  }

  Future<void> _handleRetryFailure(
    DioException retryError,
    DioException originalError,
    ErrorInterceptorHandler handler,
    int attemptsRemaining,
  ) async {
    if (_isAuthorizationError(retryError.response?.statusCode)) {
      if (attemptsRemaining <= 0) {
        authListener?.onAuthorizationFailure();
        handler.reject(retryError);
      } else {
        await _handleOnError(retryError, handler, attemptsRemaining - 1);
      }
    } else {
      handler.next(retryError);
    }
  }

  Future<Response<dynamic>> _retryApiCall(
    String newToken,
    RequestOptions request,
  ) async {
    request.headers[HttpHeaders.authorizationHeader] = 'Bearer $newToken';
    final options = Options(
      method: request.method,
      headers: request.headers,
      responseType: request.responseType,
      sendTimeout: request.sendTimeout,
      receiveTimeout: request.receiveTimeout,
      extra: request.extra,
      contentType: request.contentType,
      followRedirects: request.followRedirects,
      receiveDataWhenStatusError: request.receiveDataWhenStatusError,
      requestEncoder: request.requestEncoder,
      responseDecoder: request.responseDecoder,
      validateStatus: request.validateStatus,
    );

    return _dio.request<dynamic>(
      request.uri.toString(),
      data: request.data,
      queryParameters: request.queryParameters,
      options: options,
      cancelToken: request.cancelToken,
      onReceiveProgress: request.onReceiveProgress,
      onSendProgress: request.onSendProgress,
    );
  }

  bool _shouldRetryWithNewToken(DioException error) {
    return _isAuthorizationError(error.response?.statusCode) &&
        _isAuthenticatedRequest(error.requestOptions);
  }

  bool _isAuthorizationError(int? statusCode) =>
      statusCode == HttpStatus.unauthorized;

  bool _isAuthenticatedRequest(RequestOptions requestOptions) =>
      _extractTokenFromRequest(requestOptions)?.isNotEmpty ?? false;

  String? _extractTokenFromRequest(RequestOptions requestOptions) {
    final authHeader = requestOptions.headers.entries.firstWhere(
      (entry) =>
          entry.key.toLowerCase() ==
          HttpHeaders.authorizationHeader.toLowerCase(),
      orElse: () => const MapEntry('', null),
    );

    final value = authHeader.value;
    if (value is String && value.startsWith('Bearer ')) {
      return value.substring(7);
    }
    return null;
  }
}

abstract class AuthTokenProvider {
  Future<String?> get accessToken;

  Future<String> refreshToken();
}

abstract class AuthListener {
  void onAuthorizationFailure();
}
