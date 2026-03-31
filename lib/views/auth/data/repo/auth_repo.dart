import 'package:cosmetics/network/api_error.dart';
import 'package:cosmetics/network/api_exceptios.dart';
import 'package:cosmetics/network/api_service.dart';
import 'package:cosmetics/utils/pref_helper.dart';
import 'package:cosmetics/views/auth/data/model/user_model.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  final ApiService apiService = ApiService();

  /// Login
  Future<UserModel?> login(
    String countryCode,
    String phoneNumber,
    String password,
  ) async {
    try {
      final response = await apiService.post('/api/Auth/login', {
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
        "password": password,
      });

      if (response is Map<String, dynamic>) {
        final message = response['message'];
        final code = response['statuscode'];
        if (code != null) {
          throw ApiError(message: '$message');
        }
      }

      final user = UserModel.fromJson(response);

      if (user.token != null) {
        await PrefHelper.saveToken(user.token!);
      }
      return user;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  /// Register
  Future<UserModel?> register(
    String userName,
    String countryCode,
    String phoneNumber,
    String email,
    String password,
  ) async {
    try {
      final response = await apiService.post('/api/Auth/register', {
        'username': userName,
        'countryCode': countryCode,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
      });

      if (response is Map<String, dynamic>) {
        final message = response['message'];
        final code = response['status code'];
        if (code != 200 && code != 201) {
          throw ApiError(message: '$message');
        }
      }

      final user = UserModel.fromJson(response);
      if (user.token != null) {
        await PrefHelper.saveToken(user.token!);
      }
      return user;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  /// forget password
}
