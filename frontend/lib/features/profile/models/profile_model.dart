class ProfileModel {
  final String uid;
  final String name;
  final String phoneNumber;
  final String gender;
  final DateTime? dateOfBirth;
  final String occupation;
  final String address;
  final String city;
  final String district;
  final String state;
  final String pincode;
  final String language;
  final double? latitude;
  final double? longitude;
  final bool locationEnabled;
  final DateTime? lastLocationUpdate;
  final String? profilePhoto;
  final bool profileCompleted;

  const ProfileModel({
    required this.uid,
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.occupation,
    required this.address,
    required this.city,
    required this.district,
    required this.state,
    required this.pincode,
    required this.language,
    required this.locationEnabled,
    required this.profileCompleted,
    this.latitude,
    this.longitude,
    this.lastLocationUpdate,
    this.profilePhoto,
  });

  factory ProfileModel.empty() {
    return const ProfileModel(
      uid: '',
      name: '',
      phoneNumber: '',
      gender: '',
      dateOfBirth: null,
      occupation: '',
      address: '',
      city: '',
      district: '',
      state: '',
      pincode: '',
      language: 'en',
      locationEnabled: false,
      profileCompleted: false,
    );
  }

  // Sentinel object — null clear karne ke liye
  static const _clear = Object();

  ProfileModel copyWith({
    String? uid,
    String? name,
    String? phoneNumber,
    String? gender,
    Object? dateOfBirth = _clear,
    String? occupation,
    String? address,
    String? city,
    String? district,
    String? state,
    String? pincode,
    String? language,
    Object? latitude = _clear,
    Object? longitude = _clear,
    bool? locationEnabled,
    Object? lastLocationUpdate = _clear,
    Object? profilePhoto = _clear,
    bool? profileCompleted,
  }) {
    return ProfileModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      dateOfBirth: identical(dateOfBirth, _clear)
          ? this.dateOfBirth
          : dateOfBirth as DateTime?,
      occupation: occupation ?? this.occupation,
      address: address ?? this.address,
      city: city ?? this.city,
      district: district ?? this.district,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      language: language ?? this.language,
      latitude: identical(latitude, _clear)
          ? this.latitude
          : latitude as double?,
      longitude: identical(longitude, _clear)
          ? this.longitude
          : longitude as double?,
      locationEnabled: locationEnabled ?? this.locationEnabled,
      lastLocationUpdate: identical(lastLocationUpdate, _clear)
          ? this.lastLocationUpdate
          : lastLocationUpdate as DateTime?,
      profilePhoto: identical(profilePhoto, _clear)
          ? this.profilePhoto
          : profilePhoto as String?,
      profileCompleted: profileCompleted ?? this.profileCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "dateOfBirth": dateOfBirth?.millisecondsSinceEpoch,
      "occupation": occupation,
      "address": address,
      "city": city,
      "district": district,
      "state": state,
      "pincode": pincode,
      "language": language,
      "latitude": latitude,
      "longitude": longitude,
      "locationEnabled": locationEnabled,
      "lastLocationUpdate": lastLocationUpdate?.millisecondsSinceEpoch,
      "profilePhoto": profilePhoto,
      "profileCompleted": profileCompleted,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      uid: map["uid"] ?? "",
      name: map["name"] ?? "",
      phoneNumber: map["phoneNumber"] ?? "",
      gender: map["gender"] ?? "",
      dateOfBirth: map["dateOfBirth"] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(map["dateOfBirth"]),
      occupation: map["occupation"] ?? "",
      address: map["address"] ?? "",
      city: map["city"] ?? "",
      district: map["district"] ?? "",
      state: map["state"] ?? "",
      pincode: map["pincode"] ?? "",
      language: map["language"] ?? "en",
      latitude: (map["latitude"] as num?)?.toDouble(),
      longitude: (map["longitude"] as num?)?.toDouble(),
      locationEnabled: map["locationEnabled"] ?? false,
      lastLocationUpdate: map["lastLocationUpdate"] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(map["lastLocationUpdate"]),
      profilePhoto: map["profilePhoto"],
      profileCompleted: map["profileCompleted"] ?? false,
    );
  }
}