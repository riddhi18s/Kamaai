import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/auth_step.dart';

enum AuthMode {
  login,
  register,
}

class AuthState {
  final AuthMode mode;
  final AuthStep step;
  final String phoneNumber;
  final String otp;
  final String password;
  final bool isLoading;
  final bool obscurePassword;

  const AuthState({
    this.mode = AuthMode.login,
    this.step = AuthStep.phone,
    this.phoneNumber = '',
    this.otp = '',
    this.password = '',
    this.isLoading = false,
    this.obscurePassword = true,
  });

  AuthState copyWith({
    AuthMode? mode,
    AuthStep? step,
    String? phoneNumber,
    String? otp,
    String? password,
    bool? isLoading,
    bool? obscurePassword,
  }) {
    return AuthState(
      mode: mode ?? this.mode,
      step: step ?? this.step,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      otp: otp ?? this.otp,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }

  bool get isPhoneValid => phoneNumber.length == 10;

  bool get isOtpValid => otp.length == 6;

  bool get isPasswordValid => password.length >= 6;
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void setMode(AuthMode mode) {
    clearControllers();

    state = AuthState(
      mode: mode,
      step: AuthStep.phone,
    );
  }

  void updatePhone(String value) {
    state = state.copyWith(phoneNumber: value);
  }

  void updateOtp(String value) {
    state = state.copyWith(otp: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void togglePasswordVisibility() {
    state = state.copyWith(
      obscurePassword: !state.obscurePassword,
    );
  }

  void goTo(AuthStep step) {
    state = state.copyWith(step: step);
  }

  void nextStep() {
    switch (state.step) {
      case AuthStep.phone:
        goTo(AuthStep.otp);
        break;

      case AuthStep.otp:
        goTo(AuthStep.password);
        break;

      case AuthStep.password:
        goTo(AuthStep.voice);
        break;

      case AuthStep.voice:
        goTo(AuthStep.completed);
        break;

      case AuthStep.completed:
        break;
    }
  }

  void previousStep() {
    switch (state.step) {
      case AuthStep.phone:
        break;

      case AuthStep.otp:
        goTo(AuthStep.phone);
        break;

      case AuthStep.password:
        goTo(AuthStep.otp);
        break;

      case AuthStep.voice:
        goTo(AuthStep.password);
        break;

      case AuthStep.completed:
        goTo(AuthStep.voice);
        break;
    }
  }

  bool canContinue() {
    switch (state.step) {
      case AuthStep.phone:
        return state.isPhoneValid;

      case AuthStep.otp:
        return state.isOtpValid;

      case AuthStep.password:
        return state.isPasswordValid;

      case AuthStep.voice:
        return true;

      case AuthStep.completed:
        return false;
    }
  }

  void clearControllers() {
    phoneController.clear();
    otpController.clear();
    passwordController.clear();
  }

  void reset() {
    clearControllers();
    state = AuthState(mode: state.mode);
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);