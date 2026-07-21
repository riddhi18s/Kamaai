import 'dart:convert';

enum UserRole {
  customer,
  worker,
  artisan,
  farmer,
  seller,
}

enum VerificationStatus {
  pending,
  verified,
  rejected,
}

class UserModel {
  final String id;
  final String phoneNumber;
  final String name;
  final String? profilePhoto;
  final String preferredLanguage;

  final List<UserRole> roles;

  final String? state;
  final String? district;
  final String? city;
  final String? address;

  final double? latitude;
  final double? longitude;

  final VerificationStatus verificationStatus;

  final bool isProfileCompleted;
  final bool isActive;

  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastSeen;

  const UserModel({
    required this.id,
    required this.phoneNumber,
    required this.name,
    this.profilePhoto,
    required this.preferredLanguage,
    required this.roles,
    this.state,
    this.district,
    this.city,
    this.address,
    this.latitude,
    this.longitude,
    this.verificationStatus = VerificationStatus.pending,
    this.isProfileCompleted = false,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
    this.lastSeen,
  });

  UserModel copyWith({
    String? id,
    String? phoneNumber,
    String? name,
    String? profilePhoto,
    String? preferredLanguage,
    List<UserRole>? roles,
    String? state,
    String? district,
    String? city,
    String? address,
    double? latitude,
    double? longitude,
    VerificationStatus? verificationStatus,
    bool? isProfileCompleted,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastSeen,
  }) {
    return UserModel(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      roles: roles ?? this.roles,
      state: state ?? this.state,
      district: district ?? this.district,
      city: city ?? this.city,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      verificationStatus:
          verificationStatus ?? this.verificationStatus,
      isProfileCompleted:
          isProfileCompleted ?? this.isProfileCompleted,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'profilePhoto': profilePhoto,
      'preferredLanguage': preferredLanguage,
      'roles': roles.map((e) => e.name).toList(),
      'state': state,
      'district': district,
      'city': city,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'verificationStatus': verificationStatus.name,
      'isProfileCompleted': isProfileCompleted,
      'isActive': isActive,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'lastSeen': lastSeen?.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      name: map['name'] ?? '',
      profilePhoto: map['profilePhoto'],
      preferredLanguage: map['preferredLanguage'] ?? 'hi',
      roles: (map['roles'] as List<dynamic>? ?? [])
          .map((e) => UserRole.values.firstWhere(
                (role) => role.name == e,
                orElse: () => UserRole.customer,
              ))
          .toList(),
      state: map['state'],
      district: map['district'],
      city: map['city'],
      address: map['address'],
      latitude: (map['latitude'] as num?)?.toDouble(),
      longitude: (map['longitude'] as num?)?.toDouble(),
      verificationStatus: VerificationStatus.values.firstWhere(
        (status) => status.name == map['verificationStatus'],
        orElse: () => VerificationStatus.pending,
      ),
      isProfileCompleted:
          map['isProfileCompleted'] ?? false,
      isActive: map['isActive'] ?? true,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        map['createdAt'] ?? 0,
      ),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
        map['updatedAt'] ?? 0,
      ),
      lastSeen: map['lastSeen'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map['lastSeen'],
            )
          : null,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UserModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}