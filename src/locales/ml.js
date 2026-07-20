import { createText } from "./createText";

const ml = {
  meta: {
    code: "ml",
    nativeName: "മലയാളം",
    englishName: "Malayalam",
    direction: "ltr",
    speechLocale: "ml-IN",
  },

  app: {
    name: createText("കമായി", "Kamaii"),
    tagline: createText(
      "ജോലി കണ്ടെത്തൂ, ജോലി നൽകൂ, ഒരുമിച്ച്",
      "Joli Kandethoo, Joli Nalkoo, Orumichu"
    ),
    loading: createText("ലോഡ് ചെയ്യുന്നു...", "Load Cheyyunnu..."),
  },

  onboarding: {
    welcome: createText(
      "കമായിയിലേക്ക് സ്വാഗതം",
      "Kamaiiyilekku Swagatham"
    ),
    chooseLanguage: createText(
      "നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുക്കുക",
      "Ningalude Bhasha Thiranjedukkuka"
    ),
    description: createText(
      "നിങ്ങൾക്ക് സൗകര്യപ്രദമായ ഭാഷയിൽ കമായി ഉപയോഗിക്കുക.",
      "Ningalkku Soukaryapradamaya Bhashayil Kamaii Upayogikkuka."
    ),
  },

  common: {
    continue: createText("തുടരുക", "Thudaruka"),
    back: createText("തിരികെ", "Thirike"),
    cancel: createText("റദ്ദാക്കുക", "Raddakkuka"),
    save: createText("സേവ് ചെയ്യുക", "Save Cheyyuka"),
    edit: createText("തിരുത്തുക", "Thiruthuka"),
    delete: createText("ഇല്ലാതാക്കുക", "Illathakkuka"),
    yes: createText("അതെ", "Athe"),
    no: createText("അല്ല", "Alla"),
    search: createText("തിരയുക", "Thirayuka"),
    retry: createText("വീണ്ടും ശ്രമിക്കുക", "Veendum Sramikkuka"),
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

export default ml;