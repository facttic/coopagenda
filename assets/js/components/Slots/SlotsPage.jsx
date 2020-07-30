import React from "react";
import { connect } from "react-redux";
import { PropTypes } from "prop-types";
import { Route } from "react-router-dom";

import * as actions from "../../actions/slot_actions";
import SlotList from "./SlotList";
import SlotPage from "./SlotPage";

const SlotsPage = ({ slots, match }) => {
  return (
    <>
      <SlotList slots={slots} match={match} />
      <Route path={`${match.path}/:id`} component={SlotPage} />
    </>
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
