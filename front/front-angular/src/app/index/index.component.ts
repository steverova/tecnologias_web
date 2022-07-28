import { Component, OnInit } from '@angular/core';
import * as $ from 'jquery';
import Comentario from './comentario.model';
import { ComentarioService } from '../service/comentario.service';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css'],
})
export class IndexComponent implements OnInit {
  public listaComentarios: Array<Comentario>;
  // public comentario: Comentario;

  fcomentario = new FormGroup({
    nombre: new FormControl('',Validators.required),
    correo: new FormControl('',Validators.required),
    asunto: new FormControl('',Validators.required),
    comentario: new FormControl('',Validators.required),
  });

  constructor(private service: ComentarioService, private router: Router) {
    this.listaComentarios = [];
  }

  listComments() {
    this.service.list().subscribe((result) => {
      this.listaComentarios = result ? result.data : [];
      console.log('lista de comentarios');
      console.log(result);
    });
  }

  deleteComments(id: number) {
    Swal.fire({
      title: 'Estas seguro deseas eliminar el comentario?',
      showCancelButton: true,
      confirmButtonText: 'Aceptar',
      cancelButtonText: 'Cancelar',
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire('Comentario Eliminado', '', 'success');
        this.service.delete(id).subscribe((result) => {
          console.log(result.data);
          this.listComments();
        });
      } else if (result.isDenied) {
        Swal.fire('Changes are not saved', '', 'info');
      }
    });
  }

  addComments() {
    console.log('agregar comentario');
    console.log(this.fcomentario.value);

    this.service.add(this.fcomentario.value).subscribe((result) => {

      $('#formulario').css('display', 'none');
      $(this)
        .find($('.fa-solid'))
        .removeClass('fa-angle-up')
        .addClass('fa-angle-down');
      this.router.navigate(['listar']);
      Swal.fire('Comentario Agregado');
      this.cleanform();
      this.listComments();
    });
  }

  getbyid(id: number) {
    Swal.fire({
      title: 'Editar comentario?',
      showCancelButton: true,
      confirmButtonText: 'Si',
      cancelButtonText: 'No',
    }).then((result) => {
      if (result.isConfirmed) {
        this.service.getbyid(id).subscribe((result) => {
          console.log(result.data);
          this.service.comentario = result.data;
          this.router.navigate(['editar']);
        });
      } else if (result.isDenied) {
        Swal.fire('Changes are not saved', '', 'info');
      }
    });
  }

  cleanform() {
    this.fcomentario = new FormGroup({
      nombre: new FormControl(''),
      correo: new FormControl(''),
      asunto: new FormControl(''),
      comentario: new FormControl(''),
    });
  }

  openform() {
    var open = false;

    $('#btncomments').click(function () {
      console.log('click');
      open = !open;

      if (open) {
        $('#formulario').css('display', 'block');
        $(this)
          .find($('.fa-solid'))
          .removeClass('fa-angle-down')
          .addClass('fa-angle-up');
      } else {
        $('#formulario').css('display', 'none');
        $(this)
          .find($('.fa-solid'))
          .removeClass('fa-angle-up')
          .addClass('fa-angle-down');
      }
    });
  }

  ngOnInit(): void {
    this.openform();
    this.listComments();
  }
}
