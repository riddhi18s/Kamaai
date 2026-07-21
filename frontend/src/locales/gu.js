import { createText } from "./createText";

const gu = {
  meta: {
    code: "gu",
    nativeName: "ગુજરાતી",
    englishName: "Gujarati",
    direction: "ltr",
    speechLocale: "gu-IN",
  },

  app: {
    name: createText("કમાઈ", "Kamaii"),
    tagline: createText(
      "કામ શોધો અને કામ આપો, સાથે મળીને",
      "Kaam Shodho Ane Kaam Aapo, Saathe Maline"
    ),
    loading: createText("લોડ થઈ રહ્યું છે...", "Load Thai Rahyu Chhe..."),
  },

  onboarding: {
    welcome: createText(
      "કમાઈમાં આપનું સ્વાગત છે",
      "Kamaii Ma Aapnu Swagat Chhe"
    ),
    chooseLanguage: createText(
      "તમારી ભાષા પસંદ કરો",
      "Tamari Bhasha Pasand Karo"
    ),
    description: createText(
      "જે ભાષામાં તમે આરામદાયક અનુભવો છો, તે ભાષામાં કમાઈનો ઉપયોગ કરો.",
      "Je Bhashama Tame Aaramdayak Anubhavo Cho, Te Bhashama Kamaiino Upyog Karo."
    ),
  },

  common: {
    continue: createText("આગળ વધો", "Aagal Vadho"),
    back: createText("પાછળ", "Pachhal"),
    cancel: createText("રદ કરો", "Radd Karo"),
    save: createText("સાચવો", "Sachavo"),
    edit: createText("ફેરફાર કરો", "Ferfar Karo"),
    delete: createText("કાઢી નાખો", "Kadhi Nakho"),
    yes: createText("હા", "Ha"),
    no: createText("ના", "Na"),
    search: createText("શોધો", "Shodho"),
    retry: createText("ફરી પ્રયાસ કરો", "Farithi Prayas Karo"),
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

export default gu;