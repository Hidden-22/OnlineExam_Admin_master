import { Component, OnInit } from '@angular/core';
import { student_class } from "../classes/student_class";
import { exam_class } from "../classes/exam_class";
import { login_class } from "../classes/login_class";
import { LoginServiceService } from './login-service.service';

import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  flag:boolean=true;
  email_id1:string;
  password1:string="";
  form: FormGroup;
  public loginInvalid: boolean;
  private formSubmitAttempt: boolean;
  private returnUrl: string;


  formGroup: FormGroup;
  titleAlert: string = 'This field is required';
  post: any = '';


  constructor(private fb: FormBuilder,private formBuilder: FormBuilder,private _ser:LoginServiceService,private _router:Router,private _act:ActivatedRoute) { }


  onclickforget()
  {
    console.log('he');

  }







  onSubmit() {
    this.loginInvalid = false;
    this.formSubmitAttempt = false;
    if (this.form.valid) {

        const username = this.form.get('username').value;
        const password = this.form.get('password').value;
   //     await this.authService.login(username, password);
   this._ser.log_in_stu(new login_class(username,password)).subscribe(
    (data:any[])=>
    {
        console.log(data);
        if(data.length==1)
        {
          //console.log(this.email_id1);
          localStorage.setItem('email_id',username);

           // localStorage.setItem('emp_type',data[0].Employee_type);
            this._router.navigate(['availabletest']);
        }
        else
        {
          alert('Email_id or Password Incorrect');
        }

    }
  );

    }
else{
    alert('Please Enter Valid Detalis');
}

  }
  ngOnInit(): void {

    this.form = this.fb.group({
      username: ['', Validators.email],
      password: ['', Validators.required]
    });
  }

}
