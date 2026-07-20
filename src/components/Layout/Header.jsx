import "./Header.css";

/**
 * Header — sticky top bar
 *
 * Props:
 *   title     — string | ReactNode
 *   leftSlot  — ReactNode (back button, menu icon)
 *   rightSlot — ReactNode (profile, notifications)
 *   transparent — boolean, no background (for hero pages)
 */
function Header({ title, leftSlot, rightSlot, transparent = false, className = "" }) {
  return (
    <header
      className={`header ${transparent ? "header--transparent" : ""} ${className}`}
      role="banner"
    >
      <div className="header__slot header__slot--left">
        {leftSlot}
      </div>

      {title && (
        <div className="header__title-wrapper">
          {typeof title === "string" ? (
            <h1 className="header__title">{title}</h1>
          ) : (
            title
          )}
        </div>
      )}

      <div className="header__slot header__slot--right">
        {rightSlot}
      </div>
    </header>
  );
}

export default Header;
