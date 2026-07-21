import { useEffect } from "preact/hooks";
import "./Modal.css";

/**
 * Modal — centered dialog overlay
 *
 * Props:
 *   open      — boolean
 *   onClose   — function
 *   title     — string
 *   size      — "sm" | "md" | "lg"
 *   closeOnBackdrop — boolean (default true)
 */
function Modal({ open, onClose, title, size = "md", closeOnBackdrop = true, children, className = "" }) {
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
      className="modal-backdrop modal-backdrop-enter"
      role="presentation"
      onClick={closeOnBackdrop ? onClose : undefined}
    >
      <div
        role="dialog"
        aria-modal="true"
        aria-labelledby={title ? "modal-title" : undefined}
        className={`modal modal--${size} modal-enter ${className}`}
        onClick={(e) => e.stopPropagation()}
      >
        {title && (
          <div className="modal__header">
            <h2 id="modal-title" className="modal__title">{title}</h2>
            <button type="button" className="modal__close" onClick={onClose} aria-label="Close">✕</button>
          </div>
        )}
        <div className="modal__body">{children}</div>
      </div>
    </div>
  );
}

export default Modal;
