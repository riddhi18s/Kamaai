import 'package:flutter/material.dart';

import '../../../language/presentation/widgets/language_dropdown_button.dart';

/// Top bar shared by every Kaam Khata screen: hamburger menu (auto-shown
/// by [Scaffold] whenever `drawer:` is set — no extra wiring needed here),
/// the Kamaai logo, and the language dropdown. Keeping this in one widget
/// is what makes all four screens look and feel like a single module.
class KaamKhataTopBar extends StatelessWidget implements PreferredSizeWidget {
  const KaamKhataTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 12,
      title: Image.asset(
        'assets/images/kamaai_logo.png',
        height: 32,
        fit: BoxFit.contain,
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: LanguageDropdownButton(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
