import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/utils/app_icons.dart';
import '../models/dashboard_module.dart';
import '../models/dashboard_user.dart';

class DashboardRepository {
  Future<DashboardUser> getDashboardUser() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return const DashboardUser(
      id: "",
      name: "",
      location: "",
      hasKaamKhataData: false,
      totalIncome: 0,
    );
  }

  Future<List<DashboardModule>> getModules() async {
    await Future.delayed(const Duration(milliseconds: 150));

    return const [
      DashboardModule(
        id: "kaam_khata",
        titleKey: "kaamKhataTitle",
        subtitleKey: "kaamKhataSubtitle",
        icon: AppIcons.wallet,
        color: AppColors.wallet,
        route: AppRoutes.kaamKhata,
      ),

      DashboardModule(
        id: "jobs",
        titleKey: "kaamDoDhundoTitle",
        subtitleKey: "kaamDoDhundoSubtitle",
        icon: AppIcons.jobs,
        color: AppColors.jobs,
        route: AppRoutes.jobs,
      ),

      DashboardModule(
        id: "artisan",
        titleKey: "haathKaKaamTitle",
        subtitleKey: "haathKaKaamSubtitle",
        icon: AppIcons.artisan,
        color: AppColors.artisan,
        route: AppRoutes.artisan,
      ),

      DashboardModule(
        id: "mandi",
        titleKey: "mandiBhavTitle",
        subtitleKey: "mandiBhavSubtitle",
        icon: AppIcons.mandi,
        color: AppColors.mandi,
        route: AppRoutes.mandi,
      ),
    ];
  }
}