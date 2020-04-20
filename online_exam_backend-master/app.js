var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var cors=require('cors');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var barchart1Router=require('./routes/barchart1_routes_admin');
var barchart2Router=require('./routes/barchat2_routes_admin');
var batchRouter = require('./routes/batch_routes_admin');
var subjectRouter = require('./routes/subject_routes_admin');
var tagRouter = require('./routes/tag_routes_admin');
var tagRouter1=require('./routes/tag_routes1_admin');
var todoRouter=require('./routes/todo_routes_admin');
var todo_delete_router=require('./routes/todo_del_routes_admin');
var questionRouter = require('./routes/question_router_admin');
var getallQuestionRouter=require('./routes/question_routes1_admin');
var getQuestionByFacultyRouter=require('./routes/questionByfaculty_routes_admin');
var examRouter = require('./routes/exam_routes_admin');
var questionPaperRouter = require('./routes/question_paper_routes_admin');
var student_exam = require('./routes/student_exam_routes_admin');
var student_answer = require('./routes/student_answer_routes_admin');
var student_login=require('./routes/student_routes_admin');
var student=require('./routes/student_routes1_admin');
var student_del=require('./routes/student_delete_routes_admin');
var exam_by_batch=require('./routes/exambyBatch_id_routes_admin');
var faculty_login=require('./routes/faculty_routes_admin');
var announcement=require('./routes/announce_routes_admin');
var announce_del=require('./routes/announcement_del_routes_admin');
var faculty=require('./routes/faculty_routes1_admin');
var faculty_del=require('./routes/faculty_delete_routes_admin');
var subject_delete=require('./routes/subject_delete_routes_admin');
var fees=require('./routes/fees_routes_admin');
var batch_delete=require('./routes/batch_del_routes_admin');
var question1=require('./routes/question_routes2_admin');
var transaction=require('./routes/transaction_routes_admin');
var salaryinfo_routes=require('./routes/salaryInfo_routes_admin');
var dashboardstudent=require('./routes/dashboard_student_routes_admin');
var dashboardquestion=require('./routes/dashboard_question_routes_admin');
var dashboardfaculty=require('./routes/dashboard_faculty_routes_admin');
var dashboardbatch=require('./routes/dashboard_batch_routes_admin');
var linechart=require('./routes/linechart_routes_admin');
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(cors());

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use('/linechart_admin',linechart);
app.use('/barchart1Router_admin',barchart1Router);
app.use('/barchart2Router_admin',barchart2Router);
app.use('/dashboardfaculty_admin',dashboardfaculty);
app.use('/dashboardquestion_admin',dashboardquestion);
app.use('/dashboardbatch_admin',dashboardbatch);
app.use('/dashboardstudent_admin',dashboardstudent);
app.use('/faculty_login_admin',faculty_login);
app.use('/transaction_admin',transaction);
app.use('/faculty_admin',faculty);
app.use('/salaryinfo_admin',salaryinfo_routes);
app.use('/faculty_del_admin',faculty_del);
app.use('/fees_admin',fees);
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/batch_admin',batchRouter);
app.use('/subject_admin',subjectRouter);
app.use('/subject_del_admin',subject_delete);
app.use('/batch_del_admin',batch_delete);
app.use('/tag_admin',tagRouter);
app.use('/tag1_admin',tagRouter1);
app.use('/todo_admin',todoRouter);
app.use('/todo_del_admin',todo_delete_router);
app.use('/question_admin',questionRouter);
app.use('/questionBank_admin',getallQuestionRouter);
app.use('/question1_admin',question1);
app.use('/facultyQuestions_admin',getQuestionByFacultyRouter)
app.use('/exam_admin',examRouter);
app.use('/question_paper_admin',questionPaperRouter);
app.use('/student_exam_admin',student_exam);
app.use('/student_answer_admin',student_answer);
app.use('/exambybatch_admin',exam_by_batch);
app.use('/student_login_admin',student_login);
app.use('/student_admin',student);
app.use('/student_del_admin',student_del);
app.use('/announcement_admin',announcement);
app.use('/announcement_del_admin',announce_del);
// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
