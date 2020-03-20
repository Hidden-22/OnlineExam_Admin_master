var exam=require('../models/exam_model');
var express=require('express');
var router=express.Router();

router.post('/',function(req,res,next){
    console.log(req.body);
    exam.addExam(req.body,function(err,rows){
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
    exam.getAllExam(function(err,rows){
        if(err)
        {
            res.json(err);
        }
        else
        {
            res.json(rows);
        }
    });

    
})

module.exports=router;