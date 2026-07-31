import 'package:flutter/material.dart';
import '../extensions/locale_extensions.dart';
import '../localization/hinglish_strings.dart';

class BilingualText extends StatelessWidget {
  const BilingualText({
    super.key,
    required this.textKey,
    this.nativeStyle,
    this.secondaryStyle,
    this.textAlign = TextAlign.center,
    this.spacing = 2,
  });

  final String textKey;

  final TextStyle? nativeStyle;
  final TextStyle? secondaryStyle;
  final TextAlign textAlign;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final native = _getLocalized(context, textKey);
    final hinglish = HinglishStrings.get(textKey);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: _alignment(textAlign),
      children: [
        Text(
          native,
          textAlign: textAlign,
          style: nativeStyle,
        ),

        SizedBox(height: spacing),

        Text(
          hinglish,
          textAlign: textAlign,
          style: secondaryStyle ??
              const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
        ),
      ],
    );
  }

  String _getLocalized(BuildContext context, String key) {
    final l10n = context.l10n;

    switch (key) {
      case "enterPhoneNumber":
        return l10n.enterPhoneNumber;

      case "phoneSubtitle":
        return l10n.phoneSubtitle;

      case "sendOtp":
        return l10n.sendOtp;

      case "verifyOtp":
        return l10n.verifyOtp;

      case "password":
        return l10n.password;

      case "passwordSubtitle":
        return l10n.passwordSubtitle;

      default:
        return key;
    }
  }

  CrossAxisAlignment _alignment(TextAlign align) {
    switch (align) {
      case TextAlign.left:
      case TextAlign.start:
        return CrossAxisAlignment.start;

      case TextAlign.right:
      case TextAlign.end:
        return CrossAxisAlignment.end;

      default:
        return CrossAxisAlignment.center;
    }
  }
}