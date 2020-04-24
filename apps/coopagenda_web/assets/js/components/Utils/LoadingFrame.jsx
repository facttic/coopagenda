import React from "react";
import PropTypes from "prop-types";
import classNames from "classnames";

const LoadingFrame = ({ title, size = "large" }) => {
  return (
    <div className={classNames("loading-frame", `is-${size}`)}>
      <div className="spinner" />
      <div className="title">{title}...</div>
    </div>
  );
};

LoadingFrame.propTypes = {
  size: PropTypes.oneOf(["small", "medium", "large"]),
  title: PropTypes.string,
};

export default LoadingFrame;
