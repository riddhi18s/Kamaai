import '../domain/language_model.dart';

/// Handles alias matching for both voice input (full sentences, e.g.
/// "Mujhe Hindi chahiye") and search input (short, possibly misspelled
/// queries, e.g. "gujrati", "marati", "hindee"), with basic typo
/// tolerance via edit-distance.
///
/// [matches] is used for voice recognition results (checks if a full
/// spoken sentence refers to a language).
/// [searchMatches] is used for the search bar (checks if a short query
/// plausibly refers to a language, tolerating partial input + typos).
class LanguageAliases {
  /// Returns true if [spokenText] (a full sentence or phrase spoken by
  /// the user) contains a reference to [language].
  static bool matches(LanguageModel language, String spokenText) {
    final text = _normalize(spokenText);
    final tokens = text.split(RegExp(r'\s+'));

    for (final alias in _aliasesFor(language)) {
      final normalizedAlias = _normalize(alias);
      if (normalizedAlias.isEmpty) continue;

      // Exact substring match — covers native script and multi-word
      // aliases (e.g. "தமிழ் வேண்டும்" contains "தமிழ்").
      if (text.contains(normalizedAlias)) return true;

      // Token-level fuzzy match — covers a single misspelled word
      // inside a longer sentence (e.g. "mujhe hindee chahiye").
      for (final token in tokens) {
        if (token.isEmpty) continue;
        if (_isCloseMatch(token, normalizedAlias)) return true;
      }
    }

    return false;
  }

  /// Returns true if [query] (typically a short search string) plausibly
  /// refers to [language], tolerating partial input and minor typos
  /// (e.g. "hind" → Hindi, "gujrati" → Gujarati, "marati" → Marathi).
  static bool searchMatches(LanguageModel language, String query) {
    final search = _normalize(query);
    if (search.isEmpty) return true;

    for (final alias in _aliasesFor(language)) {
      final normalizedAlias = _normalize(alias);
      if (normalizedAlias.isEmpty) continue;

      // Partial / substring match in either direction — covers prefix
      // search ("hind" → "hindi") and short native scripts.
      if (normalizedAlias.contains(search) || search.contains(normalizedAlias)) {
        return true;
      }

      // Typo tolerance for near-misses of the full alias.
      if (_isCloseMatch(search, normalizedAlias)) return true;
    }

    return false;
  }

  static List<String> _aliasesFor(LanguageModel language) {
    final aliases = <String>[
      language.englishName,
      language.nativeName,
    ];

    switch (language.code) {
      case "hi":
        aliases.addAll(["hindi", "hindhi", "hindee", "hindiii", "हिंदी", "हिन्दी"]);
        break;
      case "en":
        aliases.addAll(["english", "angrezi", "angreji", "अंग्रेज़ी", "अंग्रेजी"]);
        break;
      case "bn":
        aliases.addAll(["bangla", "bengali", "bangali", "বাংলা"]);
        break;
      case "mr":
        aliases.addAll(["marathi", "marati", "मराठी"]);
        break;
      case "ta":
        aliases.addAll(["tamil", "tamizh", "thamizh", "தமிழ்"]);
        break;
      case "te":
        aliases.addAll(["telugu", "telagu", "తెలుగు"]);
        break;
      case "gu":
        aliases.addAll(["gujarati", "gujrati", "ગુજરાતી"]);
        break;
      case "kn":
        aliases.addAll(["kannada", "kanada", "ಕನ್ನಡ"]);
        break;
      case "ml":
        aliases.addAll(["malayalam", "malyalam", "മലയാളം"]);
        break;
      case "pa":
        aliases.addAll(["punjabi", "panjabi", "ਪੰਜਾਬੀ"]);
        break;
      case "ur":
        aliases.addAll(["urdu", "اردو"]);
        break;
      case "or":
        aliases.addAll(["odia", "oriya", "ଓଡ଼ିଆ"]);
        break;
      case "as":
        aliases.addAll(["assamese", "অসমীয়া"]);
        break;
      case "mai":
        aliases.addAll(["maithili", "मैथिली"]);
        break;
      case "ne":
        aliases.addAll(["nepali", "नेपाली"]);
        break;
      case "sd":
        aliases.addAll(["sindhi", "سنڌي"]);
        break;
      case "sa":
        aliases.addAll(["sanskrit", "संस्कृतम्"]);
        break;
      case "kok":
        aliases.addAll(["konkani", "कोंकणी"]);
        break;
      case "doi":
        aliases.addAll(["dogri", "डोगरी"]);
        break;
      case "brx":
        aliases.addAll(["bodo", "बड़ो"]);
        break;
      case "sat":
        aliases.addAll(["santali", "ᱥᱟᱱᱛᱟᱲᱤ"]);
        break;
      case "mni":
        aliases.addAll(["manipuri", "meitei", "ꯃꯤꯇꯩꯂꯣꯟ"]);
        break;
    }

    return aliases;
  }

  static String _normalize(String input) => input.toLowerCase().trim();

  /// Cheap typo tolerance: allow small edit distances so common
  /// misspellings still resolve (e.g. "gujrati"/"marati"/"hindee").
  /// Deliberately conservative about length difference so short,
  /// genuinely different words (e.g. "tam" vs "malayalam") don't
  /// falsely match.
  static bool _isCloseMatch(String a, String b) {
    if (a.isEmpty || b.isEmpty) return false;
    if (a == b) return true;

    final lengthDiff = (a.length - b.length).abs();
    final maxLen = a.length > b.length ? a.length : b.length;
    if (lengthDiff > 2) return false;

    final allowedEdits = maxLen <= 4 ? 1 : 2;
    return _levenshtein(a, b) <= allowedEdits;
  }

  static int _levenshtein(String s, String t) {
    final m = s.length;
    final n = t.length;
    if (m == 0) return n;
    if (n == 0) return m;

    List<int> prev = List<int>.generate(n + 1, (j) => j);
    List<int> curr = List<int>.filled(n + 1, 0);

    for (int i = 1; i <= m; i++) {
      curr[0] = i;
      for (int j = 1; j <= n; j++) {
        final cost = s[i - 1] == t[j - 1] ? 0 : 1;
        final deletion = curr[j - 1] + 1;
        final insertion = prev[j] + 1;
        final substitution = prev[j - 1] + cost;
        curr[j] = [deletion, insertion, substitution].reduce(
          (a, b) => a < b ? a : b,
        );
      }
      final tmp = prev;
      prev = curr;
      curr = tmp;
    }

    return prev[n];
  }
}