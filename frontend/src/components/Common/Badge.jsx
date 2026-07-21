import "./Badge.css";

/**
 * Badge — small status label
 *
 * Props:
 *   variant — "default" | "primary" | "accent" | "success" | "error" | "warning" | "info"
 *   size    — "sm" | "md"
 *   dot     — boolean, show a colored dot instead of text
 */
function Badge({ variant = "default", size = "md", dot = false, children, className = "" }) {
  const classes = [
    "badge",
    `badge--${variant}`,
    `badge--${size}`,
    dot && "badge--dot",
    className,
  ]
    .filter(Boolean)
    .join(" ");

  return (
    <span className={classes}>
      {dot && <span className="badge__dot" aria-hidden="true" />}
      {!dot && children}
    </span>
  );
}

export default Badge;
