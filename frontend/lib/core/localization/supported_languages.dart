import 'package:flutter/material.dart';
import 'language_model.dart';

class SupportedLanguages {
  SupportedLanguages._();

  static const List<LanguageModel> all = [
    LanguageModel(
      code: 'en',
      localeCode: 'en_IN',
      nativeName: 'English',
      englishName: 'English',
      hinglishName: 'English',
      speechLocale: 'en_IN',

      greeting: 'Welcome to Kamaai!',
      hinglishGreeting: 'Kamaai mein aapka swagat hai!',

      isDefault: true,
      isRecommended: true,
    ),

    LanguageModel(
      code: 'hi',
      localeCode: 'hi_IN',
      nativeName: 'हिन्दी',
      englishName: 'Hindi',
      hinglishName: 'Hindi',
      speechLocale: 'hi_IN',

      greeting: 'कामाई में आपका स्वागत है!',
      hinglishGreeting: 'Kamaai mein aapka swagat hai!',

      isRecommended: true,
    ),

    LanguageModel(
      code: 'as',
      localeCode: 'as_IN',
      nativeName: 'অসমীয়া',
      englishName: 'Assamese',
      hinglishName: 'Axomiya',
      speechLocale: 'as_IN',

      greeting: 'কামাইলৈ আপোনাক স্বাগতম!',
      hinglishGreeting: 'Kamaai lói apunak swagatam!',
    ),

    LanguageModel(
      code: 'bn',
      localeCode: 'bn_IN',
      nativeName: 'বাংলা',
      englishName: 'Bengali',
      hinglishName: 'Bangla',
      speechLocale: 'bn_IN',

      greeting: 'কামাই-এ আপনাকে স্বাগতম!',
      hinglishGreeting: 'Kamaai-te apnake swagatam!',

      isRecommended: true,
    ),

    LanguageModel(
      code: 'brx',
      localeCode: 'brx_IN',
      nativeName: 'बरो',
      englishName: 'Bodo',
      hinglishName: 'Bodo',
      speechLocale: 'hi_IN',

      greeting: 'कामाइयाव नोंथाङा स्वागत!',
      hinglishGreeting: 'Kamaai-ao nongthanga swagat!',
    ),

    LanguageModel(
      code: 'doi',
      localeCode: 'doi_IN',
      nativeName: 'डोगरी',
      englishName: 'Dogri',
      hinglishName: 'Dogri',
      speechLocale: 'hi_IN',

      greeting: 'कामाई च तुंदा स्वागत ऐ!',
      hinglishGreeting: 'Kamaai ch tuhada swagat ae!',
    ),

    LanguageModel(
      code: 'gu',
      localeCode: 'gu_IN',
      nativeName: 'ગુજરાતી',
      englishName: 'Gujarati',
      hinglishName: 'Gujarati',
      speechLocale: 'gu_IN',

      greeting: 'કામાઈમાં તમારું સ્વાગત છે!',
      hinglishGreeting: 'Kamaai maa tamaru swagat chhe!',
    ),

    LanguageModel(
      code: 'kn',
      localeCode: 'kn_IN',
      nativeName: 'ಕನ್ನಡ',
      englishName: 'Kannada',
      hinglishName: 'Kannada',
      speechLocale: 'kn_IN',

      greeting: 'ಕಮಾಯಿಗೆ ನಿಮಗೆ ಸ್ವಾಗತ!',
      hinglishGreeting: 'Kamaai ge nimage swagata!',
    ),

    LanguageModel(
      code: 'ks',
      localeCode: 'ks_IN',
      nativeName: 'कॉशुर',
      englishName: 'Kashmiri',
      hinglishName: 'Koshur',
      speechLocale: 'hi_IN',

      greeting: 'کمائی ءِ منز تُہند استقبال!',
      hinglishGreeting: 'Kamaai manz tohand istiqbaal!',
    ),

    LanguageModel(
      code: 'kok',
      localeCode: 'kok_IN',
      nativeName: 'कोंकणी',
      englishName: 'Konkani',
      hinglishName: 'Konkani',
      speechLocale: 'kok_IN',

      greeting: 'कामायांत तुमचें स्वागत!',
      hinglishGreeting: 'Kamaai-ant tumche swagat!',
    ),

    LanguageModel(
      code: 'mai',
      localeCode: 'mai_IN',
      nativeName: 'मैथिली',
      englishName: 'Maithili',
      hinglishName: 'Maithili',
      speechLocale: 'hi_IN',

      greeting: 'कामाई मे अहाँक स्वागत अछि!',
      hinglishGreeting: 'Kamaai me ahaak swagat achi!',
    ),

    LanguageModel(
      code: 'ml',
      localeCode: 'ml_IN',
      nativeName: 'മലയാളം',
      englishName: 'Malayalam',
      hinglishName: 'Malayalam',
      speechLocale: 'ml_IN',

      greeting: 'കമായിയിലേക്ക് സ്വാഗതം!',
      hinglishGreeting: 'Kamaai-lekku swagatham!',
    ),

    LanguageModel(
      code: 'mni',
      localeCode: 'mni_IN',
      nativeName: 'ꯃꯤꯇꯩ ꯂꯣꯟ',
      englishName: 'Manipuri',
      hinglishName: 'Meitei',
      speechLocale: 'hi_IN',

      greeting: 'ꯀꯃꯥꯏ ꯗ ꯅꯪꯕꯨ ꯇꯔꯥꯝꯅ ꯑꯣꯛꯆꯔꯤ!',
      hinglishGreeting: 'Kamaai da nangbu taramna okchari!',
    ),

    LanguageModel(
      code: 'mr',
      localeCode: 'mr_IN',
      nativeName: 'मराठी',
      englishName: 'Marathi',
      hinglishName: 'Marathi',
      speechLocale: 'mr_IN',

      greeting: 'कामाईमध्ये आपले स्वागत आहे!',
      hinglishGreeting: 'Kamaai madhye aapale swagat aahe!',

      isRecommended: true,
    ),

    LanguageModel(
      code: 'ne',
      localeCode: 'ne_IN',
      nativeName: 'नेपाली',
      englishName: 'Nepali',
      hinglishName: 'Nepali',
      speechLocale: 'ne_NP',

      greeting: 'कामाईमा तपाईंलाई स्वागत छ!',
      hinglishGreeting: 'Kamaai maa tapaailai swagat chha!',
    ),

    LanguageModel(
      code: 'or',
      localeCode: 'or_IN',
      nativeName: 'ଓଡ଼ିଆ',
      englishName: 'Odia',
      hinglishName: 'Odia',
      speechLocale: 'or_IN',

      greeting: 'କାମାଇକୁ ଆପଣଙ୍କୁ ସ୍ୱାଗତ!',
      hinglishGreeting: 'Kamaai ku apananku swagat!',
    ),

    LanguageModel(
      code: 'pa',
      localeCode: 'pa_IN',
      nativeName: 'ਪੰਜਾਬੀ',
      englishName: 'Punjabi',
      hinglishName: 'Punjabi',
      speechLocale: 'pa_IN',

      greeting: 'ਕਮਾਈ ਵਿੱਚ ਤੁਹਾਡਾ ਸੁਆਗਤ ਹੈ!',
      hinglishGreeting: 'Kamaai vich tuhada suagat hai!',
    ),

    LanguageModel(
      code: 'sa',
      localeCode: 'sa_IN',
      nativeName: 'संस्कृत',
      englishName: 'Sanskrit',
      hinglishName: 'Sanskrit',
      speechLocale: 'hi_IN',

      greeting: 'कामायां भवतः स्वागतम्!',
      hinglishGreeting: 'Kamaayaam bhavatah swagatam!',
    ),

    LanguageModel(
      code: 'sat',
      localeCode: 'sat_IN',
      nativeName: 'ᱥᱟᱱᱛᱟᱲᱤ',
      englishName: 'Santali',
      hinglishName: 'Santali',
      speechLocale: 'hi_IN',

      greeting: 'ᱠᱟᱢᱟᱭᱤᱨᱮ ᱟᱢᱟᱜ ᱡᱚᱦᱟᱨ!',
      hinglishGreeting: 'Kamaai re aamag johar!',
    ),

    LanguageModel(
      code: 'sd',
      localeCode: 'sd_IN',
      nativeName: 'سنڌي',
      englishName: 'Sindhi',
      hinglishName: 'Sindhi',
      speechLocale: 'sd_IN',

      greeting: 'ڪمائي ۾ اوهان جي آجيان!',
      hinglishGreeting: 'Kamaai mein awhaan ji aajiaan!',

      textDirection: TextDirection.rtl,
    ),

    LanguageModel(
      code: 'ta',
      localeCode: 'ta_IN',
      nativeName: 'தமிழ்',
      englishName: 'Tamil',
      hinglishName: 'Tamil',
      speechLocale: 'ta_IN',

      greeting: 'கமாயில் உங்களை வரவேற்கிறோம்!',
      hinglishGreeting: 'Kamaai-il ungalai varaverkirom!',

      isRecommended: true,
    ),

    LanguageModel(
      code: 'te',
      localeCode: 'te_IN',
      nativeName: 'తెలుగు',
      englishName: 'Telugu',
      hinglishName: 'Telugu',
      speechLocale: 'te_IN',

      greeting: 'కమాయికి మీకు స్వాగతం!',
      hinglishGreeting: 'Kamaai ki meeku swagatam!',

      isRecommended: true,
    ),

    LanguageModel(
      code: 'ur',
      localeCode: 'ur_IN',
      nativeName: 'اردو',
      englishName: 'Urdu',
      hinglishName: 'Urdu',
      speechLocale: 'ur_IN',

      greeting: 'کمائی میں خوش آمدید!',
      hinglishGreeting: 'Kamaai mein khush aamdeed!',

      textDirection: TextDirection.rtl,
    ),
  ];

  static List<LanguageModel> get recommended =>
      all.where((language) => language.isRecommended).toList();

  static LanguageModel get defaultLanguage =>
      all.firstWhere((language) => language.isDefault);

  static LanguageModel? fromCode(String code) {
    try {
      return all.firstWhere((language) => language.code == code);
    } catch (_) {
      return null;
    }
  }

  static bool isSupported(String code) {
    return all.any((language) => language.code == code);
  }
static const Map<String, List<String>> stateLanguageMap = {
  "Bihar": ["hi", "mai", "en"],
  "Tamil Nadu": ["ta", "en"],
  "Gujarat": ["gu", "hi", "en"],
  "Maharashtra": ["mr", "hi", "en"],
  "West Bengal": ["bn", "hi", "en"],
  "Karnataka": ["kn", "en"],
  "Kerala": ["ml", "en"],
  "Andhra Pradesh": ["te", "en"],
  "Telangana": ["te", "hi", "en"],
  "Punjab": ["pa", "hi", "en"],
  "Odisha": ["or", "hi", "en"],
  "Assam": ["as", "hi", "en"],
  "Rajasthan": ["hi", "en"],
  "Uttar Pradesh": ["hi", "en"],
  "Madhya Pradesh": ["hi", "en"],
  "Jharkhand": ["hi", "sat", "en"],
  "Goa": ["kok", "mr", "en"],
  "Haryana": ["hi", "pa", "en"],
  "Jammu and Kashmir": ["ur", "hi", "en"],
  "Manipur": ["mni", "en"],
};

}