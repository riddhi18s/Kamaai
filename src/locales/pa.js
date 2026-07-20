import { createText } from "./createText";

const pa = {
  meta: {
    code: "pa",
    nativeName: "ਪੰਜਾਬੀ",
    englishName: "Punjabi",
    direction: "ltr",
    speechLocale: "pa-IN",
  },

  app: {
    name: createText("ਕਮਾਈ", "Kamaii"),
    tagline: createText(
      "ਕੰਮ ਲੱਭੋ ਅਤੇ ਕੰਮ ਦਿਓ, ਇਕੱਠੇ",
      "Kamm Labho Ate Kamm Dio, Ikkathe"
    ),
    loading: createText("ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...", "Load Ho Riha Hai..."),
  },

  onboarding: {
    welcome: createText(
      "ਕਮਾਈ ਵਿੱਚ ਤੁਹਾਡਾ ਸਵਾਗਤ ਹੈ",
      "Kamaii Vich Tuhada Swagat Hai"
    ),
    chooseLanguage: createText(
      "ਆਪਣੀ ਭਾਸ਼ਾ ਚੁਣੋ",
      "Apni Bhasha Chuno"
    ),
    description: createText(
      "ਜਿਸ ਭਾਸ਼ਾ ਵਿੱਚ ਤੁਸੀਂ ਆਰਾਮਦਾਇਕ ਹੋ, ਉਸ ਵਿੱਚ ਕਮਾਈ ਵਰਤੋ।",
      "Jis Bhasha Vich Tusi Aaramdaik Ho, Us Vich Kamaii Varto."
    ),
  },

  common: {
    continue: createText("ਅੱਗੇ ਵਧੋ", "Agge Vadho"),
    back: createText("ਵਾਪਸ", "Vaapas"),
    cancel: createText("ਰੱਦ ਕਰੋ", "Radd Karo"),
    save: createText("ਸੰਭਾਲੋ", "Sambhalo"),
    edit: createText("ਸੋਧੋ", "Sodho"),
    delete: createText("ਮਿਟਾਓ", "Mitao"),
    yes: createText("ਹਾਂ", "Haan"),
    no: createText("ਨਹੀਂ", "Nahin"),
    search: createText("ਖੋਜੋ", "Khojo"),
    retry: createText("ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ", "Dubara Koshish Karo"),
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

export default pa;