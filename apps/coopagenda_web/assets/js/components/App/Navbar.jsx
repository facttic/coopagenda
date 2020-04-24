import React from "react";
import { Navbar, Nav } from "react-bootstrap";

import Logo from "./Logo";
import ThirdPartyAuthList from "../Users/ThirdPartyAuthList";

const CANavbar = () => {
  return (
    <Navbar bg="secondary" expand="lg" variant="dark">
      <Logo />
      <Navbar.Toggle aria-controls="basic-navbar-nav" />
      <Navbar.Collapse id="basic-navbar-nav">
        <Nav>
          <ThirdPartyAuthList />
        </Nav>
      </Navbar.Collapse>
    </Navbar>
  );
};

export default CANavbar;
