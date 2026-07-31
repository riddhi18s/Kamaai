import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants/app_routes.dart';
import '../extensions/locale_extensions.dart';

class AppDrawer extends StatelessWidget {
  final String? userName;
  final String? phoneNumber;
  final String? location;
  final String? profileImage;

  const AppDrawer({
    super.key,
    this.userName,
    this.phoneNumber,
    this.location,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.green.shade700,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 42,
                    backgroundColor: Colors.white,
                    backgroundImage: profileImage != null
                        ? NetworkImage(profileImage!)
                        : null,
                    child: profileImage == null
                        ? const Icon(
                            Icons.person,
                            size: 42,
                            color: Colors.green,
                          )
                        : null,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    userName ?? context.l10n.user,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    phoneNumber ?? "",
                    style: const TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    location ?? "",
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                children: [
                  _drawerItem(
                    context,
                    Icons.dashboard_rounded,
                    context.l10n.dashboard,
                    AppRoutes.dashboard,
                  ),
                  _drawerItem(
                    context,
                    Icons.account_balance_wallet_rounded,
                    context.l10n.kaamKhata,
                    AppRoutes.kaamKhata,
                  ),
                  _drawerItem(
                    context,
                    Icons.work_rounded,
                    context.l10n.kaamDoDhundo,
                    AppRoutes.jobs,
                  ),
                  _drawerItem(
                    context,
                    Icons.handyman_outlined,
                    context.l10n.haathKaKaam,
                    AppRoutes.artisan,
                  ),
                  _drawerItem(
                    context,
                    Icons.agriculture_rounded,
                    context.l10n.mandiBhav,
                    AppRoutes.mandi,
                  ),

                  const Divider(),

                  _drawerItem(
                    context,
                    Icons.person_outline,
                    context.l10n.profile,
                    AppRoutes.profile,
                  ),
                  _drawerItem(
                    context,
                    Icons.language,
                    context.l10n.changeLanguage,
                    AppRoutes.language,
                  ),
                  _drawerItem(
                    context,
                    Icons.settings_outlined,
                    context.l10n.settings,
                    "/settings",
                  ),
                  _drawerItem(
                    context,
                    Icons.help_outline,
                    context.l10n.helpSupport,
                    "/help",
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text(
                context.l10n.logout,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                if (!context.mounted) return;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.authSelection,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String title,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}