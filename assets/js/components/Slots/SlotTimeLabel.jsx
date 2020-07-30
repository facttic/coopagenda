import React from "react";
import { PropTypes } from "prop-types";
import moment from "moment";

const SlotTimeLabel = ({ begin, duration }) => {
  const mBegin = moment(begin);
  return <td>{mBegin.format("HH:mm")} - {mBegin.add(duration, "m").format("HH:mm")}</td>;
};

SlotTimeLabel.propTypes = {
  begin: PropTypes.string.isRequired,
  duration: PropTypes.number.isRequired,
};

export default SlotTimeLabel;
