import { useLanguage } from "../context/LanguageContext";

function getNestedValue(object, path) {
  return path.split(".").reduce((current, key) => current?.[key], object);
}

export function useTranslate() {
  const { language } = useLanguage();

  function t(path) {
    const value = getNestedValue(language, path);

    if (!value) {
      console.warn(`Missing translation: ${path}`);
      return {
        native: path,
        roman: path,
        speech: path,
      };
    }

    return value;
  }

  return { t };
}