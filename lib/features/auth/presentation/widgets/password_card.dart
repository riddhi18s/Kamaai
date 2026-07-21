import 'package:flutter/material.dart';
import 'package:kamaai/generated/app_localizations.dart';

class PasswordCard extends StatefulWidget {
  final ValueChanged<bool> onValid;

  const PasswordCard({
    super.key,
    required this.onValid,
  });

  @override
  State<PasswordCard> createState() => _PasswordCardState();
}

class _PasswordCardState extends State<PasswordCard> {
  final TextEditingController passwordController =
      TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void validatePasswords() {
    final password = passwordController.text.trim();
    final confirm = confirmPasswordController.text.trim();

    widget.onValid(
      password.length >= 6 &&
          password == confirm,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Card(
      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Text(
              l10n.createPasswordTitle,

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: obscurePassword,

              onChanged: (_) => validatePasswords(),

              decoration: InputDecoration(
                hintText: l10n.enterPasswordHint,

                border: const OutlineInputBorder(),

                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscurePassword =
                          !obscurePassword;
                    });
                  },
                  icon: Icon(
                    obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
                  confirmPasswordController,

              obscureText: obscureConfirmPassword,

              onChanged: (_) => validatePasswords(),

              decoration: InputDecoration(
                hintText: l10n.confirmPasswordHint,

                border: const OutlineInputBorder(),

                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureConfirmPassword =
                          !obscureConfirmPassword;
                    });
                  },
                  icon: Icon(
                    obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Builder(
              builder: (context) {
                final password =
                    passwordController.text;

                final confirm =
                    confirmPasswordController.text;

                if (confirm.isEmpty) {
                  return const SizedBox();
                }

                final matched =
                    password == confirm;

                return Row(
                  children: [
                    Icon(
                      matched
                          ? Icons.check_circle
                          : Icons.cancel,

                      color: matched
                          ? Colors.green
                          : Colors.red,

                      size: 18,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      matched
                          ? l10n.passwordsMatch
                          : l10n.passwordsDoNotMatch,

                      style: TextStyle(
                        color: matched
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}