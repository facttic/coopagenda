import axios from "axios";

const APIURL = "http://localhost:4000";

export const getSlots = () => axios.get(`${APIURL}/slots`);
export const addSlot = (data) =>
  axios.post(`${APIURL}/api/slots`, data);
export const editSlot = (data) =>
  axios.put(`${APIURL}/api/slots/${data.id}`, data);
export const deleteSlot = (id) =>
  axios.delete(`${APIURL}/api/slots/${id}`);
