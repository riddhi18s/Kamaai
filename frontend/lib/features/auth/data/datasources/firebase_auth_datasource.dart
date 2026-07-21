import '../../../user/domain/user_model.dart';

abstract class FirebaseAuthDataSource {
  Future<void> sendOtp({
    required String phoneNumber,
  });

  Future<UserModel> verifyOtp({
    required String phoneNumber,
    required String otp,
  });

  Future<UserModel?> getCurrentUser();

  Future<void> logout();
}