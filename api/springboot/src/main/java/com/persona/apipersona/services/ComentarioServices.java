package com.persona.apipersona.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.persona.apipersona.InterfaceServices.IComentarioServices;
import com.persona.apipersona.domain.Comentario;
import com.persona.apipersona.interfaces.ComentarioRepository;

@Service
public class ComentarioServices implements IComentarioServices{

    @Autowired
    ComentarioRepository repo;

    @Override
    public boolean add(Comentario comentario) {
        boolean result = repo.save(comentario) != null;
        return result;
    }

    @Override
    public boolean delete(int id) {
        repo.deleteById(id);
        return true;
    }

    @Override
    public boolean update(int id) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public List<Comentario> list() {
        // TODO Auto-generated method stub
        return (List<Comentario>) repo.findAll();
    }

    @Override
    public Comentario getbyid(int id) {
        
        return repo.findById(id).get();
    }
    
}
