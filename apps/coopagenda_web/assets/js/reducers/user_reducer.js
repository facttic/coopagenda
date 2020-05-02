import * as types from "../actions/action_types";
import initialState from "./initial_state";

const userReducer = (state = initialState.user, action) => {
  switch (action.type) {
    case types.RECEIVE_USER:
      return {
        ...state,
        ...action.user,
        token: action.token,
        receivedAt: action.receivedAt,
        isFetching: false,
      };
    default:
      return state;
  }
};

export default userReducer;
