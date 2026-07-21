import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/language_data.dart';
import '../../data/stt_service.dart';
import '../../domain/language_model.dart';
import '../providers/language_provider.dart';
import '../widgets/continue_button.dart';
import '../widgets/language_card.dart';
import '../widgets/language_search_bar.dart';
import '../widgets/recommended_languages.dart';

class LanguageSelectionScreen extends ConsumerStatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  ConsumerState<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState
    extends ConsumerState<LanguageSelectionScreen> {
  String searchQuery = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(languageProvider.notifier).detectDeviceLanguage(context);
    });
  }

  Future<void> _startVoiceSelection() async {
    final initialized = await STTService.initialize();

    if (!initialized) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Microphone permission denied."),
        ),
      );
      return;
    }

    await STTService.startListening(
      onResult: (spokenText) {
        final query = spokenText.toLowerCase().trim();

        for (final language in supportedLanguages) {
          if (language.englishName.toLowerCase() == query ||
              language.nativeName.toLowerCase() == query) {
            ref.read(languageProvider.notifier).setLanguage(language);

            STTService.stopListening();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${language.englishName} selected."),
              ),
            );
            return;
          }
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No language found for "$spokenText"'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedLanguage = ref.watch(languageProvider);

    final recommended =
        RecommendedLanguages.getRecommendedLanguage(context);

    final remainingLanguages =
        RecommendedLanguages.getRemainingLanguages(context).where((language) {
      return language.nativeName
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          language.englishName
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4E8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/images/kamaai_logo.png",
                height: 90,
              ),
              const SizedBox(height: 24),
              const Text(
                "Choose Your Language",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Select the language you're most comfortable with.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: LanguageSearchBar(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: _startVoiceSelection,
                    icon: const Icon(
                      Icons.mic,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recommended",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              LanguageCard(
                language: recommended,
                isSelected:
                    selectedLanguage.code == recommended.code,
                isRecommended: true,
                onTap: () {
                  ref
                      .read(languageProvider.notifier)
                      .setLanguage(recommended);
                },
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All Languages",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: remainingLanguages.length,
                  itemBuilder: (context, index) {
                    final LanguageModel language =
                        remainingLanguages[index];

                    return LanguageCard(
                      language: language,
                      isSelected:
                          selectedLanguage.code == language.code,
                      onTap: () {
                        ref
                            .read(languageProvider.notifier)
                            .setLanguage(language);
                      },
                    );
                  },
                ),
              ),
              ContinueButton(
                onPressed: () async {
                  await ref
                      .read(languageProvider.notifier)
                      .saveLanguage();

                  if (!context.mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${selectedLanguage.englishName} selected successfully.",
                      ),
                    ),
                  );

                  // TODO:
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => const LoginScreen(),
                  //   ),
                  // );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}