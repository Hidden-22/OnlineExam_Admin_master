
var db=require('../dbconnection');
var Question={
    getQuestions(tag_id,difficulty,count,limit,callback){
       
        console.log(tag_id,difficulty,count,limit);
        let lim=Number(limit);
        return db.query("SELECT * FROM questions WHERE Tag_id=? and Difficulty=? and Count=? ORDER BY RAND() LIMIT ?",[tag_id,difficulty,count,lim],callback);
    },
    getAllQuestion(callback)
    {
        return db.query("Select * from questions",callback);
    },

    addQuestion(item,callback)
    {
        let x=Number(item.Count);
        let y=Number(item.subject_id);
  //      console.log(x);
//        console.log(item);
        console.log(item.subject_id);
        return db.query("insert into questions (subject_id,Tag_id,Difficulty,Question,Option1,Option2,Option3,Option4,Answer,Count) values (?,?,?,?,?,?,?,?,?,?)",[y,item.Tag_id,item.Difficulty,item.Question,item.Option1,item.Option2,item.Option3,item.Option4,item.Answer,item.count],callback);
    }


}
module.exports=Question;