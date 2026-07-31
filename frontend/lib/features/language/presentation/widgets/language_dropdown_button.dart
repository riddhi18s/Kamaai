import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/supported_languages.dart';
import '../../presentation/providers/language_provider.dart';

class LanguageDropdownButton extends ConsumerWidget {
  const LanguageDropdownButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);

    return PopupMenuButton(
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onSelected: (selectedLanguage) async {
        final notifier = ref.read(languageProvider.notifier);

        notifier.setLanguage(selectedLanguage);

        await notifier.saveLanguage();
      },
      itemBuilder: (context) {
        return SupportedLanguages.all.map((lang) {
          return PopupMenuItem(
            value: lang,
            child: Row(
              children: [
                if (lang.code == language.code)
                  const Icon(
                    Icons.check,
                    color: Color(0xff2E7D32),
                    size: 18,
                  ),
                if (lang.code == language.code)
                  const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    lang.nativeName,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.language,
              color: Color(0xff2E7D32),
            ),
            const SizedBox(width: 8),
            Text(
              language.nativeName,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}