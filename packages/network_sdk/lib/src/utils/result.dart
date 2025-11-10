// ignore_for_file: type_literal_in_constant_pattern, strict_raw_type, inference_failure_on_function_return_type

import 'dart:async';

/// This class serves as a common generic class which can be used to send
/// different states of API call
abstract class NetworkResult<T> {
  /// Error state of Network call with [GeneralError] as parameter
  factory NetworkResult.error(GeneralError error, {T? data}) = ResultError;

  /// Success state of Network call with generic [T] data
  factory NetworkResult.success(T data) = ResultSuccess;

  /// Empty state of Network call
  factory NetworkResult.empty() = ResultEmpty;
  abstract final Type _type;
}

class ResultError<T> implements NetworkResult<T> {
  ResultError(this.error, {this.data});
  final GeneralError error;
  final T? data;

  @override
  final Type _type = ResultError;
}

class ResultSuccess<T> implements NetworkResult<T> {
  ResultSuccess(this.data);
  final T data;

  @override
  final Type _type = ResultSuccess;
}

class ResultEmpty<T> implements NetworkResult<T> {
  @override
  final Type _type = ResultEmpty;
}

extension NetworkResultExtension<T> on NetworkResult<T> {
  R when<R extends Object?>({
    required R Function(GeneralError error) error,
    required R Function(T data) success,
    required R Function() empty,
    R? Function(GeneralError error, {T? data})? errorWithData,
  }) {
    switch (_type) {
      case ResultError:
        final instance = this as ResultError;
        if (instance.data != null && errorWithData != null) {
          final errorWithDataRes = errorWithData(
            instance.error,
            data: instance.data as T,
          );
          if (errorWithDataRes != null) {
            return errorWithDataRes;
          }
        }
        return error((this as ResultError).error);
      case ResultSuccess:
        return success((this as ResultSuccess).data as T);
      case ResultEmpty:
        return empty();
      default:
        throw TypeError();
    }
  }

  Future<void> listen<R extends Object?>({
    required FutureOr<void> Function(T data) onSuccess,
    required FutureOr<void> Function(GeneralError error) onError,
    required Function() onEmpty,
    Future<bool> Function(GeneralError error, {T? data})? onErrorWithData,
  }) async {
    switch (_type) {
      case ResultError:
        final instance = this as ResultError;
        var isHandled = false;
        if (instance.data != null && onErrorWithData != null) {
          isHandled = await onErrorWithData(
            instance.error,
            data: instance.data as T,
          );
        }
        if (!isHandled) {
          await onError((this as ResultError).error);
        }
      case ResultSuccess:
        await onSuccess((this as ResultSuccess).data as T);
      case ResultEmpty:
        onEmpty();
      default:
        throw TypeError();
    }
  }
}

class GeneralError {
  GeneralError({required this.code, required this.message});

  //create empty factory method
  factory GeneralError.empty() {
    return GeneralError(
      code: 'unknown_error',
      message: 'An unknown error occurred.',
    );
  }

  // create from json method
  factory GeneralError.fromJson(Map<String, dynamic> json) {
    return GeneralError(
      code: json['code'] as String,
      message: json['message'] as String,
    );
  }

  final String code;
  final String message;

  // create to json method
  Map<String, dynamic> toJson() {
    return {'code': code, 'message': message};
  }
}
