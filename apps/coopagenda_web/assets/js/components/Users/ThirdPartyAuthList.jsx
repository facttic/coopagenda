import React from "react";

import ThirdPartyServiceButton from "./ThirdPartyServiceButton";
import { githubAuthUrl } from "../../lib/third_party_auth";

const ThirdPartyAuthList = () => (
  <div className="third-party-auth">
    <ThirdPartyServiceButton
      url={githubAuthUrl("asdasd")}
      icon={["fab", "github"]}
      title="Login with github"
    />
  </div>
);

export default ThirdPartyAuthList;
