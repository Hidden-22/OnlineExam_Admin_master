var db=require('../dbconnection');

var exam={
    addExam(item,callback)
    {
        return db.query("insert into exam values (?,?,?,?)",[item.Exam_id,item.Batch_id,item.Date,item.Marks],callback);
    },
    getAllExam(callback)
    {
        return db.query("select * from exam",callback);
    },
    getExamByBatch(Batch_id,callback)
    {
        return db.query("select * from exam where Batch_id=?",[Batch_id],callback);
    }

}

module.exports=exam;