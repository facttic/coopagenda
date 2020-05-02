import React from "react";
import { Navbar, Nav } from "react-bootstrap";

import Logo from "./Logo";
import ThirdPartyAuthList from "../Users/ThirdPartyAuthList";

const CANavbar = () => {
  return (
    <Navbar className="bg-light justify-content-between" expand="sm">
      <Logo />
      <Navbar.Toggle aria-controls="basic-navbar-nav" />
      <Navbar.Collapse id="basic-navbar-nav" className="justify-content-end">
        <Nav>
          <ThirdPartyAuthList />
        </Nav>
      </Navbar.Collapse>
    </Navbar>
  );
};

export default CANavbar;
