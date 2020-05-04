import React from "react";
import { Table } from "react-bootstrap";
import { PropTypes } from "prop-types";
import { useTranslation } from "react-i18next";

import SlotRow from "./SlotRow";
import ProposalList from "../Proposals/ProposalList";

const SlotList = ({ slots, match }) => {
  const { t, i18n } = useTranslation();

  return slots.length ? (
    <>
      <Table borderless>
        <thead className="text-uppercase">
          <tr>
            <th>{t("agenda.date")}</th>
            <th>{t("agenda.time")}</th>
            <th>{t("agenda.event")}</th>
            <th>{t("agenda.description")}</th>
            <th>{t("agenda.host")}</th>
            <th>{t("agenda.hostCoop")}</th>
            <th>{t("agenda.status")}</th>
            <th />
          </tr>
        </thead>
        {/* Each Slot is nothing but a list of Proposals */}
        {slots.map((slot) => (
          <ProposalList slot={slot} key={slot.id} />
        ))}
      </Table>
    </>
  ) : (
    <div>Acá falta un componente de lista vacía</div>
  );
};

SlotList.propTypes = {
  slots: PropTypes.array.isRequired,
  match: PropTypes.object,
};

export default SlotList;
