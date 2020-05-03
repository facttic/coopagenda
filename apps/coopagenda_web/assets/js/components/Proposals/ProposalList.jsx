import React from "react";
import { Link } from "react-router-dom";
import { PropTypes } from "prop-types";
import { Table } from "react-bootstrap";

const ProposalList = ({ slot }) => {
  console.log(slot);
  return (
    <tbody className="border border-success rounded">
      {slot.proposals.map(
        ({ id, title, details, hosted_by, hosting_coop, accepted }) => {
          return (
            <tr key={id}>
              <td>{slot.begin}</td>
              <td>{slot.duration}</td>
              <td>{title}</td>
              <td>{details}</td>
              <td>{hosted_by}</td>
              <td>{hosting_coop}</td>
              <td>{accepted.toString()}</td>
              <td>Actions</td>
            </tr>
          );
        }
      )}
    </tbody>
  );
};

ProposalList.propTypes = {
  slot: PropTypes.object.isRequired,
};

export default ProposalList;
