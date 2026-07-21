/**
 * cn — class name utility
 * Merges class strings, filtering falsy values.
 *
 * Usage:
 *   cn("btn", isActive && "btn--active", className)
 */
export function cn(...classes) {
  return classes.filter(Boolean).join(" ").trim();
}
