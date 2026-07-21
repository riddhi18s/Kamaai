import { createText } from "./createText";

const te = {
  meta: {
    code: "te",
    nativeName: "తెలుగు",
    englishName: "Telugu",
    direction: "ltr",
    speechLocale: "te-IN",
  },

  app: {
    name: createText("కమాయి", "Kamaii"),
    tagline: createText(
      "పని వెతకండి మరియు పని ఇవ్వండి, కలిసి",
      "Pani Vethakandi Mariyu Pani Ivvandi, Kalisi"
    ),
    loading: createText("లోడ్ అవుతోంది...", "Load Avutondi..."),
  },

  onboarding: {
    welcome: createText(
      "కమాయికి స్వాగతం",
      "Kamaiiki Swagatam"
    ),
    chooseLanguage: createText(
      "మీ భాషను ఎంచుకోండి",
      "Mee Bhashanu Enchukondi"
    ),
    description: createText(
      "మీకు సౌకర్యంగా ఉన్న భాషలో కమాయిని ఉపయోగించండి.",
      "Meeku Soukaryanga Unna Bhashalo Kamaiini Upayoginchandi."
    ),
  },

  common: {
    continue: createText("కొనసాగించండి", "Konasaginchandi"),
    back: createText("వెనుకకు", "Venukaku"),
    cancel: createText("రద్దు చేయండి", "Raddu Cheyandi"),
    save: createText("సేవ్ చేయండి", "Save Cheyandi"),
    edit: createText("సవరించండి", "Savarinchandi"),
    delete: createText("తొలగించండి", "Tholaginchandi"),
    yes: createText("అవును", "Avunu"),
    no: createText("కాదు", "Kaadu"),
    search: createText("వెతకండి", "Vethakandi"),
    retry: createText("మళ్లీ ప్రయత్నించండి", "Malli Prayatninchandi"),
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

export default te;