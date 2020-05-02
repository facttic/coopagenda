import axios from "axios";

let currentAuthToken = null;

export const setToken = (token) => {
  axios.defaults.headers.common["Authorization"] = `Bearer ${token}`;
};

export const removeToken = () => {
  axios.defaults.headers.common["Authorization"] = "";
};

export default axios.create({
  baseURL: "http://localhost:4000/api/",
});
