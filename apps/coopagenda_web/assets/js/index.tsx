import React from "react";
import ReactDOM from "react-dom";
import App from "./App";
import { SlotsStore } from "./store";

const slotsStore = new SlotsStore();

ReactDOM.render(
  <App slotsStore={slotsStore} />,
  document.getElementById("react-app")
);
