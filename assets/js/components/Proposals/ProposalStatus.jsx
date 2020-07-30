import React from "react";
import { PropTypes } from "prop-types";
import { useTranslation } from 'react-i18next';

const ProposalStatus = ({ accepted }) => {
  const { t, i18n } = useTranslation();

  return (
    <td className={accepted ? "text-success" : "text-secondary"}>
      {accepted ? t("status.accepted") : t("status.pending")}
    </td>
  );
};

ProposalStatus.propTypes = {
  accepted: PropTypes.bool.isRequired,
};

export default ProposalStatus;
