import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/profile_model.dart';

class ProfileNotifier extends StateNotifier<ProfileModel> {
  ProfileNotifier() : super(ProfileModel.empty());

  // ── Basic Profile ──────────────────────────────────
  void updateName(String value) =>
      state = state.copyWith(name: value);

  void updateGender(String value) =>
      state = state.copyWith(gender: value);

  void updateDateOfBirth(DateTime value) =>
      state = state.copyWith(dateOfBirth: value);

  void updateOccupation(String value) =>
      state = state.copyWith(occupation: value);

  // ── Address ────────────────────────────────────────
  void updateAddress(String value) =>
      state = state.copyWith(address: value);

  void updateCity(String value) =>
      state = state.copyWith(city: value);

  void updateDistrict(String value) =>
      state = state.copyWith(district: value);

  void updateState(String value) =>
      state = state.copyWith(state: value);

  void updatePincode(String value) =>
      state = state.copyWith(pincode: value);

  // ── Language ───────────────────────────────────────
  void updateLanguage(String value) =>
      state = state.copyWith(language: value);

  // ── Profile Photo ──────────────────────────────────
  void updateProfilePhoto(String value) =>
      state = state.copyWith(profilePhoto: value);

  // ── GPS ────────────────────────────────────────────
  void updateLocation({
    required double latitude,
    required double longitude,
  }) {
    state = state.copyWith(
      latitude: latitude,
      longitude: longitude,
      locationEnabled: true,
      lastLocationUpdate: DateTime.now(),
    );
  }

  void clearLocation() {
    state = state.copyWith(
      latitude: null,   // sentinel pattern se ab ye kaam karega
      longitude: null,
      locationEnabled: false,
      lastLocationUpdate: null,
    );
  }

  // ── Auth ───────────────────────────────────────────
  void setPhoneNumber(String phone) =>
      state = state.copyWith(phoneNumber: phone);

  void setUid(String uid) =>
      state = state.copyWith(uid: uid);

  void markProfileCompleted() =>
      state = state.copyWith(profileCompleted: true);

  // ── Validation ─────────────────────────────────────
  bool get isNameValid => state.name.trim().length >= 3;
  bool get isGenderValid => state.gender.isNotEmpty;
  bool get isDobValid => state.dateOfBirth != null;
  bool get isOccupationValid => state.occupation.isNotEmpty;
  bool get isAddressValid => state.address.trim().isNotEmpty;
  bool get isCityValid => state.city.trim().isNotEmpty;
  bool get isDistrictValid => state.district.trim().isNotEmpty;
  bool get isStateValid => state.state.trim().isNotEmpty;
  bool get isPincodeValid => state.pincode.trim().length == 6;
  bool get isLocationValid => state.locationEnabled;

  bool get canContinue =>
      isNameValid &&
      isGenderValid &&
      isOccupationValid &&
      isAddressValid &&
      isDistrictValid &&
      isStateValid &&
      isLocationValid;

  // ── Reset ──────────────────────────────────────────
  void reset() => state = ProfileModel.empty();
}

final profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileModel>(
  (ref) => ProfileNotifier(),
);