package com.persona.apipersona.InterfaceServices;

import java.util.LinkedList;
import java.util.List;

import com.persona.apipersona.domain.Comentario;

public interface IComentarioServices {

    public boolean add(Comentario comentario);
    public boolean delete(int id);
    public boolean update(int id);
    public List<Comentario> list();
    public Comentario getbyid(int id);
    
}
