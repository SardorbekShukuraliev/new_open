import 'package:kursol/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:kursol/features/auth/data/models/user_model.dart';
import 'package:kursol/features/auth/domain/entities/api_response_entity.dart';
import 'package:kursol/features/auth/domain/entities/token_entity.dart';
import 'package:kursol/features/auth/domain/entities/user_entity.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';

import '../../domain/entities/api_response_error_entity.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResponse<TokenEntity>> login(
      String username, String password) async {
    try {
      final tokenModel = await remoteDataSource.login(username, password);
      // local storage... here
      return ApiResponse(success: true, data: tokenModel.toEntity());
    } catch (e) {
      return ApiResponse(
        success: false,
        error: ApiResponseErrorEntity(
          code: 'LOGIN_FAILED',
          message: 'Login failed',
        ),
      );
    }
  }

  @override
  Future<ApiResponse<void>> logout() async {
    try {
      await remoteDataSource.logout();
      return ApiResponse(success: true);
    } catch (e) {
      return ApiResponse(
        success: false,
        error: ApiResponseErrorEntity(
          code: 'LOGOUT_FAILED',
          message: 'Logout failed',
        ),
      );
    }
  }

  @override
  Future<ApiResponse<UserEntity>> registerWithEmail(
      String email, String password, String firstName, String lastName) async {
    try {
      final response = await remoteDataSource.registerWithEmail(
          email, password, firstName, lastName);
      // local database ********

      return ApiResponse(success: true, data: response);
    } catch (e) {
      return ApiResponse(
          success: false,
          error: ApiResponseErrorEntity(
              code: "REGISTER_EMAIL_FAILED",
              message: "register failed try again"));
    }
  }

  @override
  Future<ApiResponse<UserEntity>> registerWithPhone(String phoneNumber,
      String password, String firstName, String lastName) async {
    try {
      final userModel = await remoteDataSource.registerWithPhone(
          phoneNumber, password, firstName, lastName);
      return ApiResponse(success: true, data: userModel);
    } catch (e) {
      return ApiResponse(
        success: false,
        error: ApiResponseErrorEntity(
          code: 'REGISTER_FAILED',
          message: 'Registration failed',
        ),
      );
    }
  }

  @override
  UserEntity? getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<TokenEntity>> getGrantCode(String grantCode) {
    // TODO: implement getGrantCode
    throw UnimplementedError();
  }

  @override
  bool isUserLoggedIn() {
    // TODO: implement isUserLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<TokenEntity>> refreshToken(String refreshToken) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<void>> resetPassword(
      String otpCode, List<String> newPassword, List<String> confirmPassword) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<void>> resetPasswordViaEmail(String email) {
    // TODO: implement resetPasswordViaEmail
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<void>> resetPasswordViaPhone(String phone) {
    // TODO: implement resetPasswordViaPhone
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<void>> verifyOtp(String otpCode) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
