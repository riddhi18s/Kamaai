import { useRef } from "preact/hooks";
import "./Button.css";

/**
 * Button
 *
 * Props:
 *   variant  — "primary" | "accent" | "secondary" | "ghost" | "danger"
 *   size     — "sm" | "md" | "lg"
 *   full     — boolean, full width
 *   loading  — boolean, shows spinner
 *   disabled — boolean
 *   iconOnly — boolean, square pill shape
 *   leftIcon — ReactNode
 *   rightIcon— ReactNode
 *   onClick  — function
 *   type     — "button" | "submit" | "reset"
 *   children — label content
 *   ariaLabel— required when iconOnly=true
 */
function Button({
  variant  = "primary",
  size     = "md",
  full     = false,
  loading  = false,
  disabled = false,
  iconOnly = false,
  leftIcon,
  rightIcon,
  onClick,
  type     = "button",
  children,
  ariaLabel,
  className = "",
  ...rest
}) {
  const btnRef = useRef(null);

  function handleClick(e) {
    if (disabled || loading) return;
    createRipple(e);
    onClick?.(e);
  }

  function createRipple(e) {
    const btn = btnRef.current;
    if (!btn) return;

    const rect   = btn.getBoundingClientRect();
    const size   = Math.max(rect.width, rect.height);
    const x      = (e.clientX - rect.left) - size / 2;
    const y      = (e.clientY - rect.top)  - size / 2;

    const ripple = document.createElement("span");
    ripple.className = "ripple-wave";
    ripple.style.cssText = `
      width: ${size}px;
      height: ${size}px;
      left: ${x}px;
      top: ${y}px;
    `;

    btn.appendChild(ripple);
    ripple.addEventListener("animationend", () => ripple.remove());
  }

  const classes = [
    "btn",
    `btn--${variant}`,
    `btn--${size}`,
    full     && "btn--full",
    loading  && "btn--loading",
    iconOnly && "btn--icon-only",
    className,
  ]
    .filter(Boolean)
    .join(" ");

  return (
    <button
      ref={btnRef}
      type={type}
      className={classes}
      disabled={disabled || loading}
      aria-label={ariaLabel}
      aria-busy={loading || undefined}
      onClick={handleClick}
      {...rest}
    >
      {loading ? (
        <>
          <span className="btn__spinner" aria-hidden="true" />
          {!iconOnly && children}
        </>
      ) : (
        <>
          {leftIcon  && <span className="btn__icon btn__icon--left"  aria-hidden="true">{leftIcon}</span>}
          {!iconOnly && children}
          {rightIcon && <span className="btn__icon btn__icon--right" aria-hidden="true">{rightIcon}</span>}
        </>
      )}
    </button>
  );
}

export default Button;
