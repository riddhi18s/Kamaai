import "../../styles/pages/language.css";

import LocalizedText from "../../components/Common/LocalizedText";
import LanguageCard from "../../components/Language/LanguageCard";

import { useLanguage } from "../../context/LanguageContext";

import supportedLanguages from "../../constants/supportedLanguages";

function Language() {
  const { language, selectedLanguage, setSelectedLanguage } = useLanguage();

  return (
    <div className="language-page">
      <header className="language-header">
        <LocalizedText
          text={language.app.name}
          nativeTag="h1"
        />

        <LocalizedText
          text={language.app.tagline}
          nativeTag="h3"
        />
      </header>

      <section className="language-title">
        <LocalizedText
          text={language.onboarding.chooseLanguage}
          nativeTag="h2"
        />

        <LocalizedText
          text={language.onboarding.description}
          nativeTag="p"
          romanTag="p"
        />
      </section>

      <section className="language-list">
        {supportedLanguages.map((item) => (
          <LanguageCard
            key={item.meta.code}
            language={item.meta}
            selected={selectedLanguage === item.meta.code}
            onClick={setSelectedLanguage}
          />
        ))}
      </section>
    </div>
  );
}

export default Language;