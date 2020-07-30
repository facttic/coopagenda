import React from "react";
import PropTypes from "prop-types";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const RawIcon = ({ icon }) => <FontAwesomeIcon icon={icon} />;

RawIcon.propTypes = {
  icon: PropTypes.array.isRequired,
};

export default RawIcon;
