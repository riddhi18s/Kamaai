import "./LoadingSkeleton.css";

/**
 * LoadingSkeleton — shimmer placeholders
 *
 * Props:
 *   variant — "text" | "circle" | "rect" | "card"
 *   width   — CSS width string
 *   height  — CSS height string
 *   lines   — number of text lines (variant="text")
 *   count   — number of skeleton items to repeat
 */
function LoadingSkeleton({ variant = "rect", width, height, lines = 3, count = 1, className = "" }) {
  const items = Array.from({ length: count });

  if (variant === "card") {
    return (
      <>
        {items.map((_, i) => (
          <div key={i} className={`skeleton-card ${className}`}>
            <div className="skeleton skeleton-card__header" />
            <div className="skeleton skeleton-card__line skeleton-card__line--long" />
            <div className="skeleton skeleton-card__line skeleton-card__line--short" />
          </div>
        ))}
      </>
    );
  }

  if (variant === "text") {
    return (
      <div className={`skeleton-text-group ${className}`}>
        {Array.from({ length: lines }).map((_, i) => (
          <div
            key={i}
            className="skeleton skeleton-text"
            style={{ width: i === lines - 1 ? "65%" : "100%" }}
          />
        ))}
      </div>
    );
  }

  return (
    <>
      {items.map((_, i) => (
        <div
          key={i}
          className={`skeleton skeleton--${variant} ${className}`}
          style={{ width, height }}
        />
      ))}
    </>
  );
}

export default LoadingSkeleton;
