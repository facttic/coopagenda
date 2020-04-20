import React from "react";
import { Router, Route } from "react-router-dom";
import { createBrowserHistory as createHistory } from "history";
import Navbar from "react-bootstrap/Navbar";
import Nav from "react-bootstrap/Nav";

import HomePage from "./pages/HomePage";
import "./App.css";
const history = createHistory();

function App({ slotsStore }: any) {
  return (
    <div className="App">
      <Router history={history}>
        <Navbar bg="primary" expand="lg" variant="dark">
          <Navbar.Brand href="#home">Coopagenda</Navbar.Brand>
          <Navbar.Toggle aria-controls="basic-navbar-nav" />
          <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="mr-auto">
              <Nav.Link href="/">Home</Nav.Link>
              <Nav.Link href="/auth/github">Login with github</Nav.Link>
            </Nav>
          </Navbar.Collapse>
        </Navbar>
        <Route
          path="/"
          exact
          component={(props: any) => (
            <HomePage {...props} slotsStore={slotsStore} />
          )}
        />
      </Router>
    </div>
  );
}

export default App;
