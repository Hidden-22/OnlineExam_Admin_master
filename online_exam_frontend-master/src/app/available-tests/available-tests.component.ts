import { Component, OnInit,Inject } from '@angular/core';
import { exam_class } from '../classes/exam_class';
import { student_class } from '../classes/student_class';
import { LoginServiceService } from '../login/login-service.service';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { AddquestionComponent } from '../addquestion/addquestion.component';
import { InstructionComponent } from '../instruction/instruction.component';

@Component({
  selector: 'app-available-tests',
  templateUrl: './available-tests.component.html',
  styleUrls: ['./available-tests.component.css']
})
export class AvailableTestsComponent implements OnInit {

  cards = [
    {
      title: 'Card Title 1',
      description: 'Some quick example text to build on the card title and make up the bulk of the card content',
      buttonText: 'Button',
      img: 'https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg'
    },
    {
      title: 'Card Title 2',
      description: 'Some quick example text to build on the card title and make up the bulk of the card content',
      buttonText: 'Button',
      img: 'https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg'
    },
    {
      title: 'Card Title 3',
      description: 'Some quick example text to build on the card title and make up the bulk of the card content',
      buttonText: 'Button',
      img: 'https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg'
    },
    {
      title: 'Card Title 4',
      description: 'Some quick example text to build on the card title and make up the bulk of the card content',
      buttonText: 'Button',
      img: 'https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg'
    },

  ];
  student_email:string="";
  Batch_no:number=0;
  exams:exam_class[];
  flag:number=0;
  constructor(private _ser:LoginServiceService,public dialog: MatDialog) {
    this.student_email=localStorage.getItem('email_id');
    console.log(this.student_email);

   }

  ngOnInit(): void {
    this._ser.getstudentById(this.student_email).subscribe((data:any)=>{
      console.log(data);
      this.Batch_no=data[0].Batch_no;
      this._ser.getStudentExam(this.Batch_no).subscribe((data:any)=>{
        console.log(data);
        this.exams=data;
        console.log(this.exams);
      })
    });
  }
  onclickexam(exam)
  {
    this.flag=1;
    const dialogRef = this.dialog.open(InstructionComponent, {
      width:"100%",

    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');

    });
    console.log(exam);
  }

}
