var question=require('../models/question_model');
var express=require('express');
var router=express.Router();

router.get('/:tag_id/:difficulty/:count/:limit',function(req,res,next){
    //console.log(req.params.tag_id,req.params.difficulty,req.params.count,req.params.limit);
    question.getQuestions(req.params.tag_id,req.params.difficulty,req.params.count,req.params.limit,function(err,rows){
        
        if(err)
        {
            res.json(err);
        }
        else
        {
            res.json(rows);
        }
    })
})

// router.get('/',function(req,res,next){
//     question.getAllQuestion(function(err,rows){
//         if(err)
//         {
//             res.json(err);
//         }
//         else
//         {
//             res.json(rows);
//         }
//     })
// })

router.post('/',function(req,res,next){
    console.log(req.body);
    
        question.addQuestion(req.body,function(err,rows){
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