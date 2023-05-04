import * as bootstrap from "bootstrap";
import { createRoot } from "react-dom/client";
import App from "./components/App.jsx";

const domNode = document.getElementsByTagName("main")[0];
const root = createRoot(domNode);
root.render(<App />);
