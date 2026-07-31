class HinglishStrings {
  static const Map<String, String> values = {
    // Auth
    "enterPhoneNumber": "Apna Mobile Number Darj Karein",
    "phoneSubtitle": "Hum OTP bhejkar aapka number verify karenge.",
    "sendOtp": "OTP Bheje",
    "verifyOtp": "OTP Verify Karein",
    "otpSubtitle": "SMS se mila hua OTP darj karein.",
    "password": "Password Banaye",
    "passwordSubtitle": "Apna account surakshit rakhein.",
    "continue": "Aage Badhein",

    // Dashboard
    "findWork": "Kaam Dhundho",
    "hireWorker": "Kaam Do",
    "profile": "Profile",
    "settings": "Settings",

    // Common
    "search": "Khoje",
    "save": "Save Karein",
    "cancel": "Radd Karein",
  };

  static String get(String key) {
    return values[key] ?? key;
  }
}