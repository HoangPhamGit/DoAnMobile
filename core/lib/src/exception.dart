import 'package:dio/dio.dart';

class ErrorCode {
  static const String nullData = "-C1";
  static const String formatErrorHandling = "-C2";
}

enum ExceptionTypeCore {
  apiException,
  dio,
  other,
}

class ApiException implements Exception {
  final String errorCode;
  final String? errorMessage;
  Object? data;
  // String? serverErrorCode;
  Exception? innerException;
  StackTrace? stackTrace;
  Response? response;
  RequestOptions? requestOptions;

  ApiException({
    required this.errorCode,
    required this.errorMessage,
    // this.serverErrorCode,
    this.data,
    this.response,
    this.requestOptions,
  });
}

class ValidateException extends DioError {
  String? errorCode;
  String? errorMessage;
  RequestOptions requestOptions;
  ValidateException({
    this.errorCode,
    this.errorMessage,
    required this.requestOptions,
  }) : super(requestOptions: requestOptions);
}
