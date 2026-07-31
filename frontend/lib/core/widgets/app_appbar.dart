import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const AppAppBar({
    super.key,
    required this.title,
    this.onNotificationTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,

      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.workspace_premium_rounded,
            color: Colors.green,
          ),

          const SizedBox(width: 8),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),

      actions: [

        IconButton(
          onPressed: onNotificationTap,
          icon: const Badge(
            child: Icon(Icons.notifications_none_rounded),
          ),
        ),

        const SizedBox(width: 4),

        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: onProfileTap,
            child: const CircleAvatar(
              radius: 18,
              child: Icon(Icons.person),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}