import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dashboard_repository.dart';
import '../models/dashboard_module.dart';
import '../models/dashboard_user.dart';

final dashboardRepositoryProvider =
    Provider<DashboardRepository>((ref) {
  return DashboardRepository();
});

final dashboardUserProvider =
    FutureProvider<DashboardUser>((ref) async {
  return ref.read(dashboardRepositoryProvider).getDashboardUser();
});

final dashboardModulesProvider =
    FutureProvider<List<DashboardModule>>((ref) async {
  return ref.read(dashboardRepositoryProvider).getModules();
});