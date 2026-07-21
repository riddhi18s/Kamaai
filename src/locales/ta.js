import { createText } from "./createText";

const ta = {
  meta: {
    code: "ta",
    nativeName: "தமிழ்",
    englishName: "Tamil",
    direction: "ltr",
    speechLocale: "ta-IN",
  },

  app: {
    name: createText("கமாய்", "Kamaii"),
    tagline: createText(
      "வேலை தேடுங்கள் மற்றும் வேலை வழங்குங்கள், ஒன்றாக",
      "Velai Thedungal Matrum Velai Vazhangungal, Ondraga"
    ),
    loading: createText("ஏற்றப்படுகிறது...", "Etrappadugirathu..."),
  },

  onboarding: {
    welcome: createText(
      "கமாயிற்கு வரவேற்கிறோம்",
      "Kamaiikku Varaverkirom"
    ),
    chooseLanguage: createText(
      "உங்கள் மொழியை தேர்ந்தெடுக்கவும்",
      "Ungal Mozhiyai Thernthedukkavum"
    ),
    description: createText(
      "நீங்கள் வசதியாக இருக்கும் மொழியில் கமாயைப் பயன்படுத்துங்கள்.",
      "Neengal Vasathiyaga Irukkum Mozhiyil Kamaiyai Payanpaduthungal."
    ),
  },

  common: {
    continue: createText("தொடரவும்", "Thodaravum"),
    back: createText("பின்னால்", "Pinnal"),
    cancel: createText("ரத்து செய்", "Rathu Sei"),
    save: createText("சேமிக்கவும்", "Saemikkavum"),
    edit: createText("திருத்து", "Thiruthu"),
    delete: createText("நீக்கு", "Neekku"),
    yes: createText("ஆம்", "Aam"),
    no: createText("இல்லை", "Illai"),
    search: createText("தேடு", "Thedu"),
    retry: createText("மீண்டும் முயற்சிக்கவும்", "Meendum Muyarchikkavum"),
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

export default ta;