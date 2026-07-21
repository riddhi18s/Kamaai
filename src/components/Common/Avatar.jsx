import "./Avatar.css";

/**
 * Avatar
 *
 * Props:
 *   src     — image URL
 *   alt     — alt text (required for images)
 *   name    — string, generates initials if no src
 *   size    — "xs" | "sm" | "md" | "lg" | "xl"
 *   variant — "circle" | "rounded"
 *   badge   — ReactNode, overlaid bottom-right
 */
function Avatar({ src, alt, name, size = "md", variant = "circle", badge, className = "" }) {
  const initials = name
    ? name.trim().split(/\s+/).slice(0, 2).map(w => w[0].toUpperCase()).join("")
    : "?";

  const classes = [
    "avatar",
    `avatar--${size}`,
    `avatar--${variant}`,
    className,
  ]
    .filter(Boolean)
    .join(" ");

  return (
    <div className={`avatar-wrapper avatar-wrapper--${size}`}>
      <span className={classes} aria-label={alt || name || "Avatar"}>
        {src ? (
          <img src={src} alt={alt || name || "Avatar"} className="avatar__img" />
        ) : (
          <span className="avatar__initials" aria-hidden="true">{initials}</span>
        )}
      </span>
      {badge && (
        <span className="avatar__badge" aria-hidden="true">{badge}</span>
      )}
    </div>
  );
}

export default Avatar;
