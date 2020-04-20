var db=require('../dbconnection');
var dashboard={
    countStudent:function(callback){
        //console.log(item);
        return db.query("SELECT COUNT(*) as cnt FROM student",callback);        
    },
    countFaculty:function(callback){
        return db.query("SELECT COUNT(*) as cnt  FROM faculty",callback);
    },
    countBatch:function(callback){
        return db.query("SELECT COUNT(*) as cnt FROM batch",callback);
    },
    countQuestion:function(callback){
        return db.query("SELECT COUNT(*) as cnt FROM questions",callback);
    },

    TotalFeesgetThisYear:function(callback){
        return db.query("SELECT SUM(Paid_amount)as total,MONTH(Date) MONTH, COUNT(*) COUNT FROM fees WHERE YEAR(Date)=YEAR(CURRENT_DATE) GROUP BY MONTH(Date)",callback);
    },
    TotalSalarypaidThisYear:function(callback){
        return db.query("SELECT SUM(Paid_amount)as total,MONTH(Date) MONTH, COUNT(*) COUNT FROM salary WHERE YEAR(Date)=YEAR(CURRENT_DATE) GROUP BY MONTH(Date)",callback)
    },
    TotalExamBymonth:function(callback){
        return db.query("SELECT MONTH(Date) MONTH, COUNT(*) COUNT FROM exam WHERE YEAR(Date)=YEAR(CURRENT_DATE) GROUP BY MONTH(Date)",callback)
    }
}
module.exports=dashboard;