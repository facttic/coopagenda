import { FRONTEND_URL, GITHUB_APP_ID } from "../../config";
import queryString from "query-string";

export const githubAuthUrl = (callbackOptions) =>
  `https://github.com/login/oauth/authorize${queryString.stringify({
    client_id: GITHUB_APP_ID || "f811c60a9880278057ff",
    redirect_uri: `${FRONTEND_URL || "http://localhost:4000" }/auth/github/callback`,
    scope: "user",
    state: callbackOptions,
  })}`;
