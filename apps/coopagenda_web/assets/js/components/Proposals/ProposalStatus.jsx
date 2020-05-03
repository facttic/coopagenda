import React from "react";
import { PropTypes } from "prop-types";

const ProposalStatus = ({ proposal }) => {
  return <td>{proposal.accepted.toString()}</td>;
};

ProposalStatus.propTypes = {
  proposal: PropTypes.object.isRequired,
};

export default ProposalStatus;
