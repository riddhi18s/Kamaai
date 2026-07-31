import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../models/dashboard_module.dart';
import 'dashboard_module_card.dart';

class DashboardModuleGrid extends StatelessWidget {
  final List<DashboardModule> modules;
  final void Function(DashboardModule module) onTap;

  /// Returns the localized title for a module.
  final String Function(String key) titleBuilder;

  /// Returns the localized subtitle for a module.
  final String Function(String key) subtitleBuilder;

  const DashboardModuleGrid({
    super.key,
    required this.modules,
    required this.onTap,
    required this.titleBuilder,
    required this.subtitleBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 2;

    if (screenWidth >= 900) {
      crossAxisCount = 4;
    } else if (screenWidth >= 600) {
      crossAxisCount = 3;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: modules.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: AppSizes.md,
        crossAxisSpacing: AppSizes.md,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final module = modules[index];

        return DashboardModuleCard(
          module: module,
          onTap: () => onTap(module),
          titleBuilder: titleBuilder,
          subtitleBuilder: subtitleBuilder,
        );
      },
    );
  }
}