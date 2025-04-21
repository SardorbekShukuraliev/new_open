import 'package:dio/dio.dart';
import 'package:kursol/core/common/constants/api_urls.dart';
import 'package:kursol/core/network/dio_client.dart';
import 'package:kursol/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:kursol/features/auth/data/models/api_response_model.dart';
import 'package:kursol/features/auth/data/models/token_model.dart';
import 'package:kursol/features/auth/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<TokenModel> login(String username, String password) async {
    try {
      final response = await dioClient.post(
        '/login',
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return TokenModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<void> logout() async {
    try {
      final response = await dioClient.post('/logout');
      if (response.statusCode != 200) {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<UserModel> registerWithEmail(
      String email, String password, String firstName, String lastName) async {
    try {
      final response = await dioClient.post(
        ApiUrls.registerEmail,
        data: {
          'email': email,
          'password': password,
          'first_name': firstName,
          'last_name': lastName,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<UserModel> registerWithPhone(String phoneNumber, String password,
      String firstName, String lastName) async {
    try {
      final response = await dioClient.post(
        ApiUrls.registerPhone,
        data: {
          'phone_number': phoneNumber,
          'password': password,
          'first_name': firstName,
          'last_name': lastName,
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<TokenModel> refreshToken(String refreshToken) async {
    try {
      final response = await dioClient.post(
        '/refresh-token',
        data: {
          'refresh_token': refreshToken,
        },
      );
      if (response.statusCode == 200) {
        return TokenModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<TokenModel> getGrantCode(String grantCode) async {
    try {
      final response = await dioClient.get(
        '/grant-code',
        queryParameters: {'code': grantCode},
      );
      if (response.statusCode == 200) {
        return TokenModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<void> resetPassword(String otpCode, List<String> newPassword,
      List<String> confirmPassword) async {
    try {
      final response = await dioClient.put(
        '/reset-password',
        data: {
          'otp_code': otpCode,
          'new_password': newPassword,
          'confirm_password': confirmPassword,
        },
      );
      if (response.statusCode != 200) {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<void> resetPasswordViaEmail(String email) async {
    try {
      final response = await dioClient.post(
        '/reset-password/email',
        data: {
          'email': email,
        },
      );
      if (response.statusCode != 200) {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<void> resetPasswordViaPhone(String phone) async {
    try {
      final response = await dioClient.post(
        '/reset-password/phone',
        data: {
          'phone': phone,
        },
      );
      if (response.statusCode != 200) {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<void> verifyOtp(String otpCode) async {
    try {
      final response = await dioClient.post(
        '/otp-verification',
        data: {
          'otp_code': otpCode,
        },
      );
      if (response.statusCode != 200) {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  String _parseError(Response response) {
    try {
      final errorJson = response.data;
      return errorJson['message'] ?? 'Unknown error occurred';
    } catch (_) {
      return 'Server error: ${response.statusCode}';
    }
  }

  String _parseDioError(DioException e) {
    if (e.response != null && e.response!.data != null) {
      try {
        final errorJson = e.response!.data;
        return errorJson['message'] ?? 'Unknown error occurred';
      } catch (_) {
        return 'Server error: ${e.response?.statusCode}';
      }
    }
    return e.message ?? 'Network error occurred';
  }
}
