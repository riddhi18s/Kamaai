import { Routes, Route, Navigate } from "react-router-dom";
import Language from "../pages/Language/Language";

/**
 * App Routes
 *
 * Phase 1 — only the Language selection screen exists.
 * Add new routes here as screens are built in later phases.
 *
 * Convention:
 *   /            → redirect to /language (onboarding entry)
 *   /language    → Language selection
 *   /home        → Dashboard (Phase 2)
 *   /jobs        → Job listings (Phase 2)
 *   /earnings    → Earnings (Phase 2)
 *   /profile     → Profile (Phase 2)
 */
function AppRoutes() {
  return (
    <Routes>
      <Route index element={<Navigate to="/language" replace />} />
      <Route path="/language" element={<Language />} />

      {/* Catch-all — redirects unknown paths back to start */}
      <Route path="*" element={<Navigate to="/language" replace />} />
    </Routes>
  );
}

export default AppRoutes;
