import "./MobileLayout.css";

/**
 * MobileLayout — root shell for every page
 *
 * Props:
 *   header  — ReactNode (pass <Header /> or null)
 *   footer  — ReactNode (pass <BottomNav /> or null)
 *   noPad   — boolean, removes page padding (for full-bleed pages)
 */
function MobileLayout({ header, footer, noPad = false, children, className = "" }) {
  return (
    <div className={`mobile-layout ${className}`}>
      {header && <div className="mobile-layout__header">{header}</div>}

      <main
        className={`mobile-layout__main ${noPad ? "mobile-layout__main--no-pad" : ""}`}
        id="main-content"
      >
        {children}
      </main>

      {footer && <div className="mobile-layout__footer">{footer}</div>}
    </div>
  );
}

export default MobileLayout;
