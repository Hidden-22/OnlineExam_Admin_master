var exam=require('../models/exam_model')
var express=require('express');
var router=express.Router();


router.get('/:Batch_id',function(req,res,next){
    exam.getExamByBatch(req.params.Batch_id,function(err,rows){
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
