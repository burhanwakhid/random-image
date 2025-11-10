import 'package:dio/dio.dart';

import 'result.dart';

mixin NetworkUtils {
  static Future<NetworkResult<T>> parseNetworkResult<T>(
    Function apiCall, {
    dynamic args,
    List<dynamic> otherArgs = const [],
    T Function(dynamic data)? parseResult,
  }) async {
    try {
      final result = await Function.apply(apiCall, [args, ...otherArgs]);
      return NetworkResult.success(
        parseResult != null ? parseResult(result) : result as T,
      );
    } on DioException catch (e) {
      if (e.error is GeneralError) {
        return NetworkResult.error(e.error! as GeneralError);
      } else if (e.type == DioExceptionType.connectionError) {
        return NetworkResult.error(GeneralError.empty());
      }
      return NetworkResult.error(GeneralError.empty());
    } catch (error, _) {
      // logging these errors via health tracker to track contract mismatch.
      // This error will be triggered in case the deserialization fails

      return NetworkResult.error(GeneralError.empty());
    }
  }

  static Future<NetworkResult<T>> parseNetworkResultWithoutParam<T>(
    Function apiCall, {
    T Function(dynamic data)? parseResult,
  }) async {
    try {
      final result = await apiCall();
      return NetworkResult.success(
        parseResult != null ? parseResult(result) : result as T,
      );
    } on DioException catch (e) {
      if (e.error is GeneralError) {
        return NetworkResult.error(e.error! as GeneralError);
      }
      return NetworkResult.error(GeneralError.empty());
    } catch (error, _) {
      return NetworkResult.error(GeneralError.empty());
    }
  }

  static Future<NetworkResult<T>> parseNetworkResultWithErrorData<T>(
    Function apiCall, {
    required Function(Map<String, dynamic>) parsingErrorData,
    dynamic args,
    dynamic secondArgs,
    T Function(dynamic data)? parseResult,
  }) async {
    try {
      final result = secondArgs != null
          ? await apiCall(args, secondArgs)
          : await apiCall(args);
      return NetworkResult.success(
        parseResult != null ? parseResult(result) : result as T,
      );
    } on DioException catch (e) {
      if (e.error is GeneralError) {
        Map<String, dynamic>? responseBody;
        try {
          responseBody = e.response?.data as Map<String, dynamic>?;
        } catch (e) {
          return NetworkResult.error(GeneralError.empty());
        }
        if (responseBody != null &&
            responseBody.containsKey('data') &&
            responseBody['data'] != null) {
          try {
            return NetworkResult.error(
              e.error! as GeneralError,
              data: parsingErrorData(responseBody) as T,
            );
          } catch (error, _) {
            return NetworkResult.error(e.error! as GeneralError);
          }
        }
        return NetworkResult.error(e.error! as GeneralError);
      }
      return NetworkResult.error(GeneralError.empty());
    } catch (error, _) {
      return NetworkResult.error(GeneralError.empty());
    }
  }
}
