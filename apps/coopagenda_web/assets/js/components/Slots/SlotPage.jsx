import React from "react";
import PropTypes from "prop-types";
import { connect } from "react-redux";

import ProposalList from "../Proposals/ProposalList";

const SlotPage = ({ slot }) => {
  return (
    <div>
      <h1>{slot.id}</h1>
      <p>begin: {slot.begin}</p>
      <p>duration: {slot.duration}</p>
      <ProposalList proposals={slot.proposals} />
    </div>
  );
};

SlotPage.propTypes = {
  slot: PropTypes.object.isRequired,
};

function mapStateToProps({ slots }, { match }) {
  let slot = { begin: "", duration: "", proposals: [] };
  const { id: slotId } = match.params;
  if (slots.list.length > 0) {
    slot = Object.assign(
      {},
      slots.list.find((slot) => slot.id == slotId)
    );
  }
  return { slot: slot };
}

export default connect(mapStateToProps)(SlotPage);
