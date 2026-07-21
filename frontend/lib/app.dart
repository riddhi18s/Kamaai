import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/language/presentation/providers/language_provider.dart';
import 'features/language/presentation/screens/language_selection_screen.dart';
import 'generated/app_localizations.dart';

class KamaaiApp extends ConsumerWidget {
  const KamaaiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kamaai',

      locale: Locale(language.code),

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),

      home: const LanguageSelectionScreen(),
    );
  }
}