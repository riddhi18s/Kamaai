import { createText } from "./createText";

const mr = {
  meta: {
    code: "mr",
    nativeName: "मराठी",
    englishName: "Marathi",
    direction: "ltr",
    speechLocale: "mr-IN",
  },

  app: {
    name: createText("कमाई", "Kamaii"),
    tagline: createText(
      "काम शोधा आणि काम द्या, एकत्र",
      "Kaam Shodha Aani Kaam Dya, Ekatra"
    ),
    loading: createText("लोड होत आहे...", "Load Hot Aahe..."),
  },

  onboarding: {
    welcome: createText(
      "कमाईमध्ये आपले स्वागत आहे",
      "Kamaii Madhye Aaple Swagat Aahe"
    ),
    chooseLanguage: createText(
      "आपली भाषा निवडा",
      "Aapli Bhasha Nivda"
    ),
    description: createText(
      "ज्या भाषेत तुम्हाला सोयीचे वाटते, त्या भाषेत कमाई वापरा.",
      "Jya Bhashet Tumhala Soyiche Watate, Tya Bhashet Kamaii Vapra."
    ),
  },

  common: {
    continue: createText("पुढे जा", "Pudhe Ja"),
    back: createText("मागे", "Mage"),
    cancel: createText("रद्द करा", "Radd Kara"),
    save: createText("जतन करा", "Jatan Kara"),
    edit: createText("संपादित करा", "Sampadit Kara"),
    delete: createText("हटवा", "Hatva"),
    yes: createText("होय", "Hoy"),
    no: createText("नाही", "Nahi"),
    search: createText("शोधा", "Shodha"),
    retry: createText("पुन्हा प्रयत्न करा", "Punha Prayatna Kara"),
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

export default mr;