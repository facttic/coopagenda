import React, { useEffect } from "react";
import { withRouter, useHistory } from "react-router-dom";
const queryString = require("query-string");

import LoadingFrame from "../Utils/LoadingFrame";
import { signIn } from "../../API/users";

const ThirdPartyCallback = ({ location }) => {
  const history = useHistory();

  useEffect(() => {
    const runSignIn = () => {
      const parsedQueryString = queryString.parse(location.search);
      // FILL STATE
      history.push("/");
    };
    runSignIn();
  }, []);

  return <LoadingFrame title="Authenticating" />;
};

export default withRouter(ThirdPartyCallback);
