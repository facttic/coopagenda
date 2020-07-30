import i18n from "i18next";
import { initReactI18next } from "react-i18next";

import en from "./en/main.json";
import es from "./es/main.json";

// import store from '../state/index'
// import { changeLocale } from '../state/user_preferences/reducer'

console.log(en);

i18n.use(initReactI18next).init({
  fallbackLng: "en",
  lng: "en",
  debug: true,
  resources: { en, es },
  // lng: store.getState().UserPreferences.locale,
  joinArrays: "\n",
  react: {
    wait: true,
  },
});

// i18n.on('languageChanged', language => store.dispatch(changeLocale(language)))

export default i18n;
