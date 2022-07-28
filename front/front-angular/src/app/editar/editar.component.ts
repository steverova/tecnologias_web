import { Component, OnInit } from '@angular/core';
import * as $ from 'jquery';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { ComentarioService } from '../service/comentario.service';
import { Router } from '@angular/router';
import swal from'sweetalert2';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-editar',
  templateUrl: './editar.component.html',
  styleUrls: ['./editar.component.css']
})
export class EditarComponent implements OnInit {

  fcomentario = new FormGroup({
    id: new FormControl('', Validators.required),
    nombre: new FormControl('',Validators.required),
    correo: new FormControl('',Validators.required),
    asunto: new FormControl('',Validators.required),
    comentario: new FormControl('',Validators.required),
  });

  constructor(private service: ComentarioService,private router: Router) {

  }

  updateComments(){


    Swal.fire({
      title: 'Actualizar comentario?',
      text: 'Estas seguro que deseas actualizar el comentario?',
      showCancelButton: true,
      confirmButtonText: 'Si',
      cancelButtonText:'No'
    }).then((result) => {
      if (result.isConfirmed) {
        console.log("Estas seguro que deseas actualizar el comentario?");
        console.log(this.fcomentario.value);
        this.service.update(this.fcomentario.value).subscribe((result) =>{
          console.log(result.data);
          Swal.fire('Comentario Actualizado', '', 'success');
          this.router.navigate(['listar']);
        });
      } else if (result.isDismissed) {
        this.router.navigate(['index']);
      }
    })
  }
  ngOnInit(): void {

    console.log("############");
    console.log(this.service.comentario);

    this.fcomentario.patchValue({
      id:this.service.comentario[0].id,
      nombre:this.service.comentario[0].nombre,
      correo: this.service.comentario[0].correo,
      asunto: this.service.comentario[0].asunto,
      comentario: this.service.comentario[0].comentario
    });
  }

}
