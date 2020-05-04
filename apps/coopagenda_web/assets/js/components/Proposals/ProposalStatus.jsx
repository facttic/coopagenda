import React from "react";
import { PropTypes } from "prop-types";

const ProposalStatus = ({ accepted }) => {
  return (
    <td className={accepted ? "text-success" : "text-secondary"}>
      {accepted ? "Aceptado" : "Pendiente"}
    </td>
  );
};

ProposalStatus.propTypes = {
  accepted: PropTypes.bool.isRequired,
};

export default ProposalStatus;
