import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class DataService {
  apiURL: string = 'https://jsonplaceholder.typicode.com/';
  constructor(private http: HttpClient) {
    console.log('data service is working');
  }
  request(api: string, params: string, payload: any): any {
    return this.http.get(this.apiURL + api);
  }
}
