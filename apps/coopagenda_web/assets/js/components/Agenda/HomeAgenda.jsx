import React, { useState, useEffect } from "react";

import Table from "react-bootstrap/Table";
import ButtonToolbar from "react-bootstrap/ButtonToolbar";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";

import SlotForm from "../Slots/SlotForm";
import { getSlots, deleteSlot } from "../../api/slots";
import { observer } from "mobx-react";

const HomeAgenda = ({ slotsStore }) => {
  const [openAddModal, setOpenAddModal] = useState(false);
  const [openEditModal, setOpenEditModal] = useState(false);
  const [initialized, setInitialized] = useState(false);
  const [selectedSlot, setSelectedSlot] = useState({});

  const openModal = () => {
    setOpenAddModal(true);
  };
  const closeModal = () => {
    setOpenAddModal(false);
    setOpenEditModal(false);
    getData();
  };
  const cancelAddModal = () => {
    setOpenAddModal(false);
  };
  const editSlot = (slot) => {
    setSelectedSlot(slot);
    setOpenEditModal(true);
  };
  const cancelEditModal = () => {
    setOpenEditModal(false);
  };
  const getData = async () => {
    const response = await getSlots();
    slotsStore.setSlots(response.data);
    setInitialized(true);
  };
  const deleteSelectedSlot = async (id) => {
    await deleteSlot(id);
    getData();
  };

  useEffect(() => {
    if (!initialized) {
      getData();
    }
  });

  return (
    <div>
      <h1>Slots</h1>

      <Modal show={openAddModal} onHide={closeModal}>
        <Modal.Header closeButton>
          <Modal.Title>Add Slot</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <SlotForm
            edit={false}
            onSave={closeModal.bind(this)}
            onCancelAdd={cancelAddModal}
            slotsStore={slotsStore}
          />
        </Modal.Body>
      </Modal>
      <Modal show={openEditModal} onHide={closeModal}>
        <Modal.Header closeButton>
          <Modal.Title>Edit Slot</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <SlotForm
            edit={true}
            onSave={closeModal.bind(this)}
            slot={selectedSlot}
            onCancelEdit={cancelEditModal}
            slotsStore={slotsStore}
          />
        </Modal.Body>
      </Modal>
      <ButtonToolbar onClick={openModal}>
        <Button variant="outline-primary">Add Slot</Button>
      </ButtonToolbar>
      <br />

      <Table striped bordered hover>
        <thead>
          <tr>
            <th>Begin</th>
            <th>Duration</th>
          </tr>
        </thead>
        <tbody>
          {/* {slotsStore.slots.map((c: any) => (
            <tr key={c.id}>
              <td>{c.begin}</td>
              <td>{c.duration}</td>
              <td>
                <Button
                  variant="outline-primary"
                  onClick={editSlot.bind(this, c)}
                >
                  Edit
                </Button>
              </td>
              <td>
                <Button
                  variant="outline-primary"
                  onClick={deleteSelectedSlot.bind(this, c.id)}
                >
                  Delete
                </Button>
              </td>
            </tr>
          ))} */}
        </tbody>
      </Table>
    </div>
  );
};

export default observer(HomeAgenda);
