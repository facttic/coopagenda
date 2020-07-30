import React from "react";
import { PropTypes } from "prop-types";

const ProposalActions = ({ proposal }) => {
  return <td>Actions</td>;
};

ProposalActions.propTypes = {
  proposal: PropTypes.object.isRequired,
};

export default ProposalActions;
