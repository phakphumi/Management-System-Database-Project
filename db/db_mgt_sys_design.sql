-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2017 at 05:47 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mgt_sys_design`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievement`
--

CREATE TABLE `achievement` (
  `acmID` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อรางวัลที่ได้',
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รายละเอียดของรางวัล',
  `year` int(11) NOT NULL COMMENT 'ปีที่ได้รับรางวัล'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `achievement`
--

INSERT INTO `achievement` (`acmID`, `name`, `description`, `year`) VALUES
(1, 'ชนะเลิศการแข่งเขียนโปรแกรมระดับโลก', 'การแข่งขันเขียนโปรแกรมเชิงอัลกอริทึมจัดโดย MIT', 2050);

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activityID` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อกิจกรรม',
  `belongTo` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'หน่วยงานที่จัดกิจกรรม',
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รายละเอียดกิจกรรม'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activityID`, `name`, `belongTo`, `description`) VALUES
(1, 'Chula Expo', 'Chulalongkorn', 'งานจัดแสดงเพื่อเฉลิมฉลองจุฬาฯ 100 ปี');

-- --------------------------------------------------------

--
-- Table structure for table `admission_activity`
--

CREATE TABLE `admission_activity` (
  `studentID` int(11) NOT NULL,
  `activityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admission_activity`
--

INSERT INTO `admission_activity` (`studentID`, `activityID`) VALUES
(57310127, 1);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CID` int(11) NOT NULL COMMENT 'รหัสวิชา',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อวิชา',
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รายละเอียดวิชา',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'หมวดวิชา',
  `credit` int(11) NOT NULL COMMENT 'หน่วยกิต'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CID`, `name`, `description`, `type`, `credit`) VALUES
(1, 'DB MGT SYS DESIGN', 'Design Database', 'บังคับ', 3),
(2, 'SA', 'System Analysis', 'บังคับ', 3);

-- --------------------------------------------------------

--
-- Table structure for table `discipline`
--

CREATE TABLE `discipline` (
  `EID` int(11) NOT NULL,
  `cause` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) NOT NULL,
  `date` date NOT NULL,
  `studentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discipline`
--

INSERT INTO `discipline` (`EID`, `cause`, `score`, `date`, `studentID`) VALUES
(1, 'แต่งกายผิดระเบียบ', -5, '2017-04-04', 57310127),
(2, 'ทุจริตการสอบ', -20, '2017-04-19', 57310127);

-- --------------------------------------------------------

--
-- Table structure for table `enrolled`
--

CREATE TABLE `enrolled` (
  `TID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `grade` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `attendance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `enrolled`
--

INSERT INTO `enrolled` (`TID`, `studentID`, `grade`, `attendance`) VALUES
(2, 57310127, 'A', 40),
(3, 57310127, 'C+', 2),
(4, 57310878, 'B+', 30);

-- --------------------------------------------------------

--
-- Table structure for table `grade_values`
--

CREATE TABLE `grade_values` (
  `grade` varchar(2) COLLATE utf8_bin NOT NULL,
  `value` decimal(2,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `grade_values`
--

INSERT INTO `grade_values` (`grade`, `value`) VALUES
('A', '4.0'),
('B', '3.0'),
('B+', '3.5'),
('C', '2.0'),
('C+', '2.5'),
('D', '1.0'),
('D+', '1.5'),
('F', '0.0');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `nationalID` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `instructorID` int(11) NOT NULL,
  `title` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`nationalID`, `instructorID`, `title`) VALUES
('1111111111111', 0, 'Prof.'),
('9999999999999', 2, 'Prof.');

-- --------------------------------------------------------

--
-- Table structure for table `intermission`
--

CREATE TABLE `intermission` (
  `intermID` int(11) NOT NULL,
  `type` enum('study-aboard','sick','personal-reason') COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `studentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `intermission`
--

INSERT INTO `intermission` (`intermID`, `type`, `note`, `begin`, `end`, `studentID`) VALUES
(1, 'sick', 'ตรวจหาเชื้อ HIV', '2017-04-21', '2017-05-11', 57310127),
(2, 'personal-reason', 'เกณฑ์หทาร', '2017-04-07', '2017-04-09', 57310127);

-- --------------------------------------------------------

--
-- Table structure for table `obtain`
--

CREATE TABLE `obtain` (
  `studentID` int(11) NOT NULL,
  `acmID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `obtain`
--

INSERT INTO `obtain` (`studentID`, `acmID`) VALUES
(57310127, 1);

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `organID` int(11) NOT NULL COMMENT 'รหัสประจำหน่วยงาน',
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อของหน่วยงาน',
  `country` enum('Thai','Upcountry') COLLATE utf8_unicode_ci NOT NULL COMMENT 'ประเทศที่หน่วยงานนั้นตั้งอยู๋',
  `phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'สถานที่',
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'อีเมล์สำหรับติดต่อบริษัท'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`organID`, `name`, `country`, `phone`, `location`, `email`) VALUES
(1, 'Agoda Service', 'Thai', '6622222222', 'Bangkok', 'agoda@agoda.com'),
(2, 'KBTG', 'Thai', '022222222', 'Bangkok', 'kbtg@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `nationalID` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci NOT NULL,
  `birthDate` date NOT NULL,
  `religion` enum('Buddhist','Christ','Islam','Others') COLLATE utf8_unicode_ci NOT NULL,
  `nationality` enum('Thai','Foreign') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `facebook` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `currentAddress` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `personal`
--

INSERT INTO `personal` (`nationalID`, `firstName`, `lastName`, `gender`, `birthDate`, `religion`, `nationality`, `email`, `facebook`, `currentAddress`, `phone`) VALUES
('1101402006095', 'Kosate', 'Limpongsa', 'female', '1996-07-18', 'Buddhist', 'Thai', 'kosatelim@gmail.com', 'https://www.facebook.com/neungkl', 'Korat', '0812332486'),
('1111111111111', 'Atiwong', 'Suchato', 'male', '1970-11-05', 'Buddhist', 'Thai', 'atiwong@gmail.com', 'https://www.facebook.com/atiwong', 'bangkok', '0888888888'),
('1234567890123', 'Pakpoom', 'Thaweesitthichat', 'male', '1995-04-23', 'Buddhist', 'Thai', 'pakpoom@gmail.com', 'https://www.facebook.com/pakpoom', 'Saraburi', '0876678776'),
('999999999', 'Wanpen', 'Jaidee', 'female', '2017-04-19', 'Buddhist', 'Thai', 'wanpen@gmail.com', 'https://www.facebook.com/wanpen', 'Bangkok', '0800000000'),
('9999999999999', 'Thuchchai', 'Jiamsorn', 'male', '1996-04-24', 'Others', 'Thai', 'naikiawa@gmail.com', 'https://www.facebook.com/milkyway', 'Chiang Mai', '0876678576');

-- --------------------------------------------------------

--
-- Table structure for table `principle`
--

CREATE TABLE `principle` (
  `nationalID` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `instructorID` int(11) NOT NULL,
  `section` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `principle`
--

INSERT INTO `principle` (`nationalID`, `instructorID`, `section`) VALUES
('1111111111111', 0, 'Head');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `programID` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `degree` enum('Bachelor','Master','Doctor') COLLATE utf8_unicode_ci NOT NULL,
  `courseLength` int(11) NOT NULL COMMENT 'ระยะเวลาการศึกษา',
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT 'คำอธิบายของหลักสูตร',
  `established` date NOT NULL COMMENT 'วันที่ร่างหลักสูตร',
  `firstUsed` date NOT NULL COMMENT 'วันที่หลักสูตรถูกใช้ครั้งแรก'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`programID`, `name`, `degree`, `courseLength`, `description`, `established`, `firstUsed`) VALUES
(1, 'Computer Engineering', 'Bachelor', 4, 'เรียนเกี่ยวกับวิศวฯคอม เพื่อเป็นวิศวฯคอม', '2017-04-01', '2017-04-02'),
(2, 'Computer Engineering', 'Master', 2, 'ปริญญาโทวิศวกรรมคอมพิวเตอร์', '2017-04-02', '2017-04-01'),
(3, 'Computer Science', 'Master', 2, 'ปริญญาโทวิทยาศาสตร์คอมพิวเตอร์', '2017-04-01', '2017-04-01'),
(4, 'Software Engineering', 'Master', 2, 'ปริญญาโทวิศวกรรมซอฟต์แวร์', '2017-04-01', '2017-04-30'),
(5, 'Computer Engineering', 'Doctor', 3, 'ปริญญาเอกวิศวกรรมคอมพิวเตอร์', '2017-04-30', '2017-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `research`
--

CREATE TABLE `research` (
  `instructorID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อหัวข้อวิจัย',
  `type` enum('comp-eng-project','thesis','dissertation') COLLATE utf8_unicode_ci NOT NULL COMMENT 'ประเภทของวิจัย',
  `field` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'เกี่ยวข้องกับสาขาวิชาใด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `research`
--

INSERT INTO `research` (`instructorID`, `studentID`, `name`, `type`, `field`) VALUES
(0, 57310127, 'ระบบตรวจจับลายมือ', 'comp-eng-project', 'Machine Learning, Computer Vision');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `nationalID` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `staffID` int(11) NOT NULL,
  `section` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`nationalID`, `staffID`, `section`) VALUES
('999999999', 0, 'ธุรการ');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `nationalID` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `studentID` int(11) NOT NULL,
  `instructorID` int(11) NOT NULL,
  `organID` int(11) NOT NULL,
  `programID` int(11) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `year` int(11) NOT NULL,
  `status` enum('on-studying','prohibition','retired','graduated','intermission-leave') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`nationalID`, `studentID`, `instructorID`, `organID`, `programID`, `start`, `end`, `year`, `status`) VALUES
('1101402006095', 57310127, 0, 1, 1, '2017-04-01', '2017-04-30', 2017, 'on-studying'),
('1234567890123', 57310878, 2, 2, 1, '2017-04-02', '2017-04-30', 2017, 'on-studying'),
('999999999', 55310505, 2, 1, 2, '2017-04-03', '2017-04-27', 2010, 'on-studying');

-- --------------------------------------------------------

--
-- Table structure for table `teach`
--

CREATE TABLE `teach` (
  `TID` int(11) NOT NULL,
  `instructorID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `term` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teach`
--

INSERT INTO `teach` (`TID`, `instructorID`, `CID`, `section`, `year`, `term`) VALUES
(2, 0, 1, 1, 2016, 2),
(3, 0, 1, 1, 2017, 2),
(4, 2, 2, 1, 2017, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievement`
--
ALTER TABLE `achievement`
  ADD PRIMARY KEY (`acmID`);

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activityID`);

--
-- Indexes for table `admission_activity`
--
ALTER TABLE `admission_activity`
  ADD UNIQUE KEY `studentID` (`studentID`,`activityID`),
  ADD KEY `activityID` (`activityID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `discipline`
--
ALTER TABLE `discipline`
  ADD PRIMARY KEY (`EID`),
  ADD UNIQUE KEY `EID` (`EID`,`studentID`),
  ADD KEY `studentID` (`studentID`);

--
-- Indexes for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD PRIMARY KEY (`TID`),
  ADD UNIQUE KEY `unique_index` (`TID`,`studentID`),
  ADD KEY `studentID` (`studentID`);

--
-- Indexes for table `grade_values`
--
ALTER TABLE `grade_values`
  ADD PRIMARY KEY (`grade`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`nationalID`),
  ADD UNIQUE KEY `instructorID` (`instructorID`);

--
-- Indexes for table `intermission`
--
ALTER TABLE `intermission`
  ADD PRIMARY KEY (`intermID`),
  ADD UNIQUE KEY `intermID` (`intermID`,`studentID`),
  ADD KEY `intermission_ibfk_1` (`studentID`);

--
-- Indexes for table `obtain`
--
ALTER TABLE `obtain`
  ADD UNIQUE KEY `studentID` (`studentID`,`acmID`),
  ADD KEY `acmID` (`acmID`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`organID`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`nationalID`);

--
-- Indexes for table `principle`
--
ALTER TABLE `principle`
  ADD PRIMARY KEY (`nationalID`),
  ADD UNIQUE KEY `instructorID` (`instructorID`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`programID`);

--
-- Indexes for table `research`
--
ALTER TABLE `research`
  ADD UNIQUE KEY `instructorID` (`instructorID`,`studentID`),
  ADD KEY `studentID` (`studentID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`nationalID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`nationalID`),
  ADD UNIQUE KEY `studentID` (`studentID`,`instructorID`,`organID`,`programID`),
  ADD KEY `instructorID` (`instructorID`),
  ADD KEY `organID` (`organID`),
  ADD KEY `programID` (`programID`);

--
-- Indexes for table `teach`
--
ALTER TABLE `teach`
  ADD PRIMARY KEY (`TID`),
  ADD UNIQUE KEY `instructorID` (`instructorID`,`CID`,`section`,`year`,`term`),
  ADD KEY `CID` (`CID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievement`
--
ALTER TABLE `achievement`
  MODIFY `acmID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสวิชา', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `discipline`
--
ALTER TABLE `discipline`
  MODIFY `EID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `intermission`
--
ALTER TABLE `intermission`
  MODIFY `intermID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `organID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสประจำหน่วยงาน', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `programID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `teach`
--
ALTER TABLE `teach`
  MODIFY `TID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admission_activity`
--
ALTER TABLE `admission_activity`
  ADD CONSTRAINT `admission_activity_ibfk_2` FOREIGN KEY (`activityID`) REFERENCES `activity` (`activityID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `admission_activity_ibfk_3` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `discipline`
--
ALTER TABLE `discipline`
  ADD CONSTRAINT `discipline_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`TID`) REFERENCES `teach` (`TID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `enrolled_ibfk_3` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`nationalID`) REFERENCES `personal` (`nationalID`) ON DELETE CASCADE;

--
-- Constraints for table `intermission`
--
ALTER TABLE `intermission`
  ADD CONSTRAINT `intermission_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `obtain`
--
ALTER TABLE `obtain`
  ADD CONSTRAINT `obtain_ibfk_2` FOREIGN KEY (`acmID`) REFERENCES `achievement` (`acmID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `obtain_ibfk_3` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `principle`
--
ALTER TABLE `principle`
  ADD CONSTRAINT `principle_ibfk_1` FOREIGN KEY (`nationalID`) REFERENCES `personal` (`nationalID`) ON DELETE CASCADE,
  ADD CONSTRAINT `principle_ibfk_2` FOREIGN KEY (`instructorID`) REFERENCES `instructor` (`instructorID`) ON DELETE CASCADE;

--
-- Constraints for table `research`
--
ALTER TABLE `research`
  ADD CONSTRAINT `research_ibfk_1` FOREIGN KEY (`instructorID`) REFERENCES `instructor` (`instructorID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `research_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`nationalID`) REFERENCES `personal` (`nationalID`) ON DELETE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`nationalID`) REFERENCES `personal` (`nationalID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`instructorID`) REFERENCES `instructor` (`instructorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`organID`) REFERENCES `organization` (`organID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `teach`
--
ALTER TABLE `teach`
  ADD CONSTRAINT `teach_ibfk_1` FOREIGN KEY (`instructorID`) REFERENCES `instructor` (`instructorID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `teach_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
