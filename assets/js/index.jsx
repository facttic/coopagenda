import React from "react";
import ReactDOM from "react-dom";
import { Provider as ReduxProvider } from "react-redux";
import { PersistGate } from "redux-persist/integration/react";

import { ThemeProvider } from "styled-components";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fab } from "@fortawesome/free-brands-svg-icons";

import i18n from "./i18n/i18n";

import CARouter from "./router";
import theme from "../styles/theme";
import "../styles/application.sass";

import configureStore from "./lib/configure_store";
import { fetchSlots } from "./actions/slot_actions";

library.add(fab);

const { store, persistor } = configureStore();
store.dispatch(fetchSlots());

ReactDOM.render(
  <ThemeProvider theme={theme}>
    <ReduxProvider store={store}>
      <PersistGate loading={null} persistor={persistor}>
        <CARouter />
      </PersistGate>
    </ReduxProvider>
  </ThemeProvider>,
  document.getElementById("react-app")
);
