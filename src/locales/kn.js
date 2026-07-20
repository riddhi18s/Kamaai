import { createText } from "./createText";

const kn = {
  meta: {
    code: "kn",
    nativeName: "ಕನ್ನಡ",
    englishName: "Kannada",
    direction: "ltr",
    speechLocale: "kn-IN",
  },

  app: {
    name: createText("ಕಮಾಯಿ", "Kamaii"),
    tagline: createText(
      "ಕೆಲಸ ಹುಡುಕಿ ಮತ್ತು ಕೆಲಸ ನೀಡಿ, ಒಟ್ಟಿಗೆ",
      "Kelasa Huduki Mattu Kelasa Nidi, Ottige"
    ),
    loading: createText("ಲೋಡ್ ಆಗುತ್ತಿದೆ...", "Load Aguttide..."),
  },

  onboarding: {
    welcome: createText(
      "ಕಮಾಯಿಗೆ ಸ್ವಾಗತ",
      "Kamaiige Swagata"
    ),
    chooseLanguage: createText(
      "ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ",
      "Nimma Bhasheyannu Aykemadi"
    ),
    description: createText(
      "ನೀವು ಆರಾಮವಾಗಿರುವ ಭಾಷೆಯಲ್ಲಿ ಕಮಾಯಿಯನ್ನು ಬಳಸಿ.",
      "Neevu Aaramavagiruva Bhasheyalli Kamaiiyannu Balasi."
    ),
  },

  common: {
    continue: createText("ಮುಂದುವರಿಸಿ", "Munduvarisi"),
    back: createText("ಹಿಂದೆ", "Hinde"),
    cancel: createText("ರದ್ದುಮಾಡಿ", "Raddumadi"),
    save: createText("ಉಳಿಸಿ", "Ulisi"),
    edit: createText("ಸಂಪಾದಿಸಿ", "Sampadisi"),
    delete: createText("ಅಳಿಸಿ", "Alisi"),
    yes: createText("ಹೌದು", "Howdu"),
    no: createText("ಇಲ್ಲ", "Illa"),
    search: createText("ಹುಡುಕಿ", "Huduki"),
    retry: createText("ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ", "Matte Prayatnisi"),
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

export default kn;