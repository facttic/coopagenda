import * as types from "./action_types";
import { getAllSlots } from "../api/slots";

export const fetchSlots = () => {
  return (dispatch) => {
    dispatch(requestSlots());
    return getAllSlots()
      .then(({ data: response }) => {
        dispatch(receiveSlots(response.data));
      })
      .catch((error) => {
        throw error;
      });
  };
};

function requestSlots() {
  return {
    type: types.REQUEST_SLOTS,
  };
}

export const receiveSlots = (slots) => {
  return { type: types.RECEIVE_SLOTS, slots, receivedAt: Date.now() };
};
