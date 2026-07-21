import "./Card.css";

/**
 * Card
 *
 * Props:
 *   variant   — "flat" | "raised" | "elevated" | "outlined"
 *   padding   — "none" | "sm" | "md" | "lg"
 *   pressable — boolean, adds hover/active states
 *   selected  — boolean, green selection highlight
 *   header    — ReactNode, renders in card__header
 *   footer    — ReactNode, renders in card__footer
 *   onClick   — function (requires pressable=true)
 *   children  — card body content
 */
function Card({
  variant   = "raised",
  padding   = "md",
  pressable = false,
  selected  = false,
  header,
  footer,
  onClick,
  className = "",
  children,
  ...rest
}) {
  const classes = [
    "card",
    `card--${variant}`,
    pressable && "card--pressable",
    selected  && "card--selected",
    className,
  ]
    .filter(Boolean)
    .join(" ");

  const Tag = pressable ? "button" : "div";

  return (
    <Tag
      className={classes}
      onClick={pressable ? onClick : undefined}
      type={pressable ? "button" : undefined}
      {...rest}
    >
      {header && <div className="card__header">{header}</div>}
      <div className={`card__body card__body--${padding}`}>{children}</div>
      {footer && <div className="card__footer">{footer}</div>}
    </Tag>
  );
}

export default Card;
