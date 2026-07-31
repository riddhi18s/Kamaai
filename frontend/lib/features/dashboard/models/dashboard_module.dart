import 'package:flutter/material.dart';

class DashboardModule {
  final String id;
  final String titleKey;
  final String subtitleKey;
  final IconData icon;
  final Color color;
  final String route;
  final bool enabled;

  const DashboardModule({
    required this.id,
    required this.titleKey,
    required this.subtitleKey,
    required this.icon,
    required this.color,
    required this.route,
    this.enabled = true,
  });

  DashboardModule copyWith({
    String? id,
    String? titleKey,
    String? subtitleKey,
    IconData? icon,
    Color? color,
    String? route,
    bool? enabled,
  }) {
    return DashboardModule(
      id: id ?? this.id,
      titleKey: titleKey ?? this.titleKey,
      subtitleKey: subtitleKey ?? this.subtitleKey,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      route: route ?? this.route,
      enabled: enabled ?? this.enabled,
    );
  }
}