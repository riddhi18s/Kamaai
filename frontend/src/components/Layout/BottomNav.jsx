import "./BottomNav.css";

/**
 * BottomNav — fixed bottom navigation bar
 *
 * Props:
 *   items   — Array<{ id, label, icon: ReactNode, badge?: number }>
 *   active  — string (current item id)
 *   onChange— function(id)
 */
function BottomNav({ items = [], active, onChange, className = "" }) {
  return (
    <nav
      className={`bottom-nav ${className}`}
      aria-label="Main navigation"
      role="navigation"
    >
      {items.map((item) => (
        <button
          key={item.id}
          type="button"
          className={`bottom-nav__item ${active === item.id ? "bottom-nav__item--active" : ""}`}
          onClick={() => onChange?.(item.id)}
          aria-label={item.label}
          aria-current={active === item.id ? "page" : undefined}
        >
          <span className="bottom-nav__icon" aria-hidden="true">
            {item.icon}
            {item.badge > 0 && (
              <span className="bottom-nav__badge" aria-label={`${item.badge} notifications`}>
                {item.badge > 99 ? "99+" : item.badge}
              </span>
            )}
          </span>
          <span className="bottom-nav__label">{item.label}</span>
        </button>
      ))}
    </nav>
  );
}

export default BottomNav;
