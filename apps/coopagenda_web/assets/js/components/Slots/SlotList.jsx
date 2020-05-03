import React from "react";
import { Table } from "react-bootstrap";
import { PropTypes } from "prop-types";

import SlotRow from "./SlotRow";
import ProposalList from "../Proposals/ProposalList";

const SlotList = ({ slots, match }) => {
  return slots.length ? (
    <>
      <Table borderless>
        <thead className="text-uppercase">
          <tr>
            <th>Fecha</th>
            <th>Hora</th>
            <th>Evento</th>
            <th>Descripcion</th>
            <th>Host</th>
            <th>Host coop</th>
            <th>Estado</th>
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
