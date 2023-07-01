import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/service/data.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss'],
})
export class ProfileComponent implements OnInit {
  constructor(private ds: DataService) {}
  ngOnInit(): void {
    this.getUsers();
  }
  getUsers(): void {
    this.ds.request('users', '', null).subscribe((res: any) => {
      console.log(res);
    });
  }
}
