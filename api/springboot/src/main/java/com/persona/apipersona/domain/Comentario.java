package com.persona.apipersona.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "comentarios")
public class Comentario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nombre;
    private String correo;
    private String asunto;
    private String comentario;
    private String fecha;

    public Comentario() {
    }

    public Comentario(int id, String nombre, String correo, String asunto, String comentario, String fecha) {
        this.id = id;
        this.nombre = nombre;
        this.correo = correo;
        this.asunto = asunto;
        this.comentario = comentario;
        this.fecha = fecha;
    }
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getCorreo() {
        return correo;
    }
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public String getAsunto() {
        return asunto;
    }
    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }
    public String getComentario() {
        return comentario;
    }
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
    public String getFecha() {
        return fecha;
    }
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "Comentario [asunto=" + asunto + ", comentario=" + comentario + ", correo=" + correo + ", fecha=" + fecha
                + ", id=" + id + ", nombre=" + nombre + "]";
    }

    

    

    
}
