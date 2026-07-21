import { createText } from "./createText";

const bn = {
  meta: {
    code: "bn",
    nativeName: "বাংলা",
    englishName: "Bengali",
    direction: "ltr",
    speechLocale: "bn-IN",
  },

  app: {
    name: createText("কামাই", "Kamaii"),
    tagline: createText(
      "কাজ খুঁজুন এবং কাজ দিন, একসাথে",
      "Kaaj Khujun Ebong Kaaj Din, Eksathe"
    ),
    loading: createText("লোড হচ্ছে...", "Load Hocche..."),
  },

  onboarding: {
    welcome: createText(
      "কামাই-এ আপনাকে স্বাগতম",
      "Kamaii-e Apnake Swagatam"
    ),
    chooseLanguage: createText(
      "আপনার ভাষা নির্বাচন করুন",
      "Apnar Bhasha Nirbachan Korun"
    ),
    description: createText(
      "যে ভাষায় আপনি স্বাচ্ছন্দ্যবোধ করেন, সেই ভাষায় কামাই ব্যবহার করুন।",
      "Je Bhashay Apni Swachchhandyabodh Koren, Sei Bhashay Kamaii Byabohar Korun."
    ),
  },

  common: {
    continue: createText("এগিয়ে যান", "Egiye Jan"),
    back: createText("ফিরে যান", "Fire Jan"),
    cancel: createText("বাতিল করুন", "Batil Korun"),
    save: createText("সংরক্ষণ করুন", "Sangrakshan Korun"),
    edit: createText("সম্পাদনা করুন", "Sampadana Korun"),
    delete: createText("মুছে ফেলুন", "Muche Felun"),
    yes: createText("হ্যাঁ", "Hyan"),
    no: createText("না", "Na"),
    search: createText("অনুসন্ধান", "Anusandhan"),
    retry: createText("আবার চেষ্টা করুন", "Abar Chesta Korun"),
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

export default bn;