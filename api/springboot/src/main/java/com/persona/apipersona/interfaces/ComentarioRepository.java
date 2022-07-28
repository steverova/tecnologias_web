package com.persona.apipersona.interfaces;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.persona.apipersona.domain.Comentario;

@Repository
public interface ComentarioRepository extends CrudRepository<Comentario, Integer>{


}
