import React from "react";
import { PropTypes } from "prop-types";

const ProposalList = ({ proposals }) => {
  return (
    <div>
      <h3>Propuestas</h3>
      <ul>
        {proposals.map((proposal) => (
          <li key={proposal.id}>{proposal.title}</li>
        ))}
      </ul>
    </div>
  );
};

ProposalList.propTypes = {
  proposals: PropTypes.array.isRequired,
};

export default ProposalList;
