import { NgModule } from '@angular/core';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatIconModule } from '@angular/material/icon';
import { MatListModule } from '@angular/material/list';
import { MainNavComponent } from './main-nav.component';
import { PayrollComponent } from './components/payroll/payroll.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { ProfileComponent } from './components/profile/profile.component';
import { MainNavRoutingModule } from './main-nav.routing';
import { CommonModule } from '@angular/common';

@NgModule({
  declarations: [
    MainNavComponent,
    PayrollComponent,
    DashboardComponent,
    ProfileComponent,
  ],
  imports: [
    MatToolbarModule,
    MatButtonModule,
    MatSidenavModule,
    MatIconModule,
    MatListModule,
    MainNavRoutingModule,
    CommonModule,
  ],
})
export class MainNavModule {}
