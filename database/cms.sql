-- Table structure for table `_adminsections`
--

DROP TABLE IF EXISTS `_adminsections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_adminsections` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_AdminSections_AB_unique` (`A`,`B`),
  KEY `_AdminSections_B_index` (`B`),
  CONSTRAINT `_AdminSections_A_fkey` FOREIGN KEY (`A`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_AdminSections_B_fkey` FOREIGN KEY (`B`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_admintocourses`
--

DROP TABLE IF EXISTS `_admintocourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_admintocourses` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_AdminToCourses_AB_unique` (`A`,`B`),
  KEY `_AdminToCourses_B_index` (`B`),
  CONSTRAINT `_AdminToCourses_A_fkey` FOREIGN KEY (`A`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_AdminToCourses_B_fkey` FOREIGN KEY (`B`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_admintostudent`
--

DROP TABLE IF EXISTS `_admintostudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_admintostudent` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_AdminToStudent_AB_unique` (`A`,`B`),
  KEY `_AdminToStudent_B_index` (`B`),
  CONSTRAINT `_AdminToStudent_A_fkey` FOREIGN KEY (`A`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_AdminToStudent_B_fkey` FOREIGN KEY (`B`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_adviserstoattendance`
--

DROP TABLE IF EXISTS `_adviserstoattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_adviserstoattendance` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_AdvisersToAttendance_AB_unique` (`A`,`B`),
  KEY `_AdvisersToAttendance_B_index` (`B`),
  CONSTRAINT `_AdvisersToAttendance_A_fkey` FOREIGN KEY (`A`) REFERENCES `advisers` (`advisers_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_AdvisersToAttendance_B_fkey` FOREIGN KEY (`B`) REFERENCES `attendance` (`attendance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_adviserstogrades`
--

DROP TABLE IF EXISTS `_adviserstogrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_adviserstogrades` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_AdvisersToGrades_AB_unique` (`A`,`B`),
  KEY `_AdvisersToGrades_B_index` (`B`),
  CONSTRAINT `_AdvisersToGrades_A_fkey` FOREIGN KEY (`A`) REFERENCES `advisers` (`advisers_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_AdvisersToGrades_B_fkey` FOREIGN KEY (`B`) REFERENCES `grades` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_attendancetoprofessors`
--

DROP TABLE IF EXISTS `_attendancetoprofessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_attendancetoprofessors` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_AttendanceToProfessors_AB_unique` (`A`,`B`),
  KEY `_AttendanceToProfessors_B_index` (`B`),
  CONSTRAINT `_AttendanceToProfessors_A_fkey` FOREIGN KEY (`A`) REFERENCES `attendance` (`attendance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_AttendanceToProfessors_B_fkey` FOREIGN KEY (`B`) REFERENCES `professors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_attendancetostudent`
--

DROP TABLE IF EXISTS `_attendancetostudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_attendancetostudent` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_AttendanceToStudent_AB_unique` (`A`,`B`),
  KEY `_AttendanceToStudent_B_index` (`B`),
  CONSTRAINT `_AttendanceToStudent_A_fkey` FOREIGN KEY (`A`) REFERENCES `attendance` (`attendance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_AttendanceToStudent_B_fkey` FOREIGN KEY (`B`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_coursesections`
--

DROP TABLE IF EXISTS `_coursesections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_coursesections` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_CourseSections_AB_unique` (`A`,`B`),
  KEY `_CourseSections_B_index` (`B`),
  CONSTRAINT `_CourseSections_A_fkey` FOREIGN KEY (`A`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_CourseSections_B_fkey` FOREIGN KEY (`B`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_coursestogrades`
--

DROP TABLE IF EXISTS `_coursestogrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_coursestogrades` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_CoursesToGrades_AB_unique` (`A`,`B`),
  KEY `_CoursesToGrades_B_index` (`B`),
  CONSTRAINT `_CoursesToGrades_A_fkey` FOREIGN KEY (`A`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_CoursesToGrades_B_fkey` FOREIGN KEY (`B`) REFERENCES `grades` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_coursestoprofessors`
--

DROP TABLE IF EXISTS `_coursestoprofessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_coursestoprofessors` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_CoursesToProfessors_AB_unique` (`A`,`B`),
  KEY `_CoursesToProfessors_B_index` (`B`),
  CONSTRAINT `_CoursesToProfessors_A_fkey` FOREIGN KEY (`A`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_CoursesToProfessors_B_fkey` FOREIGN KEY (`B`) REFERENCES `professors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_coursestostudent`
--

DROP TABLE IF EXISTS `_coursestostudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_coursestostudent` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_CoursesToStudent_AB_unique` (`A`,`B`),
  KEY `_CoursesToStudent_B_index` (`B`),
  CONSTRAINT `_CoursesToStudent_A_fkey` FOREIGN KEY (`A`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_CoursesToStudent_B_fkey` FOREIGN KEY (`B`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_gradestoprofessors`
--

DROP TABLE IF EXISTS `_gradestoprofessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_gradestoprofessors` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_GradesToProfessors_AB_unique` (`A`,`B`),
  KEY `_GradesToProfessors_B_index` (`B`),
  CONSTRAINT `_GradesToProfessors_A_fkey` FOREIGN KEY (`A`) REFERENCES `grades` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_GradesToProfessors_B_fkey` FOREIGN KEY (`B`) REFERENCES `professors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_gradestostudent`
--

DROP TABLE IF EXISTS `_gradestostudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_gradestostudent` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_GradesToStudent_AB_unique` (`A`,`B`),
  KEY `_GradesToStudent_B_index` (`B`),
  CONSTRAINT `_GradesToStudent_A_fkey` FOREIGN KEY (`A`) REFERENCES `grades` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_GradesToStudent_B_fkey` FOREIGN KEY (`B`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_professorstoschedule`
--

DROP TABLE IF EXISTS `_professorstoschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_professorstoschedule` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_ProfessorsToSchedule_AB_unique` (`A`,`B`),
  KEY `_ProfessorsToSchedule_B_index` (`B`),
  CONSTRAINT `_ProfessorsToSchedule_A_fkey` FOREIGN KEY (`A`) REFERENCES `professors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_ProfessorsToSchedule_B_fkey` FOREIGN KEY (`B`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_professorstosections`
--

DROP TABLE IF EXISTS `_professorstosections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_professorstosections` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_ProfessorsToSections_AB_unique` (`A`,`B`),
  KEY `_ProfessorsToSections_B_index` (`B`),
  CONSTRAINT `_ProfessorsToSections_A_fkey` FOREIGN KEY (`A`) REFERENCES `professors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_ProfessorsToSections_B_fkey` FOREIGN KEY (`B`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_professorstostudent`
--

DROP TABLE IF EXISTS `_professorstostudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_professorstostudent` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_ProfessorsToStudent_AB_unique` (`A`,`B`),
  KEY `_ProfessorsToStudent_B_index` (`B`),
  CONSTRAINT `_ProfessorsToStudent_A_fkey` FOREIGN KEY (`A`) REFERENCES `professors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_ProfessorsToStudent_B_fkey` FOREIGN KEY (`B`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_sectionstostudent`
--

DROP TABLE IF EXISTS `_sectionstostudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_sectionstostudent` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_SectionsToStudent_AB_unique` (`A`,`B`),
  KEY `_SectionsToStudent_B_index` (`B`),
  CONSTRAINT `_SectionsToStudent_A_fkey` FOREIGN KEY (`A`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_SectionsToStudent_B_fkey` FOREIGN KEY (`B`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Student','Professor','Adviser','Admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Admin',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advisers`
--

DROP TABLE IF EXISTS `advisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisers` (
  `advisers_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Student','Professor','Adviser','Admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Adviser',
  PRIMARY KEY (`advisers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL,
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prerequisites` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hall` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credits` int(11) NOT NULL,
  `time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `final` double NOT NULL,
  `midterm` double NOT NULL,
  `labGrades` double NOT NULL,
  `gpa` double NOT NULL,
  `cgpa` double NOT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4170306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_hours` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_num` bigint(20) NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Student','Professor','Adviser','Admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Professor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lab` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(145) DEFAULT NULL,
  `email` varchar(145) DEFAULT NULL,
  `password` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_profile`
--

DROP TABLE IF EXISTS `student_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_num` bigint(20) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` int(11) NOT NULL,
  `total_acheivments` int(11) NOT NULL,
  `warnings` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joiningDate` year(4) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `advisers_id` int(11) DEFAULT NULL,
  `role` enum('Student','Professor','Adviser','Admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Student',
  `studentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Student_advisers_id_fkey` (`advisers_id`),
  KEY `Student_schedule_id_fkey` (`schedule_id`),
  KEY `Student_id_fkey_idx` (`studentID`),
  CONSTRAINT `Student_advisers_id_fkey` FOREIGN KEY (`advisers_id`) REFERENCES `advisers` (`advisers_id`) ON UPDATE CASCADE,
  CONSTRAINT `Student_id_fkey` FOREIGN KEY (`studentID`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Student_schedule_id_fkey` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=203102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

