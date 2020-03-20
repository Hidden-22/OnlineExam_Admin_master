var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var cors=require('cors');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var batchRouter = require('./routes/batch_routes');
var subjectRouter = require('./routes/subject_routes');
var tagRouter = require('./routes/tag_routes');
var questionRouter = require('./routes/question_router');
var examRouter = require('./routes/exam_routes');
var questionPaperRouter = require('./routes/question_paper_routes');
var student_exam = require('./routes/student_exam_routes');
var student_answer = require('./routes/student_answer_routes');
var student_login=require('./routes/student_routes');
var exam_by_batch=require('./routes/exambyBatch_id_routes');

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

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/batch',batchRouter);
app.use('/subject',subjectRouter);
app.use('/tag',tagRouter);
app.use('/question',questionRouter);
app.use('/exam',examRouter);
app.use('/question_paper',questionPaperRouter);
app.use('/student_exam',student_exam);
app.use('/student_answer',student_answer);
app.use('/exambybatch',exam_by_batch);
app.use('/student_login',student_login);

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
