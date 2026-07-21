import "../../styles/components/localizedText.css";

function LocalizedText({
  text,
  nativeTag: NativeTag = "p",
  romanTag: RomanTag = "span",
  className = "",
  showRoman = true,
}) {
  if (!text || typeof text !== "object") {
    return null;
  }

  const {
    native = "",
    roman = "",
  } = text;

  return (
    <div className={`localized-text ${className}`.trim()}>
      {native && (
        <NativeTag className="localized-native">
          {native}
        </NativeTag>
      )}

      {showRoman && roman && (
        <RomanTag className="localized-roman">
          {roman}
        </RomanTag>
      )}
    </div>
  );
}

export default LocalizedText;