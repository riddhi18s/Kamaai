import "./Divider.css";

/**
 * Divider — horizontal or vertical separator
 *
 * Props:
 *   label     — string, centered text label
 *   vertical  — boolean
 *   spacing   — "sm" | "md" | "lg"
 */
function Divider({ label, vertical = false, spacing = "md", className = "" }) {
  if (vertical) {
    return <span className={`divider divider--vertical ${className}`} aria-hidden="true" />;
  }

  return (
    <div className={`divider divider--horizontal divider--${spacing} ${className}`} role="separator" aria-hidden="true">
      {label && <span className="divider__label">{label}</span>}
    </div>
  );
}

export default Divider;
