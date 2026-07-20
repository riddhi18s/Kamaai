import { createContext, useContext, useMemo, useState } from "react";
import locales from "../locales";

const LanguageContext = createContext(null);

export function LanguageProvider({ children }) {
  const [selectedLanguage, setSelectedLanguage] = useState("hi");

  const language = locales[selectedLanguage];

  const value = useMemo(
    () => ({
      selectedLanguage,
      setSelectedLanguage,
      language,
      languages: Object.values(locales),
    }),
    [selectedLanguage, language]
  );

  return (
    <LanguageContext.Provider value={value}>
      {children}
    </LanguageContext.Provider>
  );
}

export function useLanguage() {
  const context = useContext(LanguageContext);

  if (!context) {
    throw new Error("useLanguage must be used inside LanguageProvider");
  }

  return context;
}