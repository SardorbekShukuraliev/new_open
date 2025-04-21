import 'package:kursol/features/auth/data/models/api_response_model.dart';
import 'package:kursol/features/auth/data/models/token_model.dart';
import 'package:kursol/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<TokenModel> login(String username, String password);

  Future<void> logout();

  Future<UserModel> registerWithEmail(
      String email, String password, String firstName, String lastName);

  Future<UserModel> registerWithPhone(
      String phoneNumber, String password, String firstName, String lastName);

  Future<TokenModel> refreshToken(String refreshToken);

  Future<TokenModel> getGrantCode(String grantCode);

  Future<void> resetPassword(
      String otpCode, List<String> newPassword, List<String> confirmPassword);

  Future<void> resetPasswordViaEmail(String email);

  Future<void> resetPasswordViaPhone(String phone);

  Future<void> verifyOtp(String otpCode);
}
