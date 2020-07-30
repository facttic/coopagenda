import React from "react";
import { Container } from "react-bootstrap";
import PropTypes from "prop-types";

import Navbar from "./Navbar";
import Sidebar from "./Sidebar";

const Layout = ({ children }) => {
  return (
    <Container fluid>
      <Navbar />
      <Sidebar />
      {children}
    </Container>
  );
};

Layout.propTypes = {
  children: PropTypes.node.isRequired,
};

export default Layout;
