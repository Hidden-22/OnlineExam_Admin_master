var db=require('../dbconnection');

var student_login={
    Studentlogin(item,callback)
    {
        return db.query("select * from student where Email_id=? and Password=?",[item.Email_id,item.Password],callback);
    }, 
    getStudentByEmailID(Email_id,callback)
    {
        return db.query("select * from student where Email_id=?",[Email_id],callback);
    }
}

module.exports=student_login;