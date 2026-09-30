DROP DATABASE IF EXISTS FitWell;
CREATE DATABASE FitWell;
USE FitWell;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    account_status VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE WorkoutPlanCategories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE WorkoutPlanStatus (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE ExerciseCategories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE Foods (
    food_id INT AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(100) NOT NULL,
    brand_name VARCHAR(100),
    serving_size DECIMAL(6,2),
    serving_unit VARCHAR(30),
    calories INT NOT NULL,
    protein_grams DECIMAL(6,2),
    carb_grams DECIMAL(6,2),
    fat_grams DECIMAL(6,2)
) ENGINE=InnoDB;

CREATE TABLE Supplements (
    supplement_id INT AUTO_INCREMENT PRIMARY KEY,
    supplement_name VARCHAR(100) NOT NULL,
    supplement_type VARCHAR(50) NOT NULL,
    brand_name VARCHAR(100),
    default_dosage VARCHAR(50),
    description VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE UserProfiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    sex VARCHAR(20),
    height_inches DECIMAL(5,2),
    weight_lbs DECIMAL(5,2),
    activity_level VARCHAR(30),
    CONSTRAINT fk_userprofiles_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Goals (
    goal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    goal_type VARCHAR(50) NOT NULL,
    target_value DECIMAL(8,2),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    CONSTRAINT fk_goals_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE WorkoutPlans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    plan_name VARCHAR(100) NOT NULL,
    description TEXT,
    created_by_user_id INT,
    is_prebuilt BOOLEAN NOT NULL,
    created_at DATETIME NOT NULL,
    CONSTRAINT fk_workoutplans_category
        FOREIGN KEY (category_id) REFERENCES WorkoutPlanCategories(category_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_workoutplans_created_by
        FOREIGN KEY (created_by_user_id) REFERENCES Users(user_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE UserWorkoutPlans (
    user_workout_plan_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    plan_id INT NOT NULL,
    status_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    is_active BOOLEAN NOT NULL,
    CONSTRAINT fk_userworkoutplans_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_userworkoutplans_plan
        FOREIGN KEY (plan_id) REFERENCES WorkoutPlans(plan_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_userworkoutplans_status
        FOREIGN KEY (status_id) REFERENCES WorkoutPlanStatus(status_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE WorkoutDays (
    workout_day_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_id INT NOT NULL,
    day_name VARCHAR(50) NOT NULL,
    day_order INT NOT NULL,
    focus_area VARCHAR(100),
    CONSTRAINT fk_workoutdays_plan
        FOREIGN KEY (plan_id) REFERENCES WorkoutPlans(plan_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Exercises (
    exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    exercise_name VARCHAR(100) NOT NULL,
    description TEXT,
    muscle_group VARCHAR(50) NOT NULL,
    equipment_needed VARCHAR(100),
    difficulty_level VARCHAR(30),
    CONSTRAINT fk_exercises_category
        FOREIGN KEY (category_id) REFERENCES ExerciseCategories(category_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE WorkoutDayExercises (
    workout_day_exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    workout_day_id INT NOT NULL,
    exercise_id INT NOT NULL,
    exercise_order INT NOT NULL,
    target_sets INT NOT NULL,
    target_reps VARCHAR(30) NOT NULL,
    target_weight DECIMAL(6,2),
    rest_seconds INT,
    notes VARCHAR(255),
    CONSTRAINT fk_workoutdayexercises_day
        FOREIGN KEY (workout_day_id) REFERENCES WorkoutDays(workout_day_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_workoutdayexercises_exercise
        FOREIGN KEY (exercise_id) REFERENCES Exercises(exercise_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE WorkoutLogs (
    workout_log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    workout_day_id INT,
    workout_date DATE NOT NULL,
    start_time DATETIME,
    end_time DATETIME,
    duration_minutes INT,
    calories_burned INT,
    notes VARCHAR(255),
    CONSTRAINT fk_workoutlogs_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_workoutlogs_day
        FOREIGN KEY (workout_day_id) REFERENCES WorkoutDays(workout_day_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE WorkoutLogExercises (
    workout_log_exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    workout_log_id INT NOT NULL,
    exercise_id INT NOT NULL,
    set_number INT NOT NULL,
    reps_completed INT,
    weight_used DECIMAL(6,2),
    duration_seconds INT,
    distance_miles DECIMAL(6,2),
    is_pr BOOLEAN NOT NULL DEFAULT FALSE,
    notes VARCHAR(255),
    CONSTRAINT fk_workoutlogexercises_log
        FOREIGN KEY (workout_log_id) REFERENCES WorkoutLogs(workout_log_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_workoutlogexercises_exercise
        FOREIGN KEY (exercise_id) REFERENCES Exercises(exercise_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE PersonalRecords (
    pr_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    exercise_id INT NOT NULL,
    record_type VARCHAR(50) NOT NULL,
    record_value DECIMAL(8,2) NOT NULL,
    record_unit VARCHAR(20) NOT NULL,
    date_achieved DATE NOT NULL,
    notes VARCHAR(255),
    CONSTRAINT fk_personalrecords_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_personalrecords_exercise
        FOREIGN KEY (exercise_id) REFERENCES Exercises(exercise_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE NutritionGoals (
    nutrition_goal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    daily_calorie_goal INT NOT NULL,
    protein_goal_grams INT,
    carb_goal_grams INT,
    fat_goal_grams INT,
    water_goal_oz INT,
    start_date DATE NOT NULL,
    end_date DATE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_nutritiongoals_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Meals (
    meal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    meal_name VARCHAR(100) NOT NULL,
    meal_type VARCHAR(30) NOT NULL,
    meal_datetime DATETIME NOT NULL,
    notes VARCHAR(255),
    CONSTRAINT fk_meals_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE MealFoods (
    meal_food_id INT AUTO_INCREMENT PRIMARY KEY,
    meal_id INT NOT NULL,
    food_id INT NOT NULL,
    servings DECIMAL(6,2) NOT NULL,
    serving_unit VARCHAR(30) NOT NULL,
    CONSTRAINT fk_mealfoods_meal
        FOREIGN KEY (meal_id) REFERENCES Meals(meal_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_mealfoods_food
        FOREIGN KEY (food_id) REFERENCES Foods(food_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE NutritionLogs (
    nutrition_log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    log_date DATE NOT NULL,
    total_calories INT,
    total_protein_grams DECIMAL(6,2),
    total_carb_grams DECIMAL(6,2),
    total_fat_grams DECIMAL(6,2),
    water_oz INT,
    notes VARCHAR(255),
    CONSTRAINT fk_nutritionlogs_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE UserSupplements (
    user_supplement_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    supplement_id INT NOT NULL,
    dosage VARCHAR(50) NOT NULL,
    frequency VARCHAR(50),
    start_date DATE NOT NULL,
    end_date DATE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_usersupplements_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_usersupplements_supplement
        FOREIGN KEY (supplement_id) REFERENCES Supplements(supplement_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE SupplementLogs (
    supplement_log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    user_supplement_id INT NOT NULL,
    log_datetime DATETIME NOT NULL,
    dosage_taken VARCHAR(50),
    notes VARCHAR(255),
    CONSTRAINT fk_supplementlogs_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_supplementlogs_usersupplement
        FOREIGN KEY (user_supplement_id) REFERENCES UserSupplements(user_supplement_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE ProgressEntries (
    progress_entry_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    entry_date DATE NOT NULL,
    body_weight_lbs DECIMAL(6,2),
    body_fat_percent DECIMAL(5,2),
    chest_inches DECIMAL(5,2),
    waist_inches DECIMAL(5,2),
    arm_inches DECIMAL(5,2),
    thigh_inches DECIMAL(5,2),
    notes VARCHAR(255),
    CONSTRAINT fk_progressentries_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    report_type VARCHAR(50) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    status VARCHAR(30) NOT NULL,
    created_at DATETIME NOT NULL,
    resolved_at DATETIME,
    CONSTRAINT fk_reports_user
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;