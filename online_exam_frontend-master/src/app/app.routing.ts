import { NgModule } from '@angular/core';
import { Routes, RouterModule, } from '@angular/router';

import { LoginComponent } from './login/login.component';
import { AvailableTestsComponent } from './available-tests/available-tests.component';
const routes: Routes = [
  {path:'',component:LoginComponent},
   {path:"availabletest",component:AvailableTestsComponent}
];

export const routing=RouterModule.forRoot(routes);
