import { useState, useEffect } from "preact/hooks";

/**
 * useNetwork — detects online/offline status
 * Critical for informal workers in low-connectivity areas.
 *
 * @returns { isOnline: boolean, isOffline: boolean, effectiveType: string }
 */
export function useNetwork() {
  const [isOnline, setIsOnline] = useState(
    typeof navigator !== "undefined" ? navigator.onLine : true
  );

  const [effectiveType, setEffectiveType] = useState(
    navigator?.connection?.effectiveType ?? "unknown"
  );

  useEffect(() => {
    const goOnline  = () => setIsOnline(true);
    const goOffline = () => setIsOnline(false);

    window.addEventListener("online",  goOnline);
    window.addEventListener("offline", goOffline);

    const connection = navigator?.connection;
    if (connection) {
      const updateType = () => setEffectiveType(connection.effectiveType);
      connection.addEventListener("change", updateType);
      return () => {
        window.removeEventListener("online",  goOnline);
        window.removeEventListener("offline", goOffline);
        connection.removeEventListener("change", updateType);
      };
    }

    return () => {
      window.removeEventListener("online",  goOnline);
      window.removeEventListener("offline", goOffline);
    };
  }, []);

  return {
    isOnline,
    isOffline: !isOnline,
    effectiveType,          // "slow-2g" | "2g" | "3g" | "4g" | "unknown"
    isSlow: ["slow-2g", "2g"].includes(effectiveType),
  };
}
