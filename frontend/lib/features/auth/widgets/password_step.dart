import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/locale_extensions.dart';
import '../../../core/localization/bilingual_text.dart';
import '../providers/auth_provider.dart';

class _KColors {
  static const primaryGreen = Color(0xff2E7D32);
  static const lightGreen = Color(0xffE8F5E9);
  static const background = Color(0xffF6F8F5);
  static const accent = Color(0xffFFB300);
}

class PasswordStep extends ConsumerStatefulWidget {
  const PasswordStep({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  @override
  ConsumerState<PasswordStep> createState() => _PasswordStepState();
}

class _PasswordStepState extends ConsumerState<PasswordStep> {
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscureConfirm = true;

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool get _passwordsMatch {
    final auth = ref.read(authProvider);
    return auth.password == _confirmPasswordController.text;
  }

  bool get _isValid {
    final auth = ref.read(authProvider);

    return auth.isPasswordValid &&
        _confirmPasswordController.text.isNotEmpty &&
        _passwordsMatch;
  }

  InputDecoration _fieldDecoration({
    required String hint,
    required IconData icon,
    required Widget suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey.shade500,
        fontWeight: FontWeight.w500,
      ),
      prefixIcon: Icon(
        icon,
        color: Colors.grey.shade600,
      ),
      suffixIcon: suffix,
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: _KColors.primaryGreen,
          width: 2,
        ),
      ),
    );
  }

  Widget _rule(
    bool valid,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            valid
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            color: valid
                ? Colors.green
                : Colors.grey,
            size: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: valid
                    ? Colors.green
                    : Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
Widget build(BuildContext context) {
  final auth = ref.watch(authProvider);
  final notifier = ref.read(authProvider.notifier);

  final hasUppercase = RegExp(r'[A-Z]').hasMatch(auth.password);
  final hasNumber = RegExp(r'[0-9]').hasMatch(auth.password);
  final hasLength = auth.password.length >= 8;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),

      Text(
        context.l10n.password.toUpperCase(),
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: _KColors.primaryGreen,
          letterSpacing: 1,
        ),
      ),

      const SizedBox(height: 10),

      Text(
        context.l10n.passwordSubtitle,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey.shade600,
          height: 1.5,
        ),
      ),

      const SizedBox(height: 30),

      TextField(
        controller: notifier.passwordController,
        obscureText: auth.obscurePassword,
        onChanged: (value) {
          notifier.updatePassword(value);
          setState(() {});
        },
        decoration: _fieldDecoration(
          hint: context.l10n.password,
          icon: Icons.lock_outline_rounded,
          suffix: IconButton(
            onPressed: notifier.togglePasswordVisibility,
            icon: Icon(
              auth.obscurePassword
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
            ),
          ),
        ),
      ),

      const SizedBox(height: 18),

      TextField(
        controller: _confirmPasswordController,
        obscureText: _obscureConfirm,
        onChanged: (_) {
          setState(() {});
        },
        decoration: _fieldDecoration(
          hint: context.l10n.confirmPassword,
          icon: Icons.lock_reset_rounded,
          suffix: IconButton(
            onPressed: () {
              setState(() {
                _obscureConfirm = !_obscureConfirm;
              });
            },
            icon: Icon(
              _obscureConfirm
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
            ),
          ),
        ),
      ),

      const SizedBox(height: 24),

      _rule(
        hasLength,
        "Minimum 8 characters",
      ),

      _rule(
        hasUppercase,
        "One uppercase letter",
      ),

      _rule(
        hasNumber,
        "One number",
      ),

      _rule(
        _passwordsMatch &&
            _confirmPasswordController.text.isNotEmpty,
        "Passwords match",
      ),

      const SizedBox(height: 30),
      SizedBox(
  width: double.infinity,
  height: 58,
  child: AnimatedOpacity(
    duration: const Duration(milliseconds: 200),
    opacity: _isValid ? 1 : 0.55,
    child: ElevatedButton(
      onPressed: _isValid
          ? () {
              FocusScope.of(context).unfocus();
              widget.onContinue();
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: _KColors.primaryGreen,
        disabledBackgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.white,
        elevation: _isValid ? 4 : 0,
        shadowColor: _KColors.primaryGreen.withOpacity(0.35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: auth.isLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.5,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BilingualText(
                  textKey: "continue",
                  nativeStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  secondaryStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                ),
              ],
            ),
    ),
  ),
),

const SizedBox(height: 20),

Center(
  child: TextButton.icon(
    onPressed: notifier.previousStep,
    icon: const Icon(
      Icons.arrow_back_ios_new_rounded,
      size: 18,
      color: _KColors.primaryGreen,
    ),
    label: Text(
      context.l10n.changePhoneNumber,
      style: const TextStyle(
        color: _KColors.primaryGreen,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
),

const SizedBox(height: 10),
      ],
    );
  }
}