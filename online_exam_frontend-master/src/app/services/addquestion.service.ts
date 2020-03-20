import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders} from '@angular/common/http';
import { questions_class } from "../classes/questions_class";
@Injectable({
  providedIn: 'root'
})
export class AddquestionService {
  private url= 'http://localhost:3000/question';

  constructor(private _http:HttpClient) { }

  addQuestion(item:questions_class){
    let _headers=new HttpHeaders().set('Content-Type','application/json');
    let body=JSON.stringify(item);
    return this._http.post(this.url,body,{headers:_headers});
}

}
