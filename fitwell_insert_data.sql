USE FitWell;

INSERT INTO Users (username, email, password_hash, created_at, account_status)
VALUES
('vikfit', 'vikfit@example.com', 'hashed_pw_123', NOW(), 'Active'),
('fituser2', 'fituser2@example.com', 'hashed_pw_456', NOW(), 'Active');

INSERT INTO UserProfiles (user_id, first_name, last_name, date_of_birth, sex, height_inches, weight_lbs, activity_level)
VALUES
(1, 'Viktor', 'Dzelme', '2003-05-10', 'Male', 71.00, 185.00, 'Very Active'),
(2, 'Alex', 'Carter', '2002-11-21', 'Female', 65.00, 140.00, 'Moderately Active');

INSERT INTO Goals (user_id, goal_type, target_value, start_date, end_date, status)
VALUES
(1, 'Muscle Gain', 195.00, '2026-04-01', '2026-08-01', 'In Progress'),
(1, 'Bench Press PR', 225.00, '2026-04-01', '2026-07-01', 'In Progress'),
(2, 'Fat Loss', 130.00, '2026-04-01', '2026-07-15', 'In Progress');

INSERT INTO WorkoutPlanCategories (category_name, description)
VALUES
('Hypertrophy', 'Muscle growth focused training'),
('Strength', 'Strength-based workout plans'),
('Beginner', 'Beginner friendly plans');

INSERT INTO WorkoutPlanStatus (status_name)
VALUES
('Draft'),
('Completed'),
('Active'),
('Archived');

INSERT INTO ExerciseCategories (category_name, description)
VALUES
('Chest', 'Chest exercises'),
('Back', 'Back exercises'),
('Legs', 'Leg exercises'),
('Shoulders', 'Shoulder exercises'),
('Arms', 'Arm exercises'),
('Core', 'Core exercises');

INSERT INTO Foods (food_name, brand_name, serving_size, serving_unit, calories, protein_grams, carb_grams, fat_grams)
VALUES
('Chicken Breast', 'Generic', 4.00, 'oz', 187, 35.00, 0.00, 4.00),
('White Rice', 'Generic', 1.00, 'cup', 205, 4.00, 45.00, 0.40),
('Eggs', 'Generic', 2.00, 'large', 140, 12.00, 1.00, 10.00),
('Protein Oatmeal', 'Quaker', 1.00, 'packet', 220, 10.00, 33.00, 5.00),
('Banana', 'Generic', 1.00, 'medium', 105, 1.30, 27.00, 0.30);

INSERT INTO Supplements (supplement_name, supplement_type, brand_name, default_dosage, description)
VALUES
('Creatine Monohydrate', 'Performance', 'Optimum Nutrition', '5g', 'Supports strength and power'),
('Whey Protein', 'Protein', 'Dymatize', '1 scoop', 'Helps meet daily protein goals'),
('Pre-Workout', 'Energy', 'C4', '1 scoop', 'Boosts workout energy');

INSERT INTO WorkoutPlans (category_id, plan_name, description, created_by_user_id, is_prebuilt, created_at)
VALUES
(1, 'Push Pull Legs Mass Plan', 'A 6-day hypertrophy-focused workout plan', 1, FALSE, NOW()),
(2, 'Beginner Strength Base', 'Simple strength progression plan', 1, TRUE, NOW());

INSERT INTO UserWorkoutPlans (user_id, plan_id, status_id, start_date, end_date, is_active)
VALUES
(1, 1, 3, '2026-04-20', NULL, TRUE),
(2, 2, 2, '2026-04-10', '2026-06-10', FALSE);

INSERT INTO WorkoutDays (plan_id, day_name, day_order, focus_area)
VALUES
(1, 'Push Day', 1, 'Chest, Shoulders, Triceps'),
(1, 'Pull Day', 2, 'Back, Biceps'),
(1, 'Leg Day', 3, 'Quads, Hamstrings, Glutes');

INSERT INTO Exercises (category_id, exercise_name, description, muscle_group, equipment_needed, difficulty_level)
VALUES
(1, 'Bench Press', 'Barbell chest press exercise', 'Chest', 'Barbell', 'Intermediate'),
(4, 'Overhead Press', 'Standing shoulder press', 'Shoulders', 'Barbell', 'Intermediate'),
(5, 'Tricep Pushdown', 'Cable tricep isolation exercise', 'Arms', 'Cable Machine', 'Beginner'),
(2, 'Barbell Row', 'Bent-over rowing exercise', 'Back', 'Barbell', 'Intermediate'),
(5, 'Barbell Curl', 'Bicep curl exercise', 'Arms', 'Barbell', 'Beginner'),
(3, 'Back Squat', 'Barbell squat exercise', 'Legs', 'Barbell', 'Intermediate'),
(3, 'Romanian Deadlift', 'Posterior chain movement', 'Legs', 'Barbell', 'Intermediate');

INSERT INTO WorkoutDayExercises (workout_day_id, exercise_id, exercise_order, target_sets, target_reps, target_weight, rest_seconds, notes)
VALUES
(1, 1, 1, 4, '6-8', 185.00, 120, 'Focus on progressive overload'),
(1, 2, 2, 3, '8-10', 95.00, 90, 'Controlled reps'),
(1, 3, 3, 3, '10-12', 70.00, 60, 'Full range of motion'),
(2, 4, 1, 4, '6-8', 155.00, 120, 'Keep back tight'),
(2, 5, 2, 3, '10-12', 60.00, 60, 'Strict form'),
(3, 6, 1, 4, '5-8', 225.00, 150, 'Brace core'),
(3, 7, 2, 3, '8-10', 185.00, 120, 'Hamstring focus');

INSERT INTO WorkoutLogs (user_id, workout_day_id, workout_date, start_time, end_time, duration_minutes, calories_burned, notes)
VALUES
(1, 1, '2026-04-22', '2026-04-22 17:00:00', '2026-04-22 18:10:00', 70, 420, 'Strong workout, felt good'),
(1, 2, '2026-04-23', '2026-04-23 16:30:00', '2026-04-23 17:35:00', 65, 390, 'Rows felt heavier than usual');

INSERT INTO WorkoutLogExercises (workout_log_id, exercise_id, set_number, reps_completed, weight_used, duration_seconds, distance_miles, is_pr, notes)
VALUES
(1, 1, 1, 8, 185.00, NULL, NULL, FALSE, 'Warm-up felt smooth'),
(1, 1, 2, 7, 185.00, NULL, NULL, FALSE, 'Good control'),
(1, 2, 1, 10, 95.00, NULL, NULL, FALSE, 'Solid overhead press'),
(1, 3, 1, 12, 70.00, NULL, NULL, FALSE, 'Good tricep contraction'),
(2, 4, 1, 8, 155.00, NULL, NULL, FALSE, 'Heavy but clean'),
(2, 5, 1, 12, 60.00, NULL, NULL, FALSE, 'Strong pump');

INSERT INTO PersonalRecords (user_id, exercise_id, record_type, record_value, record_unit, date_achieved, notes)
VALUES
(1, 1, 'One Rep Max', 225.00, 'lbs', '2026-04-15', 'New bench press PR'),
(1, 6, 'Heaviest Set', 275.00, 'lbs', '2026-04-10', 'Best squat set so far');

INSERT INTO NutritionGoals (user_id, daily_calorie_goal, protein_goal_grams, carb_goal_grams, fat_goal_grams, water_goal_oz, start_date, end_date, is_active)
VALUES
(1, 3200, 220, 350, 80, 128, '2026-04-01', NULL, TRUE),
(2, 1900, 140, 180, 55, 96, '2026-04-01', NULL, TRUE);

INSERT INTO Meals (user_id, meal_name, meal_type, meal_datetime, notes)
VALUES
(1, 'Breakfast Meal', 'Breakfast', '2026-04-23 08:00:00', 'High protein breakfast'),
(1, 'Post Workout Meal', 'Post-workout', '2026-04-23 19:00:00', 'Recovery focused meal');

INSERT INTO MealFoods (meal_id, food_id, servings, serving_unit)
VALUES
(1, 3, 1.00, 'serving'),
(1, 4, 1.00, 'packet'),
(1, 5, 1.00, 'medium'),
(2, 1, 2.00, 'servings'),
(2, 2, 1.50, 'cups');

INSERT INTO NutritionLogs (user_id, log_date, total_calories, total_protein_grams, total_carb_grams, total_fat_grams, water_oz, notes)
VALUES
(1, '2026-04-23', 2875, 210.00, 290.00, 72.00, 120, 'Solid day of eating'),
(2, '2026-04-23', 1820, 138.00, 170.00, 50.00, 90, 'Stayed close to target');

INSERT INTO UserSupplements (user_id, supplement_id, dosage, frequency, start_date, end_date, is_active)
VALUES
(1, 1, '5g', 'Daily', '2026-04-01', NULL, TRUE),
(1, 2, '1 scoop', 'Post-workout', '2026-04-01', NULL, TRUE),
(1, 3, '1 scoop', 'Pre-workout', '2026-04-01', NULL, TRUE);

INSERT INTO SupplementLogs (user_id, user_supplement_id, log_datetime, dosage_taken, notes)
VALUES
(1, 1, '2026-04-23 07:30:00', '5g', 'Taken with breakfast'),
(1, 3, '2026-04-23 16:00:00', '1 scoop', 'Taken before training'),
(1, 2, '2026-04-23 18:30:00', '1 scoop', 'Taken after training');

INSERT INTO ProgressEntries (user_id, entry_date, body_weight_lbs, body_fat_percent, chest_inches, waist_inches, arm_inches, thigh_inches, notes)
VALUES
(1, '2026-04-01', 182.00, 15.20, 41.00, 33.00, 15.20, 23.50, 'Starting point for current bulk'),
(1, '2026-04-23', 185.00, 15.80, 41.50, 33.20, 15.50, 23.80, 'Strength increasing and weight up');

INSERT INTO Reports (user_id, report_type, subject, description, status, created_at, resolved_at)
VALUES
(1, 'Bug Report', 'Workout log not updating correctly', 'User noticed a delay in updating logged workout data.', 'Open', NOW(), NULL),
(2, 'Feature Request', 'Add barcode scanner for foods', 'Would like a barcode scanner for faster food entry.', 'Open', NOW(), NULL);