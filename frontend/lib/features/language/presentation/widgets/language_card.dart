import 'package:flutter/material.dart';

import '../../data/tts_service.dart';
import '../../../../core/localization/language_model.dart';

class LanguageCard extends StatelessWidget {
  final LanguageModel language;
  final bool isSelected;
  final bool isRecommended;
  final VoidCallback onTap;

  const LanguageCard({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onTap,
    this.isRecommended = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 4 : 1,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected
              ? const Color(0xff165C34)
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: ListTile(
        onTap: onTap,

        leading: isRecommended
            ? const Icon(
                Icons.star_rounded,
                color: Colors.amber,
              )
            : null,

        title: Text(
          language.nativeName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),

        subtitle: Text(
          language.englishName,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.volume_up_rounded,
              ),
              onPressed: () async {
                await TTSService.initialize();

                await TTSService.speak(
                  text: language.greeting,
                  languageCode: language.localeCode,
                );
              },
            ),

            if (isSelected)
              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xff165C34),
              ),
          ],
        ),
      ),
    );
  }
}