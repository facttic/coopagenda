import { combineReducers } from "redux";
import slots from "./slot_reducer";
import user from "./user_reducer";

const rootReducer = combineReducers({
  slots,
  user,
});

export default rootReducer;
