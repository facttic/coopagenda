import React from "react";
import { PropTypes } from "prop-types";
import moment from "moment";

const SlotDateLabel = ({ begin }) => {
  const mBegin = moment(begin);
  return (
    <td>
      {/* Could be {mBegin.format("DD MMM, ddd")} */}
      {mBegin.format("DD")} {mBegin.format("MMM, ddd")}
    </td>
  );
};

SlotDateLabel.propTypes = {
  begin: PropTypes.string.isRequired,
};

export default SlotDateLabel;
