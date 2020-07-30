import * as types from "../actions/action_types";
import initialState from "./initial_state";

const slotReducer = (state = initialState.slots, action) => {
  switch (action.type) {
    case types.RECEIVE_SLOTS:
      return {
        ...state,
        isFetching: false,
        receivedAt: action.receivedAt,
        list: action.slots,
      };
    case types.REQUEST_SLOTS:
      return {
        ...state,
        isFetching: true,
      };
    default:
      return state;
  }
};

export default slotReducer;
