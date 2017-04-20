-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 20, 2017 at 11:14 PM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_mgt_sys_design`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievement`
--

CREATE TABLE IF NOT EXISTS `achievement` (
  `acmID` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อรางวัลที่ได้',
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รายละเอียดของรางวัล',
  `year` int(11) NOT NULL COMMENT 'ปีที่ได้รับรางวัล'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `activityID` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อกิจกรรม',
  `belongTo` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'หน่วยงานที่จัดกิจกรรม',
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รายละเอียดกิจกรรม'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admission_activity`
--

CREATE TABLE IF NOT EXISTS `admission_activity` (
  `studentID` int(11) NOT NULL,
  `activityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `CID` int(11) NOT NULL COMMENT 'รหัสวิชา',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อวิชา',
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รายละเอียดวิชา',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'หมวดวิชา',
  `credit` int(11) NOT NULL COMMENT 'หน่วยกิต'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discipline`
--

CREATE TABLE IF NOT EXISTS `discipline` (
  `EID` int(11) NOT NULL,
  `cause` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `studentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrolled`
--

CREATE TABLE IF NOT EXISTS `enrolled` (
  `TID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `grade` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `attendance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE IF NOT EXISTS `instructor` (
  `nationalID` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `instructorID` int(11) NOT NULL,
  `title` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `intermission`
--

CREATE TABLE IF NOT EXISTS `intermission` (
  `intermID` int(11) NOT NULL,
  `type` enum('study-aboard','sick','personal-reason') COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `studentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `obtain`
--

CREATE TABLE IF NOT EXISTS `obtain` (
  `studentID` int(11) NOT NULL,
  `acmID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE IF NOT EXISTS `organization` (
  `organID` int(11) NOT NULL COMMENT 'รหัสประจำหน่วยงาน',
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อของหน่วยงาน',
  `country` enum('Thai','Upcountry') COLLATE utf8_unicode_ci NOT NULL COMMENT 'ประเทศที่หน่วยงานนั้นตั้งอยู๋',
  `contact` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'เบอร์โทรการติดต่อหรือสถานที่'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
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

-- --------------------------------------------------------

--
-- Table structure for table `principle`
--

CREATE TABLE IF NOT EXISTS `principle` (
  `nationalID` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `instructorID` int(11) NOT NULL,
  `section` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE IF NOT EXISTS `program` (
  `programID` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `degree` enum('Bachelor','Master','Doctor') COLLATE utf8_unicode_ci NOT NULL,
  `courseLength` int(11) NOT NULL COMMENT 'ระยะเวลาการศึกษา',
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT 'คำอธิบายของหลักสูตร',
  `established` date NOT NULL COMMENT 'วันที่ร่างหลักสูตร',
  `firstUsed` date NOT NULL COMMENT 'วันที่หลักสูตรถูกใช้ครั้งแรก'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `research`
--

CREATE TABLE IF NOT EXISTS `research` (
  `RID` int(11) NOT NULL,
  `instructorID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อหัวข้อวิจัย',
  `type` enum('comp-eng-project','thesis','dissertation') COLLATE utf8_unicode_ci NOT NULL COMMENT 'ประเภทของวิจัย',
  `field` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'เกี่ยวข้องกับสาขาวิชาใด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `nationalID` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `staffID` int(11) NOT NULL,
  `section` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `nationalID` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `studentID` int(11) NOT NULL,
  `instructorID` int(11) NOT NULL COMMENT 'advisor',
  `organID` int(11) NOT NULL COMMENT 'internship company1',
  `programID` int(11) NOT NULL COMMENT 'study program',
  `start` date NOT NULL COMMENT 'intern start date',
  `end` date NOT NULL COMMENT 'intern end date',
  `year` int(11) NOT NULL COMMENT 'intern year',
  `status` enum('on-studying','prohibition','retired','graduated','intermission-leave') COLLATE utf8_unicode_ci NOT NULL COMMENT 'student status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teach`
--

CREATE TABLE IF NOT EXISTS `teach` (
  `TID` int(11) NOT NULL,
  `instructorID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `term` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  ADD UNIQUE KEY `studentID` (`studentID`);

--
-- Indexes for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD PRIMARY KEY (`TID`),
  ADD UNIQUE KEY `studentID` (`studentID`);

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
  ADD UNIQUE KEY `studentID` (`studentID`);

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
  ADD PRIMARY KEY (`RID`),
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
  ADD UNIQUE KEY `studentID` (`studentID`),
  ADD UNIQUE KEY `organID` (`organID`),
  ADD UNIQUE KEY `programID` (`programID`),
  ADD UNIQUE KEY `instructorID` (`instructorID`),
  ADD UNIQUE KEY `organID_2` (`organID`);

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
  MODIFY `acmID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activityID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสวิชา';
--
-- AUTO_INCREMENT for table `intermission`
--
ALTER TABLE `intermission`
  MODIFY `intermID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `organID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสประจำหน่วยงาน';
--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `programID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `research`
--
ALTER TABLE `research`
  MODIFY `RID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admission_activity`
--
ALTER TABLE `admission_activity`
  ADD CONSTRAINT `admission_activity_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `admission_activity_ibfk_2` FOREIGN KEY (`activityID`) REFERENCES `activity` (`activityID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `discipline`
--
ALTER TABLE `discipline`
  ADD CONSTRAINT `discipline_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`TID`) REFERENCES `teach` (`TID`);

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
  ADD CONSTRAINT `obtain_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `obtain_ibfk_2` FOREIGN KEY (`acmID`) REFERENCES `achievement` (`acmID`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`nationalID`) REFERENCES `personal` (`nationalID`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`instructorID`) REFERENCES `instructor` (`instructorID`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`organID`) REFERENCES `organization` (`organID`),
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`);

--
-- Constraints for table `teach`
--
ALTER TABLE `teach`
  ADD CONSTRAINT `teach_ibfk_1` FOREIGN KEY (`instructorID`) REFERENCES `instructor` (`instructorID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `teach_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
