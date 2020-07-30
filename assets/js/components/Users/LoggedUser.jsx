import React from "react";
import { Nav, Image, NavDropdown } from "react-bootstrap";
import PropTypes from "prop-types";
import { connect } from "react-redux";

import { logout } from "../../actions/user_actions";
import { removeToken } from "../../api/base_instance";

const LoggedUser = ({ user, dispatch }) => {
  function handleLogout() {
    removeToken();
    dispatch(logout());
  }

  return (
    <span className="align-middle">
      <NavDropdown title={user.username} id="basic-nav-dropdown" className="d-inline-flex">
        <NavDropdown.Item onClick={handleLogout}>Logout</NavDropdown.Item>
      </NavDropdown>
      <Image
        src={user.avatar}
        roundedCircle
        width={25}
        height={25}
        alt="25x25"
      />
    </span>
  );
};

LoggedUser.propTypes = {
  user: PropTypes.object.isRequired,
  dispatch: PropTypes.func.isRequired,
};

export default connect()(LoggedUser);
