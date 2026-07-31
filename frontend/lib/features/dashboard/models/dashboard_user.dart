class DashboardUser {
  final String id;
  final String name;
  final String location;
  final String? profileImage;

  final bool hasKaamKhataData;

  final double totalIncome;

  const DashboardUser({
    required this.id,
    required this.name,
    required this.location,
    this.profileImage,
    this.hasKaamKhataData = false,
    this.totalIncome = 0,
  });

  DashboardUser copyWith({
    String? id,
    String? name,
    String? location,
    String? profileImage,
    bool? hasKaamKhataData,
    double? totalIncome,
  }) {
    return DashboardUser(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      profileImage: profileImage ?? this.profileImage,
      hasKaamKhataData:
          hasKaamKhataData ?? this.hasKaamKhataData,
      totalIncome: totalIncome ?? this.totalIncome,
    );
  }
}