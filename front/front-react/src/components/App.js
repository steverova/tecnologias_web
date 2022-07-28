import "../public/css/App.css";
import "../public/css/navbar.css";
import React, { useEffect, useState } from "react";
import { addComments, getComments } from "../services/CommentServices";
import { ModelComentario } from "../models/Comentario";
import Swal from "sweetalert2";

function App() {
  const [datas, setData] = useState([]);

  const [Comentario, setComentario] = useState(ModelComentario());

  const handleSubmit = (event) => {
    event.preventDefault();
    addComments(Comentario);
  };

  useEffect(() => {
    getComments().then((datas) => {
      setData(datas);
    });
  }, []);

  useEffect(() => {
    var open = false;
    document.getElementById("btncomments").onclick = function () {
      open = !open;
      if (open) {
        document.getElementById("formulario").style.display = "block";
      } else {
        document.getElementById("formulario").style.display = "none";
      }
    };
  }, []);

  const handleChange = (event) => {
    const name = event.target.name;
    const value = event.target.value;
    setComentario({ ...Comentario, [name]: value });
  };

  const deleteAlert = (id) => {
    Swal.fire({
      title: "Estas seguro deseas eliminar el comentario?",
      showCancelButton: true,
      confirmButtonText: "Aceptar",
      cancelButtonText: "Cancelar",
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire('Eliminado Exitosamente')
       
        setTimeout(function(){
          window.location = `eliminar/${id}`;
       }, 2000)
 
      } else if (result.isDismissed) {
      }
      
    });
  };

  const editAlert = (id) => {
    Swal.fire({
      title: "Estas seguro deseas editar el comentario?",
      showCancelButton: true,
      confirmButtonText: "Aceptar",
      cancelButtonText: "Cancelar",
    }).then((result) => {
      if (result.isConfirmed) {
        window.location = `editar/${id}`;
      } else if (result.isDismissed) {
      }
    });
  };

  return (
    <React.Fragment>
      <div id="body-index" className=" box center">
        <div class="center">
          <div className="card center">
            <button
              id="btncomments"
              className="button button-block button-pink margin-top-1"
            >
              Nuevo <i className="fa-solid fa-angle-down"></i>
            </button>

            <div id="formulario" className="container">
              <h4>
                <b>Agregar nuevo comentario</b>
              </h4>

              <form onSubmit={handleSubmit}>
                <label>Nombre</label>
                <input
                  type="text"
                  name="nombre"
                  placeholder="Ingrese el nombre"
                  value={Comentario.nombre || ""}
                  onChange={handleChange}
                />
                <label>Correo</label>
                <input
                  type="emaila"
                  name="correo"
                  placeholder="Ingrese el correo "
                  value={Comentario.correo || ""}
                  onChange={handleChange}
                />
                <label>Asunto</label>
                <input
                  type="text"
                  name="asunto"
                  placeholder="Ingrese el asunto"
                  value={Comentario.asunto || ""}
                  onChange={handleChange}
                />
                <label>Comentario</label>
                <input
                  type="text"
                  name="comentario"
                  placeholder="Ingrese el comentario"
                  value={Comentario.comentario || ""}
                  onChange={handleChange}
                />
                <button
                  variant="success"
                  type="submit"
                  className="button button-blue margin-min"
                >
                  Guardar <i class="fa-solid fa-floppy-disk"></i>
                </button>
              </form>
            </div>
          </div>

          <table class="styled-table center margin-top">
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Asunto</th>
                <th>Comentario</th>
                <th>Fecha</th>
                <td>Editar</td>
                <td>Eliminar</td>
              </tr>
            </thead>
            <tbody>
              {datas.map((data) => (
                <tr key={data.id}>
                  <td>{data.nombre}</td>
                  <td>{data.correo}</td>
                  <td>{data.asunto}</td>
                  <td>{data.comentario}</td>
                  <td>{data.fecha}</td>
                  <td>
                    <button
                      className="link-button button button-pink"
                      onClick={() => editAlert(data.id)}
                    >
                      <i className="fa-solid fa-pen-to-square"></i>
                    </button>
                  </td>

                  <td>
                    <button
                      className="link-button button button-red"
                      onClick={() => deleteAlert(data.id)}
                    >
                      <i className="fa-solid fa-trash"></i>
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </React.Fragment>
  );
}

export default App;
