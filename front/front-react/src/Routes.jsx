import React from "react";
import {BrowserRouter as Router, Routes, Route} from "react-router-dom";
import App from "./components/App";
import Editar from "./components/Editar";
import { DeleteComments } from "./services/CommentServices";

export function Redirect() {
    
    return (
      <Router>
        <div>
          <Routes>
            <Route exact path="/" element={<App />} />
            <Route exact path="eliminar/:id" element={<DeleteComments />} />
            <Route exact path="editar/:id" element={<Editar />} />
          </Routes>
        </div>
      </Router>
    );
}

export default Redirect;