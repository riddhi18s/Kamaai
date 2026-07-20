import "./IconWrapper.css";

/**
 * IconWrapper — consistent icon container with optional background
 *
 * Props:
 *   size    — "xs" | "sm" | "md" | "lg" | "xl"
 *   variant — "plain" | "soft" | "filled"
 *   color   — "primary" | "accent" | "success" | "error" | "warning" | "neutral"
 */
function IconWrapper({ size = "md", variant = "plain", color = "neutral", children, className = "", ...rest }) {
  const classes = [
    "icon-wrapper",
    `icon-wrapper--${size}`,
    `icon-wrapper--${variant}`,
    `icon-wrapper--${color}`,
    className,
  ]
    .filter(Boolean)
    .join(" ");

  return (
    <span className={classes} aria-hidden="true" {...rest}>
      {children}
    </span>
  );
}

export default IconWrapper;
