import React from "react";
import { PropTypes } from "prop-types";

const ProposalStatus = ({ accepted }) => {
  return <td>{accepted.toString()}</td>;
};

ProposalStatus.propTypes = {
  accepted: PropTypes.bool.isRequired,
};

export default ProposalStatus;
