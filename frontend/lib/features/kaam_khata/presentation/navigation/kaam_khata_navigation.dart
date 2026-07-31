import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../dashboard/providers/dashboard_provider.dart';
import '../screens/income_certificate_screen.dart';

/// Single source of truth for moving between the four Kaam Khata tabs
/// (Home, Darj, Itihaas, Income Certificate).
///
/// Every hop uses `pushReplacement` instead of `push`, so the Kaam Khata
/// screens never pile up on top of each other in the navigation stack —
/// whichever tab is active simply replaces the previous one, and popping
/// out of Kaam Khata always lands you back on whatever screen (e.g. the
/// Dashboard) opened it in the first place.
class KaamKhataNavigation {
  const KaamKhataNavigation._();

  static void goHome(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.kaamKhata);
  }

  static void goToDarj(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.nayaKaamDarj);
  }

  static void goToItihaas(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.kaamItihaas);
  }

  /// Income Certificate needs constructor arguments (worker name,
  /// occupation, address), so — per project convention — it's opened via
  /// [MaterialPageRoute] rather than a named route.
  static void goToCertificate(BuildContext context, WidgetRef ref) {
    final user = ref.read(dashboardUserProvider).valueOrNull;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => IncomeCertificateScreen(
          // TODO: confirm these against your actual user/profile model —
          // adjust the field names below if they differ.
          workerName: user?.name ?? '',
          address: user?.location,
        ),
      ),
    );
  }
}