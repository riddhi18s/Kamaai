import "./EmptyState.css";
import Button from "./Button";

/**
 * EmptyState — zero-data placeholder
 *
 * Props:
 *   icon       — ReactNode (emoji or icon component)
 *   title      — string
 *   description— string
 *   action     — { label: string, onClick: fn } | ReactNode
 */
function EmptyState({ icon, title, description, action, className = "" }) {
  return (
    <div className={`empty-state ${className}`} role="status">
      {icon && (
        <div className="empty-state__icon" aria-hidden="true">{icon}</div>
      )}
      {title && (
        <h3 className="empty-state__title">{title}</h3>
      )}
      {description && (
        <p className="empty-state__description">{description}</p>
      )}
      {action && (
        <div className="empty-state__action">
          {typeof action === "object" && action.label ? (
            <Button variant="secondary" onClick={action.onClick}>
              {action.label}
            </Button>
          ) : (
            action
          )}
        </div>
      )}
    </div>
  );
}

export default EmptyState;
