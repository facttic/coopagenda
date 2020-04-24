import React from "react";
import { withRouter } from "react-router-dom";
const queryString = require("query-string");

import LoadingFrame from "../Utils/LoadingFrame";
import { signIn } from "../../API/users";

const ThirdPartyCallback = ({ location }) => {
  console.log(queryString.parse(location.search));

  return <LoadingFrame title="Authenticating" />;
};

export default withRouter(ThirdPartyCallback);
