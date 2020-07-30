import React, { useEffect } from "react";
import { connect } from "react-redux";
import { withRouter, useHistory } from "react-router-dom";
import PropTypes from "prop-types";
const queryString = require("query-string");

import { receiveUser } from "../../actions/user_actions";
import { setToken } from "../../api/base_instance";
import LoadingFrame from "../Utils/LoadingFrame";

const ThirdPartyCallback = ({ location, dispatch }) => {
  const history = useHistory();

  useEffect(() => {
    const runSignIn = () => {
      const { admin, token, userAvatar, username } = queryString.parse(
        location.search
      );
      setToken(token);

      dispatch(
        receiveUser(
          {
            username,
            avatar: userAvatar,
            email: "",
            provider: "github",
            admin,
          },
          token
        )
      );
      return history.push("/");
    };
    runSignIn();
  }, []);

  return <LoadingFrame title="Authenticating" />;
};

ThirdPartyCallback.propTypes = {
  location: PropTypes.object.isRequired,
  dispatch: PropTypes.func.isRequired,
};

export default withRouter(connect()(ThirdPartyCallback));
