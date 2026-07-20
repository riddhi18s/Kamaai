import "./ErrorState.css";
import Button from "./Button";

/**
 * ErrorState — error placeholder with retry
 *
 * Props:
 *   title   — string
 *   message — string
 *   onRetry — function
 *   retryLabel — string (default "Try again")
 */
function ErrorState({ title = "Something went wrong", message, onRetry, retryLabel = "Try again", className = "" }) {
  return (
    <div className={`error-state ${className}`} role="alert">
      <div className="error-state__icon" aria-hidden="true">⚠️</div>
      <h3 className="error-state__title">{title}</h3>
      {message && <p className="error-state__message">{message}</p>}
      {onRetry && (
        <Button variant="secondary" onClick={onRetry} className="error-state__retry">
          {retryLabel}
        </Button>
      )}
    </div>
  );
}

export default ErrorState;
