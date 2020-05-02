import React from "react";
import PropTypes from "prop-types";
import classNames from "classnames";

import RawIcon from "../Utils/RawIcon";

const ThirdPartyServiceButton = ({
  url,
  icon,
  className = "",
  newTab = false,
  title,
}) => (
  <a
    href={url}
    target={newTab ? "_BLANK" : ""}
    className={classNames(
      "icon is-large third-party-service-button",
      className
    )}
  >
    {title}&nbsp;
    <RawIcon icon={icon} />
  </a>
);

ThirdPartyServiceButton.propTypes = {
  url: PropTypes.string.isRequired,
  icon: PropTypes.array.isRequired,
  className: PropTypes.string,
  newTab: PropTypes.bool,
  title: PropTypes.string.isRequired,
};

export default ThirdPartyServiceButton;
