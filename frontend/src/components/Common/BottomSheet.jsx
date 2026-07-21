import { useEffect } from "preact/hooks";
import "./BottomSheet.css";

/**
 * BottomSheet — slides up from bottom (primary mobile pattern for Kamaii)
 *
 * Props:
 *   open    — boolean
 *   onClose — function
 *   title   — string
 *   snap    — "auto" | "half" | "full" (max-height)
 */
function BottomSheet({ open, onClose, title, snap = "auto", children, className = "" }) {
  useEffect(() => {
    if (!open) return;
    const onKey = (e) => e.key === "Escape" && onClose?.();
    document.addEventListener("keydown", onKey);
    document.body.style.overflow = "hidden";
    return () => {
      document.removeEventListener("keydown", onKey);
      document.body.style.overflow = "";
    };
  }, [open, onClose]);

  if (!open) return null;

  return (
    <div
      className="sheet-backdrop modal-backdrop-enter"
      role="presentation"
      onClick={onClose}
    >
      <div
        role="dialog"
        aria-modal="true"
        aria-labelledby={title ? "sheet-title" : undefined}
        className={`sheet sheet--${snap} sheet-enter ${className}`}
        onClick={(e) => e.stopPropagation()}
      >
        {/* Drag handle */}
        <div className="sheet__handle" aria-hidden="true" />

        {title && (
          <div className="sheet__header">
            <h2 id="sheet-title" className="sheet__title">{title}</h2>
            <button type="button" className="sheet__close" onClick={onClose} aria-label="Close">✕</button>
          </div>
        )}

        <div className="sheet__body">{children}</div>
      </div>
    </div>
  );
}

export default BottomSheet;
