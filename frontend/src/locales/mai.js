import { createText } from "./createText";

const mai = {
  meta: {
    code: "mai",
    nativeName: "मैथिली",
    englishName: "Maithili",
    direction: "ltr",
    speechLocale: "hi-IN",
  },

  app: {
    name: createText("कमाई", "Kamaii"),
    tagline: createText(
      "काज खोजू आ काज दिऔ, एक संग",
      "Kaaj Khoju Aa Kaaj Diau, Ek Sang"
    ),
    loading: createText(
      "लोड भऽ रहल अछि...",
      "Load Bha Rahal Achhi..."
    ),
  },

  onboarding: {
    welcome: createText(
      "कमाई मे अहाँक स्वागत अछि",
      "Kamaii Me Ahaank Swagat Achhi"
    ),
    chooseLanguage: createText(
      "अपन भाषा चुनू",
      "Apan Bhasha Chunu"
    ),
    description: createText(
      "जाहि भाषा मे अहाँ सहज छी, ओहि भाषा मे कमाई उपयोग करू।",
      "Jahi Bhasha Me Ahaan Sahaj Chhi, Ohi Bhasha Me Kamaii Upyog Karu."
    ),
  },

  common: {
    continue: createText("आगाँ बढ़ू", "Aaga Badhu"),
    back: createText("पाछाँ", "Pachha"),
    cancel: createText("रद्द करू", "Radd Karu"),
    save: createText("सहेजू", "Saheju"),
    edit: createText("संपादन करू", "Sampadan Karu"),
    delete: createText("हटाउ", "Hataau"),
    yes: createText("हँ", "Han"),
    no: createText("नहि", "Nahi"),
    search: createText("खोजू", "Khoju"),
    retry: createText("फेर प्रयास करू", "Pher Prayas Karu"),
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

export default mai;