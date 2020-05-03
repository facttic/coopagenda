import React from "react";
import { Link } from "react-router-dom";
import { Table } from "react-bootstrap";
import { PropTypes } from "prop-types";

const SlotRow = ({ slot, match }) => {
  <Table responsive borderless>
    <Link to={`${match.url}/${slot.id}`}>
      {slot.begin} -&gt; {slot.duration}
    </Link>
  </Table>;
};

SlotRow.propTypes = {
  slot: PropTypes.object.isRequired,
  match: PropTypes.object,
};

export default SlotRow;
