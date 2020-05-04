import React from "react";
import { Link } from "react-router-dom";
import { PropTypes } from "prop-types";
import { Table } from "react-bootstrap";
import ProposalActions from "./ProposalActions";
import SlotDateLabel from "../Slots/SlotDateLabel";
import SlotTimeLabel from "../Slots/SlotTimeLabel";

const EmptyProposalRow = ({ slot }) => {
  const { begin, duration } = slot;

  return (
    <tr>
      <SlotDateLabel begin={begin}/>
      <SlotTimeLabel begin={begin} duration={duration} />
      <td colSpan={6}>There are not proposals for this slot</td>
    </tr>
  );
};

EmptyProposalRow.propTypes = {
  slot: PropTypes.object.isRequired,
};

export default EmptyProposalRow;
