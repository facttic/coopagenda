import React from "react";
import { Link } from "react-router-dom";
import { PropTypes } from "prop-types";
import { Table } from "react-bootstrap";
import ProposalStatus from "./ProposalStatus";
import ProposalActions from "./ProposalActions";
import SlotDateLabel from "../Slots/SlotDateLabel";
import SlotTimeLabel from "../Slots/SlotTimeLabel";

const ProposalRow = ({ slot, proposal }) => {
  const { id, title, details, hosted_by, hosting_coop, accepted } = proposal;
  const { begin, duration } = slot;

  return (
    <tr>
      <SlotDateLabel begin={begin}/>
      <SlotTimeLabel begin={begin} duration={duration} />
      <td>{title}</td>
      <td>{details}</td>
      <td>{hosted_by}</td>
      <td>{hosting_coop}</td>
      <ProposalStatus accepted={accepted} />
      <ProposalActions proposal={proposal} />
    </tr>
  );
};

ProposalRow.propTypes = {
  slot: PropTypes.object.isRequired,
  proposal: PropTypes.object.isRequired,
};

export default ProposalRow;
