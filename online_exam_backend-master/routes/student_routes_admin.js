var student=require('../models/student_model_admin')
var express=require('express');
var router=express.Router();

router.post('/',function(req,res,next){
    student.Studentlogin(req.body,function(err,rows){
        if(err)
        {
            res.json(err);
        }
        else
        {
            res.json(rows);
        }
    });
});

router.get('/',function(req,res,next){
    student.getstudentDetails(function(err,rows){
        if(err)
        {
            res.json(err);
        }
        else
        {
            res.json(rows);
        }
    });
});


module.exports=router;
