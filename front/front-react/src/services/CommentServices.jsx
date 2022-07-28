import axios from "axios";
import { useParams } from "react-router-dom";
import Swal from "sweetalert2";

export function addComments(comentario) {
  axios
    .post(`http://localhost:3000/api/comentarios`, comentario)
    .then((response) => console.log(response))
    .catch((error) => {
      console.error("There was an error!", error);
    });

  Swal.fire({
    title: "Comentario Agregado",
    confirmButtonText: "OK",
  }).then((result) => {
    if (result.isConfirmed) {
      window.location = "/";
    } else if (result.isDismissed) {
      window.location = "/";
    }
  });
}

export function updateComments(comentario) {
  axios
    .put(`http://localhost:3000/api/comentarios`, comentario)
    .then((response) => console.log(response))
    Swal.fire({
      title: "Comentario actualizado",
      confirmButtonText: "OK",
    }).then((result) => {
      if (result.isConfirmed) {
        window.location = "/";
      } else if (result.isDismissed) {
        window.location = "/";
      }
    })
    .catch((error) => {
      console.error("There was an error!", error);
    });
}

export async function getComments() {
  return axios.get(`http://localhost:3000/api/comentarios`).then((res) => {
    const response = res.data;
    return response.data;
  });
}

export function DeleteComments() {
  const { id } = useParams();
  axios
    .delete(`http://localhost:3000/api/comentarios/${id}`)
    .then(() => console.log("Eliminado exitosamente"), 
    (window.location = "/"))
    .catch((error) => {
      console.error("There was an error!", error);
    });
}

export function Getbyid(id) {
  return axios
    .get(`http://localhost:3000/api/comentarios/${id}`)
    .then((res) => {
      const response = res.data;
      return response.data;
    });
}
