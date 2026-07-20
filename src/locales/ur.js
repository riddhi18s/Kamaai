import { createText } from "./createText";

const ur = {
  meta: {
    code: "ur",
    nativeName: "اردو",
    englishName: "Urdu",
    direction: "rtl",
    speechLocale: "ur-IN",
  },

  app: {
    name: createText("کمائی", "Kamaii"),
    tagline: createText(
      "کام تلاش کریں اور کام دیں، ایک ساتھ",
      "Kaam Talaash Karein Aur Kaam Dein, Ek Saath"
    ),
    loading: createText(
      "لوڈ ہو رہا ہے...",
      "Load Ho Raha Hai..."
    ),
  },

  onboarding: {
    welcome: createText(
      "کمائی میں خوش آمدید",
      "Kamaii Mein Khush Aamdeed"
    ),
    chooseLanguage: createText(
      "اپنی زبان منتخب کریں",
      "Apni Zabaan Muntakhab Karein"
    ),
    description: createText(
      "جس زبان میں آپ آسانی محسوس کرتے ہیں، اسی زبان میں کمائی استعمال کریں۔",
      "Jis Zabaan Mein Aap Aasani Mehsoos Karte Hain, Usi Zabaan Mein Kamaii Istemaal Karein."
    ),
  },

  common: {
    continue: createText("آگے بڑھیں", "Aage Barhein"),
    back: createText("واپس", "Wapas"),
    cancel: createText("منسوخ کریں", "Mansookh Karein"),
    save: createText("محفوظ کریں", "Mehfooz Karein"),
    edit: createText("ترمیم کریں", "Tarmeem Karein"),
    delete: createText("حذف کریں", "Hazf Karein"),
    yes: createText("ہاں", "Haan"),
    no: createText("نہیں", "Nahin"),
    search: createText("تلاش کریں", "Talaash Karein"),
    retry: createText("دوبارہ کوشش کریں", "Dobara Koshish Karein"),
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

export default ur;