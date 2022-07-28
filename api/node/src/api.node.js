const express = require("express");
const bodyparser = require("body-parser");
const cors = require("cors");
const mysql = require("mysql2");
const app = express();

app.use(cors());
app.use(bodyparser.json());
app.use(express.json());
app.listen(3000, () => {
  console.log("Servidor NodeJS EJecutandose!!");
});

const pool = mysql.createPool({
  host: "208.109.41.231",
  user: "lavacash",
  password: "62!cEB%Dn95#",
  database: "db_lavacash",
  port: 3306,
  debug: false,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

pool.getConnection((error) => {
  if (error) throw error;
  console.log("Coneccion exitosa a la base de datos!");
});

app.get("/api/comentarios", (req, res) => {
  let qr = `select * from comentarios`;
  pool.query(qr, (err, data) => {
    if (err) {
      console.error(err);
    } else {
      console.log("Consultando todos registros!");
    }
    res.send({
      message: " GET - Consultando todos los comentarios.",
      data: data,
    });
  });
});

app.post("/api/comentarios", (req, res) => {
  let nombre = req.body.nombre;
  let correo = req.body.correo;
  let asunto = req.body.asunto;
  let comentario = req.body.comentario;

  let qr = `insert into comentarios (nombre,correo,asunto,comentario,fecha)
  values('${nombre}','${correo}','${asunto}','${comentario}',now())`;

  pool.query(qr, (err) => {
    if (err) {
      console.log(err, "Error al insertar en la base de datos");
    } else {
      console.log("POST - Objeto Agregado.");
    }
    res.send({
      message: "Comentario insertado.",
    });
  });
});

app.get("/api/comentarios/:id", (req, res) => {
  let id = req.params.id;
  let qr = `select * from comentarios where id = ${id}`;
  pool.query(qr, (err, data) => {
    if (!req.params.id) {
      return res.status(400).json({
        status_code: 0,
        error_msg: "Require Params Missing",
        message: err,
      });
    }
    if (data && data.length > 0) {
      res.status(200).json({
        status_code: 1,
        data: data,
      });
      console.log("GET-ID Obteniendo Registro ID: " + id);
    } else {
      res.status(200).json({
        status_code: 1,
        message: "sin resultados",
      });
      console.log("Registro no existente.");
    }
  });
});

app.put("/api/comentarios", (req, res) => {
  let id = req.body.id;
  let nombre = req.body.nombre;
  let correo = req.body.correo;
  let asunto = req.body.asunto;
  let comentario = req.body.comentario;

  let qr = `update comentarios set nombre = '${nombre}',correo = '${correo}',asunto = '${asunto}', comentario = '${comentario}', 
   fecha = now() where id = ${id}`;

  pool.query(qr, (err, result) => {
    if (err) {
      console.log(err, "Error al actualizar en la base de datos");
    } else {
      console.log("PUT - Registro Actualizado exitosamente.");
    }
    let text1 = "No se encontro el id solicitado";
    let text2 = "actualizado exitosamente";

    info(result, res, text1,text2);
  });
});

app.delete("/api/comentarios/:id", (req, res) => {
  let id = req.params.id;
  let qr = `delete from comentarios WHERE id = ${id};`;
  pool.query(qr, (err, result) => {
    if (err) {
      console.log(err, "Error al eliminar un usuario");
    } else {
      console.log(" DELETE - Registro Eliminado exitosamente.");
    }
    if (!req.params.id) {
      return res.status(400).json({
        status_code: 0,
        error_msg: "Require Params Missing",
        message: err,
      });
    }
    let text1 = "No se encontro el id solicitado";
    let text2 = "Eliminado exitosamente";

    info(result, res, text1,text2);
  });
});

function info(result, res, text1, text2){

  if (result.affectedRows === 0){
    res.status(200).json({
      status_code: 1,
      data: result,
      message: text1,
    });
    console.log(text1);
  }else{
    res.status(200).json({
      status_code: 1,
      data: result,
      message: text2
    });
    console.log(text2);
  }

}
