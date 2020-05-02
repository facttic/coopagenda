import React from "react";
import { Link } from "react-router-dom";
import { PropTypes } from "prop-types";

const SlotList = ({ slots, match }) => {
  return (
    <ul>
      {slots.map((slot) => (
        <li key={slot.id}>
          <Link to={`${match.url}/${slot.id}`}>
            {slot.begin} -&gt; {slot.duration}
          </Link>
        </li>
      ))}
    </ul>
  );
};

SlotList.propTypes = {
  slots: PropTypes.array.isRequired,
  match: PropTypes.object,
};

export default SlotList;
