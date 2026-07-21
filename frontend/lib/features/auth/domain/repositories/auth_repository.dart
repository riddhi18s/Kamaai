import '../../../user/domain/user_model.dart';

abstract class AuthRepository {
  Future<void> sendOtp({
    required String phoneNumber,
  });

  Future<UserModel> verifyOtp({
    required String phoneNumber,
    required String otp,
  });

  Future<UserModel?> getCurrentUser();

  Future<bool> isLoggedIn();

  Future<void> logout();
}