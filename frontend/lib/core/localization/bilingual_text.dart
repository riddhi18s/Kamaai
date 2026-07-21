import 'package:flutter/material.dart';

class BilingualText extends StatelessWidget {
  final String nativeText;
  final String secondaryText;

  final TextStyle? nativeStyle;
  final TextStyle? secondaryStyle;

  final TextAlign textAlign;

  final double spacing;

  final int? nativeMaxLines;
  final int? secondaryMaxLines;

  const BilingualText({
    super.key,
    required this.nativeText,
    required this.secondaryText,
    this.nativeStyle,
    this.secondaryStyle,
    this.textAlign = TextAlign.center,
    this.spacing = 2,
    this.nativeMaxLines,
    this.secondaryMaxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: _alignment(textAlign),
      children: [
        Text(
          nativeText,
          textAlign: textAlign,
          maxLines: nativeMaxLines,
          overflow: TextOverflow.ellipsis,
          style: nativeStyle ??
              const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
        ),

        SizedBox(height: spacing),

        Text(
          secondaryText,
          textAlign: textAlign,
          maxLines: secondaryMaxLines,
          overflow: TextOverflow.ellipsis,
          style: secondaryStyle ??
              const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
        ),
      ],
    );
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