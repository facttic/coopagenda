import React from "react";

import ThirdPartyServiceButton from "./ThirdPartyServiceButton";
import { githubAuthUrl } from "../../lib/third_party_auth";
import { makeid } from "../../lib/random_string";

const ThirdPartyAuthList = () => (
  <div className="third-party-auth">
    <ThirdPartyServiceButton
      url={githubAuthUrl(makeid(16))}
      icon={["fab", "github"]}
      title="Login with github"
    />
  </div>
);

export default ThirdPartyAuthList;
