import { h, render } from "preact";
import { BrowserRouter } from "react-router-dom";

import App from "./App.jsx";
import { LanguageProvider } from "./context/LanguageContext";

/* CSS load order matters — tokens first, then global rules */
import "./styles/variables.css";
import "./styles/colors.css";
import "./styles/reset.css";
import "./styles/typography.css";
import "./styles/globals.css";
import "./styles/responsive.css";
import "./styles/animations.css";

render(
  <LanguageProvider>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </LanguageProvider>,
  document.getElementById("root")
);
