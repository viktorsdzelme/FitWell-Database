-- MySQL dump 10.13  Distrib 9.5.0, for macos15.7 (arm64)
--
-- Host: localhost    Database: FitWell
-- ------------------------------------------------------
-- Server version	9.5.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'cb4290a4-ec2e-11f0-9f41-7040eff0e6ae:1-245';

--
-- Table structure for table `ExerciseCategories`
--

DROP TABLE IF EXISTS `ExerciseCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExerciseCategories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExerciseCategories`
--

LOCK TABLES `ExerciseCategories` WRITE;
/*!40000 ALTER TABLE `ExerciseCategories` DISABLE KEYS */;
INSERT INTO `ExerciseCategories` VALUES (1,'Chest','Chest exercises'),(2,'Back','Back exercises'),(3,'Legs','Leg exercises'),(4,'Shoulders','Shoulder exercises'),(5,'Arms','Arm exercises'),(6,'Core','Core exercises');
/*!40000 ALTER TABLE `ExerciseCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exercises`
--

DROP TABLE IF EXISTS `Exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exercises` (
  `exercise_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `exercise_name` varchar(100) NOT NULL,
  `description` text,
  `muscle_group` varchar(50) NOT NULL,
  `equipment_needed` varchar(100) DEFAULT NULL,
  `difficulty_level` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`exercise_id`),
  KEY `fk_exercises_category` (`category_id`),
  CONSTRAINT `fk_exercises_category` FOREIGN KEY (`category_id`) REFERENCES `ExerciseCategories` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exercises`
--

LOCK TABLES `Exercises` WRITE;
/*!40000 ALTER TABLE `Exercises` DISABLE KEYS */;
INSERT INTO `Exercises` VALUES (1,1,'Bench Press','Barbell chest press exercise','Chest','Barbell','Intermediate'),(2,4,'Overhead Press','Standing shoulder press','Shoulders','Barbell','Intermediate'),(3,5,'Tricep Pushdown','Cable tricep isolation exercise','Arms','Cable Machine','Beginner'),(4,2,'Barbell Row','Bent-over rowing exercise','Back','Barbell','Intermediate'),(5,5,'Barbell Curl','Bicep curl exercise','Arms','Barbell','Beginner'),(6,3,'Back Squat','Barbell squat exercise','Legs','Barbell','Intermediate'),(7,3,'Romanian Deadlift','Posterior chain movement','Legs','Barbell','Intermediate');
/*!40000 ALTER TABLE `Exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Foods`
--

DROP TABLE IF EXISTS `Foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Foods` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(100) NOT NULL,
  `brand_name` varchar(100) DEFAULT NULL,
  `serving_size` decimal(6,2) DEFAULT NULL,
  `serving_unit` varchar(30) DEFAULT NULL,
  `calories` int NOT NULL,
  `protein_grams` decimal(6,2) DEFAULT NULL,
  `carb_grams` decimal(6,2) DEFAULT NULL,
  `fat_grams` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Foods`
--

LOCK TABLES `Foods` WRITE;
/*!40000 ALTER TABLE `Foods` DISABLE KEYS */;
INSERT INTO `Foods` VALUES (1,'Chicken Breast','Generic',4.00,'oz',187,35.00,0.00,4.00),(2,'White Rice','Generic',1.00,'cup',205,4.00,45.00,0.40),(3,'Eggs','Generic',2.00,'large',140,12.00,1.00,10.00),(4,'Protein Oatmeal','Quaker',1.00,'packet',220,10.00,33.00,5.00),(5,'Banana','Generic',1.00,'medium',105,1.30,27.00,0.30);
/*!40000 ALTER TABLE `Foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Goals`
--

DROP TABLE IF EXISTS `Goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Goals` (
  `goal_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `goal_type` varchar(50) NOT NULL,
  `target_value` decimal(8,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`goal_id`),
  KEY `fk_goals_user` (`user_id`),
  CONSTRAINT `fk_goals_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Goals`
--

LOCK TABLES `Goals` WRITE;
/*!40000 ALTER TABLE `Goals` DISABLE KEYS */;
INSERT INTO `Goals` VALUES (1,1,'Muscle Gain',195.00,'2026-04-01','2026-08-01','In Progress'),(2,1,'Bench Press PR',225.00,'2026-04-01','2026-07-01','In Progress'),(3,2,'Fat Loss',130.00,'2026-04-01','2026-07-15','In Progress');
/*!40000 ALTER TABLE `Goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MealFoods`
--

DROP TABLE IF EXISTS `MealFoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MealFoods` (
  `meal_food_id` int NOT NULL AUTO_INCREMENT,
  `meal_id` int NOT NULL,
  `food_id` int NOT NULL,
  `servings` decimal(6,2) NOT NULL,
  `serving_unit` varchar(30) NOT NULL,
  PRIMARY KEY (`meal_food_id`),
  KEY `fk_mealfoods_meal` (`meal_id`),
  KEY `fk_mealfoods_food` (`food_id`),
  CONSTRAINT `fk_mealfoods_food` FOREIGN KEY (`food_id`) REFERENCES `Foods` (`food_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_mealfoods_meal` FOREIGN KEY (`meal_id`) REFERENCES `Meals` (`meal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MealFoods`
--

LOCK TABLES `MealFoods` WRITE;
/*!40000 ALTER TABLE `MealFoods` DISABLE KEYS */;
INSERT INTO `MealFoods` VALUES (1,1,3,1.00,'serving'),(2,1,4,1.00,'packet'),(3,1,5,1.00,'medium'),(4,2,1,2.00,'servings'),(5,2,2,1.50,'cups');
/*!40000 ALTER TABLE `MealFoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meals`
--

DROP TABLE IF EXISTS `Meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Meals` (
  `meal_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `meal_name` varchar(100) NOT NULL,
  `meal_type` varchar(30) NOT NULL,
  `meal_datetime` datetime NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`meal_id`),
  KEY `fk_meals_user` (`user_id`),
  CONSTRAINT `fk_meals_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meals`
--

LOCK TABLES `Meals` WRITE;
/*!40000 ALTER TABLE `Meals` DISABLE KEYS */;
INSERT INTO `Meals` VALUES (1,1,'Breakfast Meal','Breakfast','2026-04-23 08:00:00','High protein breakfast'),(2,1,'Post Workout Meal','Post-workout','2026-04-23 19:00:00','Recovery focused meal');
/*!40000 ALTER TABLE `Meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NutritionGoals`
--

DROP TABLE IF EXISTS `NutritionGoals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NutritionGoals` (
  `nutrition_goal_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `daily_calorie_goal` int NOT NULL,
  `protein_goal_grams` int DEFAULT NULL,
  `carb_goal_grams` int DEFAULT NULL,
  `fat_goal_grams` int DEFAULT NULL,
  `water_goal_oz` int DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`nutrition_goal_id`),
  KEY `fk_nutritiongoals_user` (`user_id`),
  CONSTRAINT `fk_nutritiongoals_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NutritionGoals`
--

LOCK TABLES `NutritionGoals` WRITE;
/*!40000 ALTER TABLE `NutritionGoals` DISABLE KEYS */;
INSERT INTO `NutritionGoals` VALUES (1,1,3200,220,350,80,128,'2026-04-01',NULL,1),(2,2,1900,140,180,55,96,'2026-04-01',NULL,1);
/*!40000 ALTER TABLE `NutritionGoals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NutritionLogs`
--

DROP TABLE IF EXISTS `NutritionLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NutritionLogs` (
  `nutrition_log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `log_date` date NOT NULL,
  `total_calories` int DEFAULT NULL,
  `total_protein_grams` decimal(6,2) DEFAULT NULL,
  `total_carb_grams` decimal(6,2) DEFAULT NULL,
  `total_fat_grams` decimal(6,2) DEFAULT NULL,
  `water_oz` int DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nutrition_log_id`),
  KEY `fk_nutritionlogs_user` (`user_id`),
  CONSTRAINT `fk_nutritionlogs_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NutritionLogs`
--

LOCK TABLES `NutritionLogs` WRITE;
/*!40000 ALTER TABLE `NutritionLogs` DISABLE KEYS */;
INSERT INTO `NutritionLogs` VALUES (1,1,'2026-04-23',2875,210.00,290.00,72.00,120,'Solid day of eating'),(2,2,'2026-04-23',1820,138.00,170.00,50.00,90,'Stayed close to target');
/*!40000 ALTER TABLE `NutritionLogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonalRecords`
--

DROP TABLE IF EXISTS `PersonalRecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PersonalRecords` (
  `pr_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  `record_type` varchar(50) NOT NULL,
  `record_value` decimal(8,2) NOT NULL,
  `record_unit` varchar(20) NOT NULL,
  `date_achieved` date NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  KEY `fk_personalrecords_user` (`user_id`),
  KEY `fk_personalrecords_exercise` (`exercise_id`),
  CONSTRAINT `fk_personalrecords_exercise` FOREIGN KEY (`exercise_id`) REFERENCES `Exercises` (`exercise_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_personalrecords_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonalRecords`
--

LOCK TABLES `PersonalRecords` WRITE;
/*!40000 ALTER TABLE `PersonalRecords` DISABLE KEYS */;
INSERT INTO `PersonalRecords` VALUES (1,1,1,'One Rep Max',225.00,'lbs','2026-04-15','New bench press PR'),(2,1,6,'Heaviest Set',275.00,'lbs','2026-04-10','Best squat set so far');
/*!40000 ALTER TABLE `PersonalRecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProgressEntries`
--

DROP TABLE IF EXISTS `ProgressEntries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProgressEntries` (
  `progress_entry_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `entry_date` date NOT NULL,
  `body_weight_lbs` decimal(6,2) DEFAULT NULL,
  `body_fat_percent` decimal(5,2) DEFAULT NULL,
  `chest_inches` decimal(5,2) DEFAULT NULL,
  `waist_inches` decimal(5,2) DEFAULT NULL,
  `arm_inches` decimal(5,2) DEFAULT NULL,
  `thigh_inches` decimal(5,2) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`progress_entry_id`),
  KEY `fk_progressentries_user` (`user_id`),
  CONSTRAINT `fk_progressentries_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProgressEntries`
--

LOCK TABLES `ProgressEntries` WRITE;
/*!40000 ALTER TABLE `ProgressEntries` DISABLE KEYS */;
INSERT INTO `ProgressEntries` VALUES (1,1,'2026-04-01',182.00,15.20,41.00,33.00,15.20,23.50,'Starting point for current bulk'),(2,1,'2026-04-23',185.00,15.80,41.50,33.20,15.50,23.80,'Strength increasing and weight up');
/*!40000 ALTER TABLE `ProgressEntries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reports`
--

DROP TABLE IF EXISTS `Reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `report_type` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL,
  `resolved_at` datetime DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `fk_reports_user` (`user_id`),
  CONSTRAINT `fk_reports_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reports`
--

LOCK TABLES `Reports` WRITE;
/*!40000 ALTER TABLE `Reports` DISABLE KEYS */;
INSERT INTO `Reports` VALUES (1,1,'Bug Report','Workout log not updating correctly','User noticed a delay in updating logged workout data.','Open','2026-04-23 13:17:52',NULL),(2,2,'Feature Request','Add barcode scanner for foods','Would like a barcode scanner for faster food entry.','Open','2026-04-23 13:17:52',NULL);
/*!40000 ALTER TABLE `Reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SupplementLogs`
--

DROP TABLE IF EXISTS `SupplementLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SupplementLogs` (
  `supplement_log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_supplement_id` int NOT NULL,
  `log_datetime` datetime NOT NULL,
  `dosage_taken` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supplement_log_id`),
  KEY `fk_supplementlogs_user` (`user_id`),
  KEY `fk_supplementlogs_usersupplement` (`user_supplement_id`),
  CONSTRAINT `fk_supplementlogs_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_supplementlogs_usersupplement` FOREIGN KEY (`user_supplement_id`) REFERENCES `UserSupplements` (`user_supplement_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SupplementLogs`
--

LOCK TABLES `SupplementLogs` WRITE;
/*!40000 ALTER TABLE `SupplementLogs` DISABLE KEYS */;
INSERT INTO `SupplementLogs` VALUES (1,1,1,'2026-04-23 07:30:00','5g','Taken with breakfast'),(2,1,3,'2026-04-23 16:00:00','1 scoop','Taken before training'),(3,1,2,'2026-04-23 18:30:00','1 scoop','Taken after training');
/*!40000 ALTER TABLE `SupplementLogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplements`
--

DROP TABLE IF EXISTS `Supplements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplements` (
  `supplement_id` int NOT NULL AUTO_INCREMENT,
  `supplement_name` varchar(100) NOT NULL,
  `supplement_type` varchar(50) NOT NULL,
  `brand_name` varchar(100) DEFAULT NULL,
  `default_dosage` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supplement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplements`
--

LOCK TABLES `Supplements` WRITE;
/*!40000 ALTER TABLE `Supplements` DISABLE KEYS */;
INSERT INTO `Supplements` VALUES (1,'Creatine Monohydrate','Performance','Optimum Nutrition','5g','Supports strength and power'),(2,'Whey Protein','Protein','Dymatize','1 scoop','Helps meet daily protein goals'),(3,'Pre-Workout','Energy','C4','1 scoop','Boosts workout energy');
/*!40000 ALTER TABLE `Supplements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserProfiles`
--

DROP TABLE IF EXISTS `UserProfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserProfiles` (
  `profile_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `height_inches` decimal(5,2) DEFAULT NULL,
  `weight_lbs` decimal(5,2) DEFAULT NULL,
  `activity_level` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_userprofiles_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserProfiles`
--

LOCK TABLES `UserProfiles` WRITE;
/*!40000 ALTER TABLE `UserProfiles` DISABLE KEYS */;
INSERT INTO `UserProfiles` VALUES (1,1,'Viktor','Dzelme','2003-05-10','Male',71.00,185.00,'Very Active'),(2,2,'Alex','Carter','2002-11-21','Female',65.00,140.00,'Moderately Active');
/*!40000 ALTER TABLE `UserProfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `account_status` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'vikfit','vikfit@example.com','hashed_pw_123','2026-04-23 13:17:52','Active'),(2,'fituser2','fituser2@example.com','hashed_pw_456','2026-04-23 13:17:52','Active');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserSupplements`
--

DROP TABLE IF EXISTS `UserSupplements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserSupplements` (
  `user_supplement_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `supplement_id` int NOT NULL,
  `dosage` varchar(50) NOT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_supplement_id`),
  KEY `fk_usersupplements_user` (`user_id`),
  KEY `fk_usersupplements_supplement` (`supplement_id`),
  CONSTRAINT `fk_usersupplements_supplement` FOREIGN KEY (`supplement_id`) REFERENCES `Supplements` (`supplement_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_usersupplements_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserSupplements`
--

LOCK TABLES `UserSupplements` WRITE;
/*!40000 ALTER TABLE `UserSupplements` DISABLE KEYS */;
INSERT INTO `UserSupplements` VALUES (1,1,1,'5g','Daily','2026-04-01',NULL,1),(2,1,2,'1 scoop','Post-workout','2026-04-01',NULL,1),(3,1,3,'1 scoop','Pre-workout','2026-04-01',NULL,1);
/*!40000 ALTER TABLE `UserSupplements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserWorkoutPlans`
--

DROP TABLE IF EXISTS `UserWorkoutPlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserWorkoutPlans` (
  `user_workout_plan_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `status_id` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_workout_plan_id`),
  KEY `fk_userworkoutplans_user` (`user_id`),
  KEY `fk_userworkoutplans_plan` (`plan_id`),
  KEY `fk_userworkoutplans_status` (`status_id`),
  CONSTRAINT `fk_userworkoutplans_plan` FOREIGN KEY (`plan_id`) REFERENCES `WorkoutPlans` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userworkoutplans_status` FOREIGN KEY (`status_id`) REFERENCES `WorkoutPlanStatus` (`status_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_userworkoutplans_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserWorkoutPlans`
--

LOCK TABLES `UserWorkoutPlans` WRITE;
/*!40000 ALTER TABLE `UserWorkoutPlans` DISABLE KEYS */;
INSERT INTO `UserWorkoutPlans` VALUES (1,1,1,3,'2026-04-20',NULL,1),(2,2,2,2,'2026-04-10','2026-06-10',0);
/*!40000 ALTER TABLE `UserWorkoutPlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkoutDayExercises`
--

DROP TABLE IF EXISTS `WorkoutDayExercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkoutDayExercises` (
  `workout_day_exercise_id` int NOT NULL AUTO_INCREMENT,
  `workout_day_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  `exercise_order` int NOT NULL,
  `target_sets` int NOT NULL,
  `target_reps` varchar(30) NOT NULL,
  `target_weight` decimal(6,2) DEFAULT NULL,
  `rest_seconds` int DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`workout_day_exercise_id`),
  KEY `fk_workoutdayexercises_day` (`workout_day_id`),
  KEY `fk_workoutdayexercises_exercise` (`exercise_id`),
  CONSTRAINT `fk_workoutdayexercises_day` FOREIGN KEY (`workout_day_id`) REFERENCES `WorkoutDays` (`workout_day_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_workoutdayexercises_exercise` FOREIGN KEY (`exercise_id`) REFERENCES `Exercises` (`exercise_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkoutDayExercises`
--

LOCK TABLES `WorkoutDayExercises` WRITE;
/*!40000 ALTER TABLE `WorkoutDayExercises` DISABLE KEYS */;
INSERT INTO `WorkoutDayExercises` VALUES (1,1,1,1,4,'6-8',185.00,120,'Focus on progressive overload'),(2,1,2,2,3,'8-10',95.00,90,'Controlled reps'),(3,1,3,3,3,'10-12',70.00,60,'Full range of motion'),(4,2,4,1,4,'6-8',155.00,120,'Keep back tight'),(5,2,5,2,3,'10-12',60.00,60,'Strict form'),(6,3,6,1,4,'5-8',225.00,150,'Brace core'),(7,3,7,2,3,'8-10',185.00,120,'Hamstring focus');
/*!40000 ALTER TABLE `WorkoutDayExercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkoutDays`
--

DROP TABLE IF EXISTS `WorkoutDays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkoutDays` (
  `workout_day_id` int NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL,
  `day_name` varchar(50) NOT NULL,
  `day_order` int NOT NULL,
  `focus_area` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`workout_day_id`),
  KEY `fk_workoutdays_plan` (`plan_id`),
  CONSTRAINT `fk_workoutdays_plan` FOREIGN KEY (`plan_id`) REFERENCES `WorkoutPlans` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkoutDays`
--

LOCK TABLES `WorkoutDays` WRITE;
/*!40000 ALTER TABLE `WorkoutDays` DISABLE KEYS */;
INSERT INTO `WorkoutDays` VALUES (1,1,'Push Day',1,'Chest, Shoulders, Triceps'),(2,1,'Pull Day',2,'Back, Biceps'),(3,1,'Leg Day',3,'Quads, Hamstrings, Glutes');
/*!40000 ALTER TABLE `WorkoutDays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkoutLogExercises`
--

DROP TABLE IF EXISTS `WorkoutLogExercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkoutLogExercises` (
  `workout_log_exercise_id` int NOT NULL AUTO_INCREMENT,
  `workout_log_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  `set_number` int NOT NULL,
  `reps_completed` int DEFAULT NULL,
  `weight_used` decimal(6,2) DEFAULT NULL,
  `duration_seconds` int DEFAULT NULL,
  `distance_miles` decimal(6,2) DEFAULT NULL,
  `is_pr` tinyint(1) NOT NULL DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`workout_log_exercise_id`),
  KEY `fk_workoutlogexercises_log` (`workout_log_id`),
  KEY `fk_workoutlogexercises_exercise` (`exercise_id`),
  CONSTRAINT `fk_workoutlogexercises_exercise` FOREIGN KEY (`exercise_id`) REFERENCES `Exercises` (`exercise_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_workoutlogexercises_log` FOREIGN KEY (`workout_log_id`) REFERENCES `WorkoutLogs` (`workout_log_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkoutLogExercises`
--

LOCK TABLES `WorkoutLogExercises` WRITE;
/*!40000 ALTER TABLE `WorkoutLogExercises` DISABLE KEYS */;
INSERT INTO `WorkoutLogExercises` VALUES (1,1,1,1,8,185.00,NULL,NULL,0,'Warm-up felt smooth'),(2,1,1,2,7,185.00,NULL,NULL,0,'Good control'),(3,1,2,1,10,95.00,NULL,NULL,0,'Solid overhead press'),(4,1,3,1,12,70.00,NULL,NULL,0,'Good tricep contraction'),(5,2,4,1,8,155.00,NULL,NULL,0,'Heavy but clean'),(6,2,5,1,12,60.00,NULL,NULL,0,'Strong pump');
/*!40000 ALTER TABLE `WorkoutLogExercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkoutLogs`
--

DROP TABLE IF EXISTS `WorkoutLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkoutLogs` (
  `workout_log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `workout_day_id` int DEFAULT NULL,
  `workout_date` date NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `calories_burned` int DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`workout_log_id`),
  KEY `fk_workoutlogs_user` (`user_id`),
  KEY `fk_workoutlogs_day` (`workout_day_id`),
  CONSTRAINT `fk_workoutlogs_day` FOREIGN KEY (`workout_day_id`) REFERENCES `WorkoutDays` (`workout_day_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_workoutlogs_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkoutLogs`
--

LOCK TABLES `WorkoutLogs` WRITE;
/*!40000 ALTER TABLE `WorkoutLogs` DISABLE KEYS */;
INSERT INTO `WorkoutLogs` VALUES (1,1,1,'2026-04-22','2026-04-22 17:00:00','2026-04-22 18:10:00',70,420,'Strong workout, felt good'),(2,1,2,'2026-04-23','2026-04-23 16:30:00','2026-04-23 17:35:00',65,390,'Rows felt heavier than usual');
/*!40000 ALTER TABLE `WorkoutLogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkoutPlanCategories`
--

DROP TABLE IF EXISTS `WorkoutPlanCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkoutPlanCategories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkoutPlanCategories`
--

LOCK TABLES `WorkoutPlanCategories` WRITE;
/*!40000 ALTER TABLE `WorkoutPlanCategories` DISABLE KEYS */;
INSERT INTO `WorkoutPlanCategories` VALUES (1,'Hypertrophy','Muscle growth focused training'),(2,'Strength','Strength-based workout plans'),(3,'Beginner','Beginner friendly plans');
/*!40000 ALTER TABLE `WorkoutPlanCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkoutPlans`
--

DROP TABLE IF EXISTS `WorkoutPlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkoutPlans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `plan_name` varchar(100) NOT NULL,
  `description` text,
  `created_by_user_id` int DEFAULT NULL,
  `is_prebuilt` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `fk_workoutplans_category` (`category_id`),
  KEY `fk_workoutplans_created_by` (`created_by_user_id`),
  CONSTRAINT `fk_workoutplans_category` FOREIGN KEY (`category_id`) REFERENCES `WorkoutPlanCategories` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_workoutplans_created_by` FOREIGN KEY (`created_by_user_id`) REFERENCES `Users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkoutPlans`
--

LOCK TABLES `WorkoutPlans` WRITE;
/*!40000 ALTER TABLE `WorkoutPlans` DISABLE KEYS */;
INSERT INTO `WorkoutPlans` VALUES (1,1,'Push Pull Legs Mass Plan','A 6-day hypertrophy-focused workout plan',1,0,'2026-04-23 13:17:52'),(2,2,'Beginner Strength Base','Simple strength progression plan',1,1,'2026-04-23 13:17:52');
/*!40000 ALTER TABLE `WorkoutPlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkoutPlanStatus`
--

DROP TABLE IF EXISTS `WorkoutPlanStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkoutPlanStatus` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status_name` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkoutPlanStatus`
--

LOCK TABLES `WorkoutPlanStatus` WRITE;
/*!40000 ALTER TABLE `WorkoutPlanStatus` DISABLE KEYS */;
INSERT INTO `WorkoutPlanStatus` VALUES (3,'Active'),(4,'Archived'),(2,'Completed'),(1,'Draft');
/*!40000 ALTER TABLE `WorkoutPlanStatus` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-23 13:26:59
