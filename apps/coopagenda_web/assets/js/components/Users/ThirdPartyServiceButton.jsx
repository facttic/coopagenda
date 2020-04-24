import React from "react";
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

export default ThirdPartyServiceButton;
