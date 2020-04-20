import { Component, OnInit } from '@angular/core';
import { Router,ActivatedRoute} from "@angular/router";
import {fees_class} from "../../classes/fees_class";
import { FeesService } from "../../services/fees.service";
import { StudentService } from 'src/app/services/student.service';
import { BatchService } from 'src/app/Services/batch.service';
export interface PeriodicElement {
  transactionID: number;
  paymentDate:string;
  paymentAmount: number;
}

const ELEMENT_DATA: PeriodicElement[] = [
  {transactionID: 1, paymentDate: '12-6-2019', paymentAmount: 5000 },
  {transactionID: 2, paymentDate: '1-1-2020', paymentAmount: 3000},
  {transactionID: 3, paymentDate: '1-4-2020', paymentAmount: 2000}
];

@Component({
  selector: 'app-fees-pay',
  templateUrl: './fees-pay.component.html',
  styleUrls: ['./fees-pay.component.css']
})
export class FeesPayComponent implements OnInit {

  studentName:string = 'venish';
  studentId:number;
  studentCourse:string;
  totalFeeAmount: number;
  pendingFeeAmount: number;
  searchStudentFlag: boolean = true;
  feePaymentFlag:boolean = false;
  feelessFlag:boolean=true;
  Student_id:number;
  i:number=0;
  temp_fee:number=0;
  fees_details:fees_class[]=[];
  Feeamount:number=0;
  Name:string;
  Batch_no:number;
  Email_id:string;
  Phone_no:string;
  Last_name:string;
  Middle_name:string;
  Parent_name:string;
  Parent_mobile_no:string;
  Address:string;
  Date_of_birth:Date;
  Status:number=1;
  Fees:number;
  Batch_name:string;
  Joining_date:Date=new Date("12/12/1998");
  displayedColumns: string[] = ['transactionID', 'paymentDate', 'paymentAmount', 'action'];
  dataSource = ELEMENT_DATA;

  constructor(private batch_ser:BatchService,private stu:StudentService,private _act:ActivatedRoute,private _router:Router,private fees_ser:FeesService) { }


  ngOnInit(): void {


    this.Student_id = this._act.snapshot.params["Student_id"];
    this.stu.getStudentById(this.Student_id).subscribe((data:any)=>{
        console.log(data);
        this.totalFeeAmount=data[0].Fees;
        this.Name=data[0].Name;
        this.Phone_no=data[0].Phone_no;
        this.Email_id=data[0].Email_id;
        this.Joining_date=data[0].Joining_date;
        console.log(this.totalFeeAmount);
        this.Batch_no=data[0].Batch_no;
        console.log(this.Batch_no);
        this.batch_ser.getBatchById(this.Batch_no).subscribe((data:any)=>{
          this.Batch_name=data[0].Batch_name;
          console.log(data);
        })
        this.fees_ser.getDetailsbyStudentId(this.Student_id).subscribe((data:any)=>{
          console.log(data);
          if(data.length==0)
          {
            this.pendingFeeAmount=this.totalFeeAmount;
            console.log(this.pendingFeeAmount);
          }
          else if(data.length==1)
          {
            this.pendingFeeAmount=this.totalFeeAmount-data[0].Paid_amount;
          }
          else
          {
            this.fees_details=data;
            console.log(this.fees_details);
            for(this.i=0;this.i<data.length;this.i++)
            {
              this.temp_fee+=data[this.i].Paid_amount;
            }
            this.pendingFeeAmount=this.totalFeeAmount-this.temp_fee;
            console.log(this.pendingFeeAmount);
          }

          if(this.pendingFeeAmount<=0)
          {
            this.feelessFlag=false;
          }
          else
          {
            this.feelessFlag=true;
          }
       });

    });


  }
  searchStudent(){
    console.log('hiii');
  }
  showFeePaymentOption(){
    this.feePaymentFlag=true;
  }

  payfee()
  {
      console.log(this.Feeamount);

      if(this.Feeamount>this.pendingFeeAmount)
      {
        alert("Your Pending Fees is:"+this.pendingFeeAmount);
      }
      else if(this.Feeamount<1000)
      {
        alert("Minimum Fees Payment is 1000Rs");
      }
      else
      {
        this.fees_ser.addDetails(new fees_class(this.Student_id,this.Feeamount)).subscribe((data:any)=>{
          console.log(data);
          this._router.navigate(["menu/fees_home"]);
        })
      }

  }

  onclickCancle(){
    this._router.navigate(["menu/fees_home"]);

  }
}


