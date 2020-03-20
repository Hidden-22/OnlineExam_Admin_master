-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 11, 2020 at 10:28 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_exam_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE IF NOT EXISTS `announcement` (
  `Announcement_id` int(11) NOT NULL,
  `Title` varchar(20) NOT NULL,
  `Announcemnet` varchar(500) NOT NULL,
  `Date` date NOT NULL,
  `Batch_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `Batch_id` int(11) NOT NULL,
  `Batch_name` varchar(10) NOT NULL,
  PRIMARY KEY (`Batch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`Batch_id`, `Batch_name`) VALUES
(1, 'batch_01'),
(2, 'batch_02');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE IF NOT EXISTS `exam` (
  `Exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `Batch_id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Marks` int(11) NOT NULL,
  `Time` time NOT NULL,
  `Faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`Exam_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`Exam_id`, `Batch_id`, `Date`, `Marks`, `Time`, `Faculty_id`) VALUES
(1, 1, '2020-03-09', 8, '00:00:00', 1),
(2, 1, '2020-03-09', 8, '00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_tag`
--

DROP TABLE IF EXISTS `exam_tag`;
CREATE TABLE IF NOT EXISTS `exam_tag` (
  `Exam_id` int(11) NOT NULL,
  `Tag_id` int(11) NOT NULL,
  UNIQUE KEY `Exam_id` (`Exam_id`,`Tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE IF NOT EXISTS `faculty` (
  `Faculty_id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Mobile_no` varchar(10) NOT NULL,
  `Email_id` varchar(50) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Salary` int(11) NOT NULL,
  `Qualification` varchar(50) NOT NULL,
  `Role` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
CREATE TABLE IF NOT EXISTS `fees` (
  `Transaction_id` int(11) NOT NULL,
  `Student_id` int(11) NOT NULL,
  `Paid_amount` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `Question_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `Tag_id` int(11) NOT NULL,
  `Difficulty` int(11) NOT NULL,
  `Question` varchar(200) NOT NULL,
  `Option1` varchar(100) NOT NULL,
  `Option2` varchar(100) NOT NULL,
  `Option3` varchar(100) NOT NULL,
  `Option4` varchar(100) NOT NULL,
  `Answer` varchar(100) NOT NULL,
  `Count` int(11) NOT NULL,
  PRIMARY KEY (`Question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`Question_id`, `subject_id`, `Tag_id`, `Difficulty`, `Question`, `Option1`, `Option2`, `Option3`, `Option4`, `Answer`, `Count`) VALUES
(1, 1, 1, 1, 'Which of the following statements should be used to obtain a remainder after dividing 3.14 by 2.1 ?', 'rem = 3.14 % 2.1;', 'rem = modf(3.14, 2.1);', 'rem = fmod(3.14, 2.1);', 'Remainder cannot be obtain in floating point.', 'rem = fmod(3.14, 2.1);', 0),
(2, 1, 1, 2, 'What are the types of linkages?', 'Internal and External', 'External, Internal and None', 'External and None', 'Internal', 'External, Internal and None', 0),
(3, 1, 1, 1, 'Which of the following special symbol allowed in a variable name?', '* (asterisk)', '| (pipeline)', '- (hyphen)', '_ (underscore)', '_ (underscore)', 0),
(4, 1, 1, 2, 'Is there any difference between following declarations?\r\n1 :	extern int fun();\r\n2 :	int fun();', 'Both are identical', 'No difference, except extern int fun(); ', 'int fun(); is overrided with extern int fun();', 'None of these', 'No difference, except extern int fun(); ', 0);

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
(2, 2),
(3, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
CREATE TABLE IF NOT EXISTS `result` (
  `Student_id` int(11) NOT NULL,
  `Exam_id` int(11) NOT NULL,
  `Obtained_Marks` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE IF NOT EXISTS `salary` (
  `Transaction_id` int(11) NOT NULL,
  `Faculty_id` int(11) NOT NULL,
  `Paid_amount` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `Student_id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Batch_no` int(11) NOT NULL,
  `Email_id` varchar(50) NOT NULL,
  `Phone_no` varchar(10) NOT NULL,
  `Last_nam` varchar(20) NOT NULL,
  `Middle_nane` varchar(20) NOT NULL,
  `Parent_name` varchar(50) NOT NULL,
  `Parent_mobile_no` varchar(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Fees` int(11) NOT NULL,
  `Joining_date` date NOT NULL,
  PRIMARY KEY (`Student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_answer`
--

DROP TABLE IF EXISTS `student_answer`;
CREATE TABLE IF NOT EXISTS `student_answer` (
  `Student_id` int(11) NOT NULL,
  `Question_id` int(11) NOT NULL,
  `Answer_id` int(11) NOT NULL,
  PRIMARY KEY (`Student_id`,`Question_id`,`Answer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_answer`
--

INSERT INTO `student_answer` (`Student_id`, `Question_id`, `Answer_id`) VALUES
(2, 2, 2);

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_exam`
--

INSERT INTO `student_exam` (`Student_exam_id`, `Student_id`, `Exam_id`) VALUES
(1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `Subject_id` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`Subject_id`, `Name`) VALUES
(1, 'C'),
(2, 'Maths'),
(3, 'Quant');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `Tag_id` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Subject_id` int(11) NOT NULL,
  PRIMARY KEY (`Tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`Tag_id`, `Name`, `Subject_id`) VALUES
(1, 'Declaration', 1),
(2, 'Pointer', 1),
(3, 'Profit-Loss', 3);

-- --------------------------------------------------------

--
-- Table structure for table `to_do_list`
--

DROP TABLE IF EXISTS `to_do_list`;
CREATE TABLE IF NOT EXISTS `to_do_list` (
  `List_id` int(11) NOT NULL,
  `Faculty_id` int(11) NOT NULL,
  `Topic` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
