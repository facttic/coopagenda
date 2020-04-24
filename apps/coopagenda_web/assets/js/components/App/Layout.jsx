import React from "react";
import { Container } from "react-bootstrap";

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

export default Layout;
