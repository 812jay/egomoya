import 'dart:developer';

import 'package:dio/dio.dart';

class CustomExceptionUtil {
  static void logging(CustomException e) {
    switch (e.type) {
      case CustomExceptionType.api:
        if (e.exception is CustomDioError) {
          final customDioError = e.exception as CustomDioError;

          if (customDioError.response?.statusCode == 401 ||
              customDioError.type == DioExceptionType.cancel ||
              customDioError.type == DioExceptionType.connectionTimeout) {
            log(
              '',
              error: e,
              stackTrace: e.stackTrace,
            );
          } else {
            log(
              '',
              error: customDioError,
              stackTrace: e.stackTrace,
            );
          }
        }
        break;
      case CustomExceptionType.handled:
        log(
          e.msg,
          error: e.exception,
          stackTrace: e.stackTrace,
        );
        break;
      case CustomExceptionType.warn:
        log(
          e.msg,
          error: e.exception,
          stackTrace: e.stackTrace,
        );
        break;
      case CustomExceptionType.unknown:
        log(
          e.msg,
          error: e.exception,
          stackTrace: e.stackTrace,
        );
        break;
    }
  }

  static bool isShowToastFromDioError(CustomException e) {
    if (e.exception is CustomDioError) {
      final customDioError = e.exception as CustomDioError;
      return customDioError.response?.statusCode != 401 &&
          customDioError.type != DioExceptionType.cancel;
    }

    return true;
  }
}

class CustomException {
  final CustomExceptionType type;
  final Object exception;
  final StackTrace stackTrace;
  final String msg;

  CustomException({
    required this.type,
    required this.exception,
    required this.stackTrace,
    required this.msg,
  });
}

enum CustomExceptionType { api, handled, warn, unknown }

extension ExceptionTypeExt on CustomExceptionType {
  bool get isHandled => this == CustomExceptionType.handled;
  bool get isUnknown => this == CustomExceptionType.unknown;
  bool get isWarn => this == CustomExceptionType.warn;
  bool get isApi => this == CustomExceptionType.api;
}

class CustomDioError extends DioException {
  CustomDioError({
    required DioException e,
  })  : logMsg = _getDioErrorMsg(e),
        super(
          requestOptions: e.requestOptions,
          error: e.error,
          response: e.response,
          type: e.type,
        );
  final String logMsg;

  static String _getDioErrorMsg(DioException dioError) =>
      '\t[${dioError.requestOptions.method}] path = ${dioError.requestOptions.path}\n\tqueryParam = ${dioError.requestOptions.queryParameters}\n\trequest body = ${dioError.requestOptions.data}\n\tresponse = ${dioError.response}\n\theaders = ${dioError.requestOptions.headers}';

  @override
  String toString() {
    var msg = 'DioError [$type]: $message';
    msg += '\n$logMsg';
    if (error is Error) {
      msg += '\n${(error as Error).stackTrace}';
    }
    msg += '\nSource stack:\n$stackTrace';
    return msg;
  }
}
