import React from "react";
import ReactDOM from "react-dom";
// import { Provider as ReduxProvider } from 'react-redux'

import { ThemeProvider } from "styled-components";
import { I18nextProvider } from "react-i18next";

import i18n from "./i18n/i18n";

import { library } from "@fortawesome/fontawesome-svg-core";
import { fab } from "@fortawesome/free-brands-svg-icons";

import CARouter from "./router";
import theme from "../styles/theme";

import "../styles/application.sass";

library.add(fab);

// import store from './state'
// import UserProvider from './components/LoggedInUser/UserProvider'

// Inject React app in DOM
ReactDOM.render(
  <ThemeProvider theme={theme}>
    <I18nextProvider i18n={i18n}>
      {/* <ReduxProvider store={store}>
          <UserProvider> */}
      <CARouter />
      {/* </UserProvider>
    </ReduxProvider> */}
    </I18nextProvider>
  </ThemeProvider>,
  document.getElementById("react-app")
);
