import React from "react";
import { PropTypes } from "prop-types";
import { Table } from "react-bootstrap";
import ProposalRow from "./ProposalRow";

const ProposalList = ({ slot }) => {
  return (
    <tbody className="border border-success rounded">
      {/* A Row for each proposal */}
      {slot.proposals.map((proposal) => (
        <ProposalRow slot={slot} proposal={proposal} key={proposal.id} />
      ))}
    </tbody>
  );
};

ProposalList.propTypes = {
  slot: PropTypes.object.isRequired,
};

export default ProposalList;
