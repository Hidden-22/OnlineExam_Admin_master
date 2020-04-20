-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 20, 2020 at 06:24 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE IF NOT EXISTS `announcement` (
  `Announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(20) NOT NULL,
  `Announcemnet` varchar(500) NOT NULL,
  `Date` date NOT NULL,
  `Batch_id` int(11) NOT NULL,
  PRIMARY KEY (`Announcement_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`Announcement_id`, `Title`, `Announcemnet`, `Date`, `Batch_id`) VALUES
(1, 'For All Batch', 'Today\'s Lectures Cancel due to covid-19', '2020-03-17', 2);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `Attendence_id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Student_id` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
CREATE TABLE IF NOT EXISTS `batch` (
  `Batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `Batch_name` varchar(10) NOT NULL,
  PRIMARY KEY (`Batch_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`Batch_id`, `Batch_name`) VALUES
(4, 'Batch_03'),
(2, 'batch_02'),
(3, 'CMAT'),
(5, 'Batch_04'),
(7, 'BATCH_05');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE IF NOT EXISTS `exam` (
  `Exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `Exam_name` varchar(20) NOT NULL,
  `Batch_id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Marks` int(11) NOT NULL,
  `Time` int(11) NOT NULL,
  `Faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`Exam_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`Exam_id`, `Exam_name`, `Batch_id`, `Date`, `Marks`, `Time`, `Faculty_id`) VALUES
(1, 'Exam_01', 1, '2019-03-09', 8, 5, 1),
(2, 'Exam_02', 1, '2020-03-09', 8, 2, 1),
(3, 'Exam_03', 1, '2020-03-14', 12, 1, 1),
(4, 'Exam_04', 2, '2020-03-14', 12, 3, 1),
(5, 'exam_05', 1, '2020-03-20', 8, 5, 1),
(6, 'exam_06', 2, '2020-03-20', 8, 5, 1),
(7, 'exam_10', 1, '2020-04-11', 8, 3, 1),
(8, 'exam_11', 1, '2020-04-11', 8, 1, 1),
(9, 'exam_12', 1, '2020-04-11', 8, 1, 1),
(10, 'exam_12', 1, '2020-04-11', 12, 1, 1),
(11, 'Exam_Cmat', 3, '2020-04-16', 16, 10, 1),
(12, 'Exam-Aptitude', 2, '2020-04-17', 16, 30, 1),
(15, 'Exam_Cmat3', 2, '2020-04-19', 24, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_tag`
--

DROP TABLE IF EXISTS `exam_tag`;
CREATE TABLE IF NOT EXISTS `exam_tag` (
  `Exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `Tag_id` int(11) NOT NULL,
  PRIMARY KEY (`Exam_id`),
  UNIQUE KEY `Exam_id` (`Exam_id`,`Tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_tag`
--

INSERT INTO `exam_tag` (`Exam_id`, `Tag_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE IF NOT EXISTS `faculty` (
  `Faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Mobile_no` varchar(10) NOT NULL,
  `Email_id` varchar(50) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Salary` int(11) NOT NULL,
  `Qualification` varchar(50) NOT NULL,
  `Role` int(11) NOT NULL,
  PRIMARY KEY (`Faculty_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`Faculty_id`, `Name`, `Mobile_no`, `Email_id`, `Password`, `Date_of_birth`, `Salary`, `Qualification`, `Role`) VALUES
(1, 'Raj', '8866697028', 'shahraj2399@gmail.com', 'raj@2399', '1994-03-10', 25000, 'BCA', 1),
(6, 'Daivik shah', '7896890067', 'shahdaivik@gmail.com', 'daivik123', '1996-04-01', 14000, 'Bcom', 3),
(5, 'Shah Raj Nikhilbhai', '7984689678', 'shahraj@gmail.com', 'raj123', '1993-03-19', 20000, 'BCA', 2),
(4, 'Jainam Shah', '8899889988', 'jainam@gamil.com', 'jainam@123', '1995-10-31', 22000, 'MCA', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
CREATE TABLE IF NOT EXISTS `fees` (
  `Transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_id` int(11) NOT NULL,
  `Paid_amount` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Transaction_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`Transaction_id`, `Student_id`, `Paid_amount`, `Date`) VALUES
(1, 1, 2000, '2020-03-18'),
(2, 1, 3000, '2020-03-09'),
(3, 6, 25000, '2020-04-17'),
(4, 1, 3000, '2020-04-17'),
(5, 1, 2000, '2020-04-17'),
(7, 5, 22000, '2020-04-19');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `Question_id` int(11) NOT NULL AUTO_INCREMENT,
  `Tag_id` int(11) NOT NULL,
  `Difficulty` int(11) NOT NULL,
  `Question` varchar(4000) NOT NULL,
  `Option1` varchar(100) NOT NULL,
  `Option2` varchar(100) NOT NULL,
  `Option3` varchar(100) NOT NULL,
  `Option4` varchar(100) NOT NULL,
  `Answer` varchar(100) NOT NULL,
  `Count` int(11) NOT NULL,
  `Faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`Question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`Question_id`, `Tag_id`, `Difficulty`, `Question`, `Option1`, `Option2`, `Option3`, `Option4`, `Answer`, `Count`, `Faculty_id`) VALUES
(1, 5, 1, 'Which of the following statements should be used to obtain a remainder after dividing 3.14 by 2.1 ?', 'rem = 3.14 % 2.1;', 'rem = modf(3.14, 2.1);', 'rem = fmod(3.14, 2.1);', 'Remainder cannot be obtain in floating point.', 'rem = fmod(3.14, 2.1);', 7, 4),
(2, 5, 2, 'What are the types of linkages?', 'Internal and External', 'External, Internal and None', 'External and None', 'Internal', 'External, Internal and None', 4, 1),
(3, 1, 3, 'Which of the following special symbol allowed in a variable name?', '* (asterisk)', '| (pipeline))', '- (hyphen)', '_ (underscore)', '_ (underscore)', 9, 5),
(4, 5, 2, 'Is there any difference between following declarations?\r\n1 :	extern int fun();\r\n2 :	int fun();', 'Both are identical', 'No difference, except extern int fun(); ', 'int fun(); is overrided with extern int fun();', 'None of these', 'No difference, except extern int fun(); ', 6, 5),
(5, 2, 1, 'Which of the following is the correct way to declare a pointer?', ' int *ptr', 'int ptr', ' int &ptr', 'All of the above', 'int *ptr', 4, 5),
(7, 7, 3, 'Mr. Thomas invested an amount of Rs. 13,900 divided in two different schemes A and B at the simple interest rate of 14% p.a. and 11% p.a. respectively. If the total amount of simple interest earned in 2 years be Rs. 3508, what was the amount invested in Scheme B?', '6400', '6450', '6500', '5600', '6400', 3, 5),
(8, 7, 2, 'A sum fetched a total simple interest of Rs. 4016.25 at the rate of 9 p.c.p.a. in 5 years. What is the sum?', 'Rs. 4462.50', 'Rs. 8032.50', 'Rs. 8900', 'Rs. 8925', 'Rs. 8925', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `question_paper`
--

DROP TABLE IF EXISTS `question_paper`;
CREATE TABLE IF NOT EXISTS `question_paper` (
  `Question_id` int(11) NOT NULL,
  `Exam_id` int(11) NOT NULL,
  PRIMARY KEY (`Question_id`,`Exam_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_paper`
--

INSERT INTO `question_paper` (`Question_id`, `Exam_id`) VALUES
(1, 1),
(1, 4),
(1, 7),
(1, 8),
(1, 10),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 3),
(3, 5),
(3, 6),
(3, 8),
(3, 10),
(3, 11),
(3, 12),
(3, 15),
(4, 2),
(4, 3),
(4, 4),
(4, 7),
(4, 9),
(4, 10),
(5, 11),
(5, 12),
(5, 15),
(7, 12),
(7, 15),
(8, 12),
(8, 15);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
CREATE TABLE IF NOT EXISTS `result` (
  `Student_exam_id` int(11) NOT NULL,
  `Obtained_Marks` int(11) NOT NULL,
  PRIMARY KEY (`Student_exam_id`,`Obtained_Marks`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`Student_exam_id`, `Obtained_Marks`) VALUES
(7, 8),
(85, 12),
(87, 8),
(89, 8),
(90, 8),
(91, 8),
(92, 8),
(93, 8),
(94, 8),
(95, 8),
(96, 0),
(97, 8),
(98, 8),
(104, 4),
(105, 0),
(106, 0),
(107, 8);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE IF NOT EXISTS `salary` (
  `Transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `Faculty_id` int(11) NOT NULL,
  `Paid_amount` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Transaction_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`Transaction_id`, `Faculty_id`, `Paid_amount`, `Date`) VALUES
(1, 1, 25000, '2020-04-18'),
(2, 1, 25000, '2020-03-12'),
(3, 6, 14000, '2020-04-18'),
(4, 5, 20000, '2020-04-18');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `Student_id` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(8) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Batch_no` int(11) NOT NULL,
  `Email_id` varchar(50) NOT NULL,
  `Phone_no` varchar(10) NOT NULL,
  `Last_name` varchar(20) NOT NULL,
  `Middle_name` varchar(20) NOT NULL,
  `Parent_name` varchar(50) NOT NULL,
  `Parent_mobile_no` varchar(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Fees` int(11) NOT NULL,
  `Joining_date` date NOT NULL,
  `Gender` varchar(6) NOT NULL,
  PRIMARY KEY (`Student_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_id`, `Password`, `Name`, `Batch_no`, `Email_id`, `Phone_no`, `Last_name`, `Middle_name`, `Parent_name`, `Parent_mobile_no`, `Address`, `Date_of_birth`, `Status`, `Fees`, `Joining_date`, `Gender`) VALUES
(1, 'deep9699', 'Deep', 3, 'deepbhavsar9@gmail.com', '8128240106', 'Bhavsar', 'Prakashbhai', 'Prakashbhai D. Bhavsar', '9879956568', '2/sur sangam society , paldi ahmedabad-380007', '1999-06-09', 1, 10000, '2020-04-19', 'Male'),
(6, 'raj123', 'Raj', 4, 'shahraj2399@gmail.com', '7984689678', 'Shah', 'Nikhilbhai', 'Nikhilbhai', '9429131736', '183/2196 Surya apartment naranpura', '1999-03-02', 1, 25000, '2020-04-17', 'Male'),
(5, 'daivik12', 'Daivik', 3, 'daivik@gmail.com', '8866697027', 'Shah', 'Ketan', 'Ketan ', '9988998899', 'Ranip', '1999-05-10', 1, 22000, '2020-04-17', 'Male'),
(7, 'rahi123', 'Rahi', 3, 'rahi2345@gmail.com', '7878789090', 'Shah', 'udaybhai', 'Uday', '9090786756', 'Paldi', '1998-04-16', 1, 32000, '2020-04-19', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `student_answer`
--

DROP TABLE IF EXISTS `student_answer`;
CREATE TABLE IF NOT EXISTS `student_answer` (
  `Student_exam_id` int(11) NOT NULL,
  `Question_id` int(11) NOT NULL,
  `Answer_id` varchar(100) NOT NULL,
  PRIMARY KEY (`Student_exam_id`,`Question_id`,`Answer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_answer`
--

INSERT INTO `student_answer` (`Student_exam_id`, `Question_id`, `Answer_id`) VALUES
(7, 2, 'External, Internal and None'),
(7, 4, 'No difference, except extern int fun(); '),
(85, 2, 'External, Internal and None'),
(85, 3, '_ (underscore)'),
(85, 4, 'No difference, except extern int fun(); '),
(87, 2, 'External, Internal and None'),
(87, 4, 'No difference, except extern int fun(); '),
(89, 2, 'External, Internal and None'),
(89, 3, '_ (underscore)'),
(90, 2, 'External, Internal and None'),
(90, 3, '_ (underscore)'),
(91, 2, 'External, Internal and None'),
(91, 3, '_ (underscore)'),
(92, 2, 'External, Internal and None'),
(92, 3, '_ (underscore)'),
(93, 2, 'External, Internal and None'),
(93, 3, '_ (underscore)'),
(94, 2, 'External, Internal and None'),
(94, 3, '_ (underscore)'),
(95, 2, 'External, Internal and None'),
(95, 3, '_ (underscore)'),
(97, 1, 'rem = fmod(3.14, 2.1);'),
(97, 3, '_ (underscore)'),
(98, 2, 'External, Internal and None'),
(98, 3, '_ (underscore)'),
(98, 4, 'None of these'),
(104, 1, 'rem = fmod(3.14, 2.1);'),
(106, 1, 'Remainder cannot be obtain in floating point.'),
(107, 1, 'rem = fmod(3.14, 2.1);'),
(107, 3, '_ (underscore)');

-- --------------------------------------------------------

--
-- Table structure for table `student_exam`
--

DROP TABLE IF EXISTS `student_exam`;
CREATE TABLE IF NOT EXISTS `student_exam` (
  `Student_exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_id` int(11) NOT NULL,
  `Exam_id` int(11) NOT NULL,
  PRIMARY KEY (`Student_exam_id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_exam`
--

INSERT INTO `student_exam` (`Student_exam_id`, `Student_id`, `Exam_id`) VALUES
(107, 1, 10),
(106, 1, 8),
(105, 1, 9),
(104, 1, 7),
(103, 1, 7),
(102, 1, 7),
(101, 1, 7),
(100, 1, 7),
(99, 1, 7),
(98, 1, 3),
(97, 1, 1),
(96, 1, 2),
(95, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `Subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Subject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`Subject_id`, `Name`) VALUES
(7, 'C++'),
(8, 'ENGLISH'),
(9, 'QUANT'),
(10, 'REASONING');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `Tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Subject_id` int(11) NOT NULL,
  PRIMARY KEY (`Tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`Tag_id`, `Name`, `Subject_id`) VALUES
(1, 'Declarations', 7),
(2, 'Pointer', 7),
(7, 'SimpleIntrest', 9),
(6, 'Profit-Loss', 9),
(8, 'Time and distance', 9);

-- --------------------------------------------------------

--
-- Table structure for table `to_do_list`
--

DROP TABLE IF EXISTS `to_do_list`;
CREATE TABLE IF NOT EXISTS `to_do_list` (
  `List_id` int(11) NOT NULL AUTO_INCREMENT,
  `Faculty_id` int(11) NOT NULL,
  `Topic` varchar(100) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`List_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `to_do_list`
--

INSERT INTO `to_do_list` (`List_id`, `Faculty_id`, `Topic`, `Status`) VALUES
(1, 5, 'C++ Test paper', 1),
(2, 4, 'English extra lecture', 1),
(3, 5, 'Extra lecture on today', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
