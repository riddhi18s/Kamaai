import Modal from "./Modal";
import Button from "./Button";
import "./Dialog.css";

/**
 * Dialog — confirmation dialog (wraps Modal)
 *
 * Props:
 *   open        — boolean
 *   onClose     — function
 *   onConfirm   — function
 *   title       — string
 *   description — string
 *   confirmLabel— string (default "Confirm")
 *   cancelLabel — string (default "Cancel")
 *   variant     — "default" | "danger"
 *   loading     — boolean
 */
function Dialog({
  open,
  onClose,
  onConfirm,
  title,
  description,
  confirmLabel = "Confirm",
  cancelLabel  = "Cancel",
  variant      = "default",
  loading      = false,
}) {
  return (
    <Modal open={open} onClose={onClose} size="sm" closeOnBackdrop={!loading}>
      <div className="dialog">
        {title       && <h3 className="dialog__title">{title}</h3>}
        {description && <p  className="dialog__description">{description}</p>}
        <div className="dialog__actions">
          <Button variant="ghost" onClick={onClose} disabled={loading} full>
            {cancelLabel}
          </Button>
          <Button
            variant={variant === "danger" ? "danger" : "primary"}
            onClick={onConfirm}
            loading={loading}
            full
          >
            {confirmLabel}
          </Button>
        </div>
      </div>
    </Modal>
  );
}

export default Dialog;
