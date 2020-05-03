import React from "react";
import { Navbar, Nav, Image } from "react-bootstrap";
import PropTypes from "prop-types";
import { connect } from "react-redux";

import Logo from "./Logo";
import ThirdPartyAuthList from "../Users/ThirdPartyAuthList";
import LoggedUser from "../Users/LoggedUser";

const CANavbar = ({ user }) => {
  return (
    <Navbar className="bg-light justify-content-between">
      <Logo />
      <Navbar.Toggle aria-controls="basic-navbar-nav" />
      <Navbar.Collapse id="basic-navbar-nav" className="justify-content-end">
        <Nav>
          {user.receivedAt ? (
            <LoggedUser user={user} />
          ) : (
            <ThirdPartyAuthList />
          )}
        </Nav>
      </Navbar.Collapse>
    </Navbar>
  );
};

CANavbar.propTypes = {
  user: PropTypes.object.isRequired,
};

function mapStateToProps({ user }) {
  return { user };
}

export default connect(mapStateToProps)(CANavbar);
