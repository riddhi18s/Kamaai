import "./Chip.css";

/**
 * Chip — selectable filter/tag
 *
 * Props:
 *   selected  — boolean
 *   onSelect  — function
 *   onRemove  — function, shows × button if provided
 *   disabled  — boolean
 *   leftIcon  — ReactNode
 */
function Chip({ selected = false, onSelect, onRemove, disabled = false, leftIcon, children, className = "" }) {
  const classes = [
    "chip",
    selected  && "chip--selected",
    disabled  && "chip--disabled",
    onSelect  && "chip--interactive",
    className,
  ]
    .filter(Boolean)
    .join(" ");

  return (
    <span
      className={classes}
      role={onSelect ? "button" : undefined}
      tabIndex={onSelect && !disabled ? 0 : undefined}
      aria-pressed={onSelect ? selected : undefined}
      onClick={!disabled && onSelect ? onSelect : undefined}
      onKeyDown={onSelect ? (e) => (e.key === "Enter" || e.key === " ") && onSelect(e) : undefined}
    >
      {leftIcon && <span className="chip__icon" aria-hidden="true">{leftIcon}</span>}
      <span className="chip__label">{children}</span>
      {onRemove && (
        <button
          type="button"
          className="chip__remove"
          onClick={(e) => { e.stopPropagation(); onRemove(e); }}
          aria-label="Remove"
          tabIndex={-1}
        >
          ✕
        </button>
      )}
    </span>
  );
}

export default Chip;
