import { createText } from "./createText";

const hi = {
  meta: {
    code: "hi",
    nativeName: "हिन्दी",
    englishName: "Hindi",
    direction: "ltr",
    speechLocale: "hi-IN",
  },

  app: {
    name: createText(
      "कामाई",
      "Kamaii"
    ),

    tagline: createText(
      "काम ढूंढो और काम दो, एक साथ",
      "Kaam Dhundho Aur Kaam Do, Ek Saath"
    ),

    loading: createText(
      "लोड हो रहा है...",
      "Load Ho Raha Hai..."
    ),
  },

  onboarding: {
    welcome: createText(
      "कामाई में आपका स्वागत है",
      "Kamaii Mein Aapka Swagat Hai"
    ),

    chooseLanguage: createText(
      "अपनी भाषा चुनें",
      "Apni Bhasha Chunein"
    ),

    description: createText(
      "आप जिस भाषा में सहज हैं, उसी भाषा में कामाई का उपयोग करें।",
      "Aap Jis Bhasha Mein Sahaj Hain, Usi Bhasha Mein Kamaii Ka Upyog Karein."
    ),
  },

  common: {
    continue: createText(
      "आगे बढ़ें",
      "Aage Badhein"
    ),

    back: createText(
      "वापस",
      "Vaapas"
    ),

    cancel: createText(
      "रद्द करें",
      "Radd Karein"
    ),

    save: createText(
      "सहेजें",
      "Sahejein"
    ),

    edit: createText(
      "संपादित करें",
      "Sampadit Karein"
    ),

    delete: createText(
      "हटाएं",
      "Hataayein"
    ),

    yes: createText(
      "हाँ",
      "Haan"
    ),

    no: createText(
      "नहीं",
      "Nahin"
    ),

    search: createText(
      "खोजें",
      "Khojein"
    ),

    retry: createText(
      "फिर से प्रयास करें",
      "Phir Se Prayas Karein"
    ),
  },

  dashboard: {},

  earnings: {},

  jobs: {},

  marketplace: {},

  mandi: {},

  voice: {},

  notifications: {},

  profile: {},

  settings: {},

  auth: {},

  errors: {},
};

export default hi;