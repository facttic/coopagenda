import i18n from "i18next";

import * as en from "./en/main.json";
import * as es from "./es/main.json";

// import store from '../state/index'
// import { changeLocale } from '../state/user_preferences/reducer'

i18n.init({
  fallbackLng: "en",
  resources: { en, es },
  // lng: store.getState().UserPreferences.locale,
  defaultNS: "main",
  joinArrays: "\n",
  react: {
    wait: true,
  },
});

// i18n.on('languageChanged', language => store.dispatch(changeLocale(language)))

export default i18n;
