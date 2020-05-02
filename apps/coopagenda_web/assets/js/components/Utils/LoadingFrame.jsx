import React from "react";
import PropTypes from "prop-types";

const LoadingFrame = ({ title, size = "large" }) => {
  return (
    <div>{title}...</div>
  );
};

LoadingFrame.propTypes = {
  size: PropTypes.oneOf(["small", "medium", "large"]),
  title: PropTypes.string,
};

export default LoadingFrame;
