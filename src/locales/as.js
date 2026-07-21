import { createText } from "./createText";

const as = {
  meta: {
    code: "as",
    nativeName: "অসমীয়া",
    englishName: "Assamese",
    direction: "ltr",
    speechLocale: "as-IN",
  },

  app: {
    name: createText("কমাই", "Kamaii"),
    tagline: createText(
      "কাম বিচাৰক আৰু কাম দিয়ক, একেলগে",
      "Kaam Bisarak Aru Kaam Diyok, Ekeloge"
    ),
    loading: createText(
      "লোড হৈ আছে...",
      "Load Hoi Ase..."
    ),
  },

  onboarding: {
    welcome: createText(
      "কমাইলৈ স্বাগতম",
      "Kamaiiloi Swagatam"
    ),
    chooseLanguage: createText(
      "আপোনাৰ ভাষা বাছক",
      "Aponar Bhasha Basok"
    ),
    description: createText(
      "যি ভাষাত আপুনি আৰাম অনুভৱ কৰে, সেই ভাষাতে কমাই ব্যৱহাৰ কৰক।",
      "Ji Bhashat Apuni Aram Anubhav Kore, Sei Bhashate Kamai Byabohar Korok."
    ),
  },

  common: {
    continue: createText("আগবাঢ়ক", "Agbarhok"),
    back: createText("ঘূৰি যাওক", "Ghuri Jaok"),
    cancel: createText("বাতিল কৰক", "Batil Korok"),
    save: createText("সংৰক্ষণ কৰক", "Sangrakshan Korok"),
    edit: createText("সম্পাদনা কৰক", "Sampadana Korok"),
    delete: createText("মচি পেলাওক", "Mosi Pelauk"),
    yes: createText("হয়", "Hoy"),
    no: createText("নহয়", "Nohoy"),
    search: createText("বিচাৰক", "Bisarak"),
    retry: createText("আকৌ চেষ্টা কৰক", "Akou Chesta Korok"),
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

export default as;