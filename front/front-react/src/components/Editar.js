import "../public/css/Editar.css";
import React, { useEffect, useState } from "react";
import { Getbyid } from "../services/CommentServices";
import { ModelComentario } from "../models/Comentario";
import { useParams } from "react-router-dom";
import { updateComments } from "../services/CommentServices";
import {BrowserRouter as Router, Link} from 'react-router-dom';
import "../public/css/navbar.css";

function Editar() {
  const { id } = useParams();
  const [Comentario, setComentario] = useState(ModelComentario());

  useEffect(() => {
    Getbyid(id).then((result) => {
      setComentario(result[0]);
    });
  }, [id]);

  const handleChange = (event) => {
    const name = event.target.name;
    const value = event.target.value;
    setComentario({ ...Comentario, [name]: value });
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    updateComments(Comentario);
  };

  return (


    <React.Fragment>



    <div id="body-index" class="margin-top-3">
      <div class="center">
        <div class="card center">
          <div id="btncomments" class="button button-block button-pink" href="">
            Actualizar Comentario
          </div>
          <div id="formularioEdit" class="container margin-top-1">
            <form onSubmit={handleSubmit}>
              <input
                required
                hidden
                //placeholder="Ingrese su nombre"
                type="text"
                name="id"
                value={Comentario.id || ""}
                onChange={handleChange}
              />
              <label>Nombre</label>
              <input
                required
                //placeholder="Ingrese su nombre"
                type="text"
                name="nombre"
                value={Comentario.nombre || ""}
                onChange={handleChange}
              />
              <label>Correo</label>
              <input
                required
                type="text"
                name="correo"
                placeholder="Ingrese su correo"
                value={Comentario.correo || ""}
                onChange={handleChange}
              />
              <label>Asunto</label>
              <input
                required
                type="text"
                name="asunto"
                placeholder="Ingrese asunto"
                value={Comentario.asunto || ""}
                onChange={handleChange}
              />
              <label>Comentario</label>
              <input
                required
                type="text"
                name="comentario"
                placeholder="Comentario"
                value={Comentario.comentario || ""}
                onChange={handleChange}
              />
              <div>
              <Link to="/">
                <button
                  class="button button-orange margin-min"> <i class="fa-solid fa-angle-left"></i> Volver 
                </button> 
                </Link>
                <button
                  type="submit"
                  className="button button-blue margin-top-1 margin-bottom-3"
                >
                  Guardar <i class="fa-solid fa-floppy-disk"></i>
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    </React.Fragment>
  );
}

export default Editar;
