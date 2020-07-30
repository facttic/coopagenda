import baseInstance from "./base_instance";

export const signIn = (provider, userParams) => baseInstance.post(`/auth/${provider}/signin`, userParams);
