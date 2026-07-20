import { createText } from "./createText";

const mag = {
  meta: {
    code: "mag",
    nativeName: "मगही",
    englishName: "Magahi",
    direction: "ltr",
    speechLocale: "hi-IN",
  },

  app: {
    name: createText("कमाई", "Kamaii"),
    tagline: createText(
      "काम खोजऽ अउ काम देऽ, एक साथ",
      "Kaam Khoja Au Kaam De, Ek Saath"
    ),
    loading: createText(
      "लोड हो रहल हई...",
      "Load Ho Rahal Hai..."
    ),
  },

  onboarding: {
    welcome: createText(
      "कमाई में रउरा स्वागत हई",
      "Kamaii Mein Raura Swagat Hai"
    ),
    chooseLanguage: createText(
      "अपन भाषा चुनऽ",
      "Apan Bhasha Chuna"
    ),
    description: createText(
      "जवन भाषा में रउरा सहज महसूस करऽ हई, ओही भाषा में कमाई इस्तेमाल करऽ।",
      "Jawan Bhasha Mein Raura Sahaj Mehsoos Kara Hai, Ohi Bhasha Mein Kamaii Istemaal Kara."
    ),
  },

  common: {
    continue: createText("आगे बढ़ऽ", "Aage Badha"),
    back: createText("पाछे", "Pachhe"),
    cancel: createText("रद्द करऽ", "Radd Kara"),
    save: createText("सहेजऽ", "Saheja"),
    edit: createText("संपादन करऽ", "Sampadan Kara"),
    delete: createText("हटा देऽ", "Hata De"),
    yes: createText("हाँ", "Haan"),
    no: createText("न", "Na"),
    search: createText("खोजऽ", "Khoja"),
    retry: createText("फिन कोशिश करऽ", "Phin Koshish Kara"),
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

export default mag;