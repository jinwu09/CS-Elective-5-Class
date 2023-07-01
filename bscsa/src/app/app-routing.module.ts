import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './components/login/login.component';
import { MainComponent } from './components/main/main.component';
import { MainNavComponent } from './main-nav/main-nav.component';

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'main', component: MainComponent },
  {
    path: 'main-test',
    component: MainNavComponent,
    children: [
      {
        path: '',
        loadChildren: () =>
          import('./main-nav/main-nav.module').then((m) => m.MainNavModule),
      },
    ],
  },
  { path: '', redirectTo: 'main-test', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
