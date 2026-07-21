import "./LanguageCard.css";
import LocalizedText from "../Common/LocalizedText";

function LanguageCard({
  language,
  selected,
  onClick,
}) {
  return (
    <button
      type="button"
      className={`language-card ${selected ? "selected" : ""}`}
      onClick={() => onClick(language.code)}
    >
      <LocalizedText
        text={{
          native: language.nativeName,
          roman: language.englishName,
        }}
        nativeTag="h3"
        romanTag="p"
      />
    </button>
  );
}

export default LanguageCard;