import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import Layout from "./components/App/Layout";
import SlotsPage from "./components/Slots/SlotsPage";
import ThirdPartyCallback from "./components/Users/ThirdPartyCallback";

const CARouter = () => (
  <Router>
    <Layout>
      <Switch>
        <Route path="/welcome" component={ThirdPartyCallback} />
        <Route path="/" component={SlotsPage} />
      </Switch>
    </Layout>
  </Router>
);

export default CARouter;
