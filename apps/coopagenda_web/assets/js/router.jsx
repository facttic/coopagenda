import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import Layout from "./components/App/Layout";
import HomeAgenda from "./components/Agenda/HomeAgenda";
import ThirdPartyCallback from './components/Users/ThirdPartyCallback'

const CARouter = () => (
  <Router>
    <Layout>
      <Switch>
        <Route path="/auth/:provider/callback" component={ThirdPartyCallback} />
        <Route path="/">
          <h1>Home</h1>
        </Route>
      </Switch>
    </Layout>
  </Router>
);

export default CARouter;
