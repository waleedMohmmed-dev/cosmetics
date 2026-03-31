import 'package:cosmetics/network/api_error.dart';
import 'package:dio/dio.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    if (statusCode != null) {
      if (data is Map<String, dynamic> && data['message'] != null) {
        return ApiError(message: data['message']);
      }
    }

    if (statusCode == 302) {
      throw ApiError(message: 'This Email Already Taken');
    }

    switch (error.type) {
      case DioException.connectionTimeout:
        return ApiError(
          message: "Connection timeout. Please check your internet connection",
        );
      case DioExceptionType.sendTimeout:
        return ApiError(message: "Request timeout. Please try again");
      case DioExceptionType.receiveTimeout:
        return ApiError(message: "Response timeout. Please try again");
      default:
        return ApiError(
          message: "An unexpected error occurred. Please try again",
        );
    }
  }
}
