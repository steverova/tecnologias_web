import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EditarComponent } from './editar/editar.component';
import { IndexComponent } from './index/index.component';

const routes: Routes = [
  {path:"listar", component: IndexComponent},
  { path:"editar", component: EditarComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
