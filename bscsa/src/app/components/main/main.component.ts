import { Component } from '@angular/core';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.scss'],
})
export class MainComponent {
  fnames: string[] = ['albert', 'jlo', 'mark'];
  lnames: string[] = ['santos', 'alcantara', 'manuel'];
  age: number = 21;
  isShow: boolean = true;
}
