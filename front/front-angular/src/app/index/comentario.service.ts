import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import Comentario from './comentario.model';


@Injectable({
  providedIn: 'root',
})
export class ComentarioService {
  
  constructor(private http: HttpClient) {
    
  }

   list() {
    const req = this.http.get<any>(
      'http://localhost:3000/api/comentarios'
    );
    return req;
  }

  delete(id:number){
    return this.http.delete<any>('http://localhost:3000/api/comentarios/'+id);
  }

  add(comentario:any){
    return this.http.post<any>('http://localhost:3000/api/comentarios',comentario);
  }

  getbyid(id:number){
    return this.http.get<any>('http://localhost:3000/api/comentarios/'+id);

  }

  update(comentario:any){
    return this.http.put<any>('http://localhost:3000/api/comentarios',comentario);
  }
}
