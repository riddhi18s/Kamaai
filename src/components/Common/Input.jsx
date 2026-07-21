import "./Input.css";

/**
 * Input
 *
 * Props:
 *   label     — string
 *   hint      — string, helper text below input
 *   error     — string, replaces hint in red
 *   required  — boolean
 *   leftIcon  — ReactNode
 *   rightIcon — ReactNode
 *   disabled  — boolean
 *   type      — HTML input type
 *   id        — for label association
 */
function Input({
  label,
  hint,
  error,
  required  = false,
  leftIcon,
  rightIcon,
  disabled  = false,
  type      = "text",
  id,
  className = "",
  ...rest
}) {
  const inputId = id || `input-${Math.random().toString(36).slice(2, 8)}`;

  const fieldClasses = [
    "input-field",
    leftIcon  && "input-field--with-left",
    rightIcon && "input-field--with-right",
    error     && "input-field--error",
  ]
    .filter(Boolean)
    .join(" ");

  return (
    <div className={`input-wrapper ${className}`}>
      {label && (
        <label
          htmlFor={inputId}
          className={`input-label${required ? " input-label--required" : ""}`}
        >
          {label}
        </label>
      )}

      <div className="input-field-wrapper">
        {leftIcon && (
          <span className="input-icon input-icon--left" aria-hidden="true">
            {leftIcon}
          </span>
        )}

        <input
          id={inputId}
          type={type}
          className={fieldClasses}
          disabled={disabled}
          required={required}
          aria-invalid={error ? "true" : undefined}
          aria-describedby={hint || error ? `${inputId}-hint` : undefined}
          {...rest}
        />

        {rightIcon && (
          <span className="input-icon input-icon--right" aria-hidden="true">
            {rightIcon}
          </span>
        )}
      </div>

      {(hint || error) && (
        <span
          id={`${inputId}-hint`}
          className={`input-hint${error ? " input-hint--error" : ""}`}
          role={error ? "alert" : undefined}
        >
          {error || hint}
        </span>
      )}
    </div>
  );
}

export default Input;
