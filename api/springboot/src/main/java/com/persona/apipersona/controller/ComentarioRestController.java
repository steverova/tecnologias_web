package com.persona.apipersona.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.persona.apipersona.domain.Comentario;
import com.persona.apipersona.services.ComentarioServices;


@RestController
@RequestMapping("/api")
public class ComentarioRestController {

    @Autowired
    ComentarioServices services;

    @GetMapping("/comentarios")
    public List<Comentario> getPersons() {
        System.out.println("listando");
        return services.list();
    }

    @PostMapping(value = "/comentarios", consumes= "application/json")
    public boolean add(@RequestBody Comentario comentario) {
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyy-MM-dd HH:mm:ss");
        System.out.println(formatter.format(date));
        comentario.setFecha(formatter.format(date).toString());
        services.add(comentario);
        return true;
    }

    @DeleteMapping("/comentarios")
    public boolean delete(@RequestParam("id") int id) {
        System.out.println("obteniendo id: "+id);
        services.delete(id);
        return true;
    }

    @PutMapping("/comentarios")
    public boolean update(@RequestBody Comentario comentario) {
        System.out.println("\n\n\n###########ACTUALIZAR###############");
        System.out.println(comentario.toString());
        System.out.println("\n\n\n##########################");
        System.out.println("entro a editar");
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyy-MM-dd HH:mm:ss");
        System.out.println(formatter.format(date));
        comentario.setFecha(formatter.format(date).toString());

        services.add(comentario);
        return true;
    }

    @GetMapping("/comentarios/{id}")
    public Comentario getByid(@PathVariable("id") int id){
        System.out.println("obtener: "+id);
        return services.getbyid(id);

    }

}
