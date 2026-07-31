import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../navigation/kaam_khata_navigation.dart';

enum KaamKhataTab { home, darj, itihaas, certificate }

/// Bottom navigation shared by all four Kaam Khata screens
/// (Home / Darj / Itihaas / Income Certificate).
///
/// Unlike a typical bottom nav, this widget owns its own navigation —
/// pass it the tab that's currently showing and it handles moving to any
/// other tab via [KaamKhataNavigation], which always uses
/// `pushReplacement` so tabs never stack duplicate pages on top of each
/// other.
class KaamKhataBottomNav extends ConsumerWidget {
  const KaamKhataBottomNav({super.key, required this.currentTab});

  final KaamKhataTab currentTab;

  void _handleTap(BuildContext context, WidgetRef ref, KaamKhataTab tab) {
    if (tab == currentTab) return;

    switch (tab) {
      case KaamKhataTab.home:
        KaamKhataNavigation.goHome(context);
        break;
      case KaamKhataTab.darj:
        KaamKhataNavigation.goToDarj(context);
        break;
      case KaamKhataTab.itihaas:
        KaamKhataNavigation.goToItihaas(context);
        break;
      case KaamKhataTab.certificate:
        KaamKhataNavigation.goToCertificate(context, ref);
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _NavItem(
                icon: Icons.home_rounded,
                label: context.tr('kaamKhataNavGhar'),
                selected: currentTab == KaamKhataTab.home,
                onTap: () => _handleTap(context, ref, KaamKhataTab.home),
              ),
              _NavItem(
                icon: Icons.add_circle_rounded,
                label: context.tr('kaamKhataNavDarj'),
                selected: currentTab == KaamKhataTab.darj,
                onTap: () => _handleTap(context, ref, KaamKhataTab.darj),
              ),
              _NavItem(
                icon: Icons.receipt_long_rounded,
                label: context.tr('kaamKhataNavItihaas'),
                selected: currentTab == KaamKhataTab.itihaas,
                onTap: () => _handleTap(context, ref, KaamKhataTab.itihaas),
              ),
              _NavItem(
                icon: Icons.description_rounded,
                label: context.tr('kaamKhataNavCertificate'),
                selected: currentTab == KaamKhataTab.certificate,
                onTap: () => _handleTap(context, ref, KaamKhataTab.certificate),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primary : AppColors.textSecondary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
