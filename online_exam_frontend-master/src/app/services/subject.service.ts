import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class SubjectService {
  private url= 'http://localhost:3000/subject';


  constructor(private _http:HttpClient) { }

  getAllSubject()
  {
    return this._http.get(this.url);
  }
}
