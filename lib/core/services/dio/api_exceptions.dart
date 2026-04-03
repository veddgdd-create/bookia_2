import 'package:dio/dio.dart';
import 'package:bookia/core/errors/exceptions.dart';

class ApiException implements Exception {
  final String message;
  const ApiException(this.message);

  /// Maps DioException to custom exceptions
  static Exception mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
          return const AuthException(
            'Authentication failed. Please login again.',
          );
        } else if ((e.response?.statusCode ?? 0) >= 500) {
          return const ServerException('Server error. Please try again later.');
        } else if ((e.response?.statusCode ?? 0) >= 400 &&
            (e.response?.statusCode ?? 0) < 500) {
          final msg = e.response?.data['message'] ?? 'Request failed';
          return ServerException(msg.toString());
        }
        return const NetworkException('Connection error. Check your internet.');
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
        return const NetworkException('Network error occurred.');
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
      default:
        return const NetworkException('Unexpected error occurred.');
    }
  }
}
