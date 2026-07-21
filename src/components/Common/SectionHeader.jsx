import "./SectionHeader.css";

/**
 * SectionHeader — titled section with optional action
 *
 * Props:
 *   title     — string | ReactNode
 *   subtitle  — string | ReactNode
 *   action    — ReactNode (e.g. "See all" link/button)
 *   size      — "sm" | "md" | "lg"
 */
function SectionHeader({ title, subtitle, action, size = "md", className = "" }) {
  return (
    <div className={`section-header section-header--${size} ${className}`}>
      <div className="section-header__text">
        {title    && <h2 className="section-header__title">{title}</h2>}
        {subtitle && <p  className="section-header__subtitle">{subtitle}</p>}
      </div>
      {action && <div className="section-header__action">{action}</div>}
    </div>
  );
}

export default SectionHeader;
