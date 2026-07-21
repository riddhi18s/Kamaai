import 'package:flutter/material.dart';

import '../../../../core/localization/language_model.dart';
import 'language_card.dart';

class RecommendedLanguages extends StatelessWidget {
  final List<LanguageModel> languages;
  final LanguageModel? selectedLanguage;
  final ValueChanged<LanguageModel> onLanguageSelected;

  const RecommendedLanguages({
    super.key,
    required this.languages,
    required this.selectedLanguage,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (languages.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Padding(
          padding: EdgeInsets.only(
            left: 4,
            bottom: 12,
          ),
          child: Text(
            "Recommended Languages",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xff165C34),
            ),
          ),
        ),


        ...languages.map(
          (language) {

            return LanguageCard(
              language: language,

              isRecommended: true,

              isSelected:
                  selectedLanguage?.code ==
                  language.code,

              onTap: () {
                onLanguageSelected(language);
              },
            );

          },
        ),
      ],
    );
  }
}
