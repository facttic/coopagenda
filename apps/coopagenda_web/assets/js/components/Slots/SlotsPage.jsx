import React from "react";
import { connect } from "react-redux";
import { PropTypes } from "prop-types";
import { Route } from "react-router-dom";

import * as actions from "../../actions/slot_actions";
import SlotList from "./SlotList";
import SlotPage from "./SlotPage";
import ProposalList from "../Proposals/ProposalList";

const SlotsPage = ({ slots, match }) => {
  return (
    <div>
      <h1>Slots</h1>
      <div>
        <SlotList slots={slots} match={match} />
      </div>
      <Route path={`${match.path}/:id`} component={SlotPage} />
    </div>
  );
};

SlotsPage.propTypes = {
  slots: PropTypes.array.isRequired,
  match: PropTypes.object,
};

const mapStateToPropos = ({ slots }, _ownProps) => {
  return {
    slots: slots.list,
  };
};

export default connect(mapStateToPropos)(SlotsPage);
