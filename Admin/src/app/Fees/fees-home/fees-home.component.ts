import { Component, OnInit,ViewChild } from '@angular/core';
import { StudentService } from '../../services/student.service';
import { PageEvent, MatPaginator } from "@angular/material";
import { MatTableDataSource } from "@angular/material/table";
import { MatSort } from "@angular/material/sort";
import { SelectionModel } from "@angular/cdk/collections";
import { Router } from "@angular/router";
import {student_class} from "../../classes/student_class";
import { DeprecatedI18NPipesModule } from "@angular/common";



@Component({
  selector: 'app-fees-home',
  templateUrl: './fees-home.component.html',
  styleUrls: ['./fees-home.component.css']
})
export class FeesHomeComponent implements OnInit {

  Student_tbl_arr: student_class[] = [];
  Student_delarr: student_class[] = [];
  j: number;
  flag:boolean;
  i: number = 0;
  page_length = 100;
  pageSize = 10;
  Student_selection = new SelectionModel(true, []);

  Student_dataSource = new MatTableDataSource();
  @ViewChild(MatPaginator)
  paginator: MatPaginator;
  @ViewChild(MatSort)
  sort: MatSort;
  pageEvent: PageEvent;
  expandedElement;
  arr:number[]=[];
  displayedColumns: string[] = [
    "Name",
    "Email_id",
    "Batch_name",
    "PayFees"

  ];

role:number=0;
  constructor(private _ser:StudentService,private _router:Router) {
    this.role=parseInt(localStorage.getItem('faculty_type'));
   }

  ngOnInit() {
    console.log(this.role);
    this.flag=true;

    this.  Student_dataSource.paginator = this.paginator;
    this.  Student_dataSource.sort = this.sort;

    this._ser.getAllStudent().subscribe((data:any)=>{
      console.log(data);
      this.Student_tbl_arr=data;
      this.Student_dataSource.data=this.Student_tbl_arr;
      this.Student_dataSource.sort = this.sort;


    });

  }
  applyFilter(filterValue: string) {
    this.Student_dataSource.filter = filterValue.trim().toLowerCase();
    if(this.Student_dataSource.filteredData.length==0)
    {
      //console.log('in1');
      this.flag=false;
    }
    else
    {
      this.flag=true;
    }

  }

  pay_fees(arr){
    this._router.navigate(["/menu/update_fees", arr.Student_id]);
  }

}
