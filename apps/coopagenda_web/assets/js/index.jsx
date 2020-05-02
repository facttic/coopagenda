import React from "react";
import ReactDOM from "react-dom";
import { Provider as ReduxProvider } from "react-redux";
import { ThemeProvider } from "styled-components";
import { I18nextProvider } from "react-i18next";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fab } from "@fortawesome/free-brands-svg-icons";
import i18n from "./i18n/i18n";

import CARouter from "./router";
import theme from "../styles/theme";
import "../styles/application.sass";

import configureStore from "./lib/configure_store";
import { fetchSlots } from "./actions/slot_actions";

library.add(fab);

const store = configureStore();
store.dispatch(fetchSlots());

ReactDOM.render(
  <ThemeProvider theme={theme}>
    <I18nextProvider i18n={i18n}>
      <ReduxProvider store={store}>
        <CARouter />
      </ReduxProvider>
    </I18nextProvider>
  </ThemeProvider>,
  document.getElementById("react-app")
);
