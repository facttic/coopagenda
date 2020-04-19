import axios from "axios";

import { Slot } from "../interfaces";
const APIURL = "http://localhost:3000";

export const getSlots = () => axios.get(`${APIURL}/slots`);
export const addSlot = (data: Slot) =>
  axios.post(`${APIURL}/slots`, data);
export const editSlot = (data: Slot) =>
  axios.put(`${APIURL}/slots/${data.id}`, data);
export const deleteSlot = (id: number) =>
  axios.delete(`${APIURL}/slots/${id}`);
