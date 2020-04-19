import React from "react";
import { Formik } from "formik";
import Form from "react-bootstrap/Form";
import Col from "react-bootstrap/Col";
import Button from "react-bootstrap/Button";
import * as yup from "yup";

import { addSlot, editSlot, getSlots } from "../api/slots";
import { Slot, SlotFormProps } from "../interfaces";

const schema = yup.object({
  begin: yup.date().required("Begin datetime is required"),
  duration: yup
    .number()
    .required("Duration is required")
    .min(0, "Durations cannot be below zero")
    .max(180, "Three hours is the max a slot can last"),
});

const SlotForm: React.FC<SlotFormProps> = ({
  edit,
  onSave,
  slot,
  onCancelAdd,
  onCancelEdit,
  slotsStore,
}: SlotFormProps) => {
  const handleSubmit = async (event: Slot) => {
    const isValid = await schema.validate(event);

    if (!isValid) {
      return;
    }
    if (!edit) {
      await addSlot(event);
    } else {
      await editSlot(event);
    }

    const response = await getSlots();
    slotsStore.setSlots(response.data);
    onSave();
  };

  return (
    <>
      <Formik
        validationSchema={schema}
        onSubmit={handleSubmit}
        initialValues={(slot || {}) as any}
      >
        {({
          handleSubmit,
          handleChange,
          handleBlur,
          values,
          touched,
          isInvalid,
          errors,
        }: any) => (
          <Form noValidate onSubmit={handleSubmit}>
            <Form.Row>
              <Form.Group as={Col} md="12" controlId="begin">
                <Form.Label>Begin</Form.Label>
                <Form.Control
                  type="datetime-local"
                  name="begin"
                  placeholder="First Name"
                  value={values.begin || ""}
                  onChange={handleChange}
                  isInvalid={touched.begin && errors.begin}
                />
                <Form.Control.Feedback type="invalid">
                  {errors.Begin}
                </Form.Control.Feedback>
              </Form.Group>
              <Form.Group as={Col} md="12" controlId="duration">
                <Form.Label>Duration</Form.Label>
                <Form.Control
                  type="number"
                  name="duration"
                  placeholder="Last Name"
                  value={values.duration || 0}
                  onChange={handleChange}
                  isInvalid={touched.firstName && errors.duration}
                />
                <Form.Control.Feedback type="invalid">
                  {errors.duration}
                </Form.Control.Feedback>
              </Form.Group>
            </Form.Row>
            <Button type="submit" style={{ marginRight: "10px" }}>
              Save
            </Button>
            {edit ? (
              <Button type="button" onClick={onCancelEdit}>
                Cancel
              </Button>
            ) : (
              <Button type="button" onClick={onCancelAdd}>
                Cancel
              </Button>
            )}
          </Form>
        )}
      </Formik>
    </>
  );
};

export default SlotForm;
