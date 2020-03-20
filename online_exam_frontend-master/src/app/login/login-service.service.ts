import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders} from '@angular/common/http';
import { student_class } from "../classes/student_class";
import { exam_class } from "../classes/exam_class";

@Injectable({
  providedIn: 'root'
})
export class LoginServiceService {
  private url= 'http://localhost:3000/student_login/';
  private exam='http://localhost:3000/exambybatch/'

  constructor(private _http:HttpClient) { }
  log_in_stu(item)
  {
    let _abc=new HttpHeaders().set('Content-Type','application/json');
    let body=JSON.stringify(item);
    console.log(body);
    return this._http.post(this.url,body,{headers:_abc});
  }
  getstudentById(id)
  {
    return this._http.get(this.url+id);
  }
  getStudentExam(id)
  {
    return this._http.get(this.exam+id);
  }
}
