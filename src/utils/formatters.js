/**
 * formatters — display formatting utilities
 * Locale-aware where possible, using the user's selected language.
 */

/**
 * Format a number as Indian currency (₹)
 * @param {number} amount
 * @param {boolean} compact — "₹1.2L" instead of "₹1,20,000"
 */
export function formatCurrency(amount, compact = false) {
  if (compact && amount >= 100000) {
    return `₹${(amount / 100000).toFixed(1)}L`;
  }
  if (compact && amount >= 1000) {
    return `₹${(amount / 1000).toFixed(1)}K`;
  }
  return new Intl.NumberFormat("en-IN", {
    style: "currency",
    currency: "INR",
    maximumFractionDigits: 0,
  }).format(amount);
}

/**
 * Format a relative time string ("2 hours ago", "just now")
 * @param {Date|string|number} date
 */
export function formatRelativeTime(date) {
  const d     = new Date(date);
  const now   = Date.now();
  const diff  = Math.floor((now - d.getTime()) / 1000); // seconds

  if (diff < 60)   return "just now";
  if (diff < 3600) return `${Math.floor(diff / 60)}m ago`;
  if (diff < 86400)return `${Math.floor(diff / 3600)}h ago`;
  if (diff < 604800)return `${Math.floor(diff / 86400)}d ago`;

  return d.toLocaleDateString("en-IN", { day: "numeric", month: "short" });
}

/**
 * Format a phone number for display — adds spacing for Indian numbers
 * @param {string} phone — 10-digit number
 */
export function formatPhone(phone) {
  const clean = phone.replace(/\D/g, "").slice(-10);
  if (clean.length !== 10) return phone;
  return `${clean.slice(0, 5)} ${clean.slice(5)}`;
}

/**
 * Truncate a string to maxLength with ellipsis
 */
export function truncate(str, maxLength = 80) {
  if (!str || str.length <= maxLength) return str;
  return str.slice(0, maxLength).trimEnd() + "…";
}

/**
 * Capitalize the first letter of a string
 */
export function capitalize(str) {
  if (!str) return "";
  return str.charAt(0).toUpperCase() + str.slice(1);
}
