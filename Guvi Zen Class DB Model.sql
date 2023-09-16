CREATE TABLE `users` (
  `user_id` INT PRIMARY KEY,
  `username` VARCHAR,
  `email` VARCHAR,
  `password` VARCHAR,
  `role` VARCHAR,
  `created_at` DATETIME DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` DATETIME
);

CREATE TABLE `students` (
  `student_id` INT PRIMARY KEY,
  `user_id` INT,
  `full_name` VARCHAR,
  `address` TEXT,
  `phone_number` VARCHAR,
  `qualification` TEXT,
  `work_experience` TEXT
);

CREATE TABLE `mentors` (
  `mentor_id` INT PRIMARY KEY,
  `user_id` INT,
  `full_name` VARCHAR,
  `address` TEXT,
  `phone_number` VARCHAR,
  `qualification` TEXT,
  `work_experience` TEXT
);

CREATE TABLE `topics` (
  `topic_id` INT PRIMARY KEY,
  `topic_name` VARCHAR,
  `description` TEXT,
  `num_sessions` INT,
  `mentor_id` INT
);

CREATE TABLE `tasks` (
  `task_id` INT PRIMARY KEY,
  `topic_id` INT,
  `task_name` VARCHAR,
  `description` TEXT,
  `deadline` DATE
);

CREATE TABLE `attendance` (
  `attendance_id` INT PRIMARY KEY,
  `user_id` INT,
  `topic_id` INT,
  `session_date` DATE,
  `status` VARCHAR
);

CREATE TABLE `company_drive` (
  `drive_id` INT PRIMARY KEY,
  `company_name` VARCHAR,
  `drive_date` DATE,
  `description` TEXT
);

CREATE TABLE `user_company_drive_attendance` (
  `user_drive_attendance_id` INT PRIMARY KEY,
  `user_id` INT,
  `drive_id` INT
);

CREATE TABLE `capstone` (
  `capstone_id` INT PRIMARY KEY,
  `user_id` INT,
  `project_name` VARCHAR,
  `description` TEXT
);

CREATE TABLE `queries` (
  `query_id` INT PRIMARY KEY,
  `student_id` INT,
  `mentor_id` INT,
  `topic_id` INT,
  `question` TEXT,
  `answer` TEXT
);

CREATE TABLE `portfolio_submission` (
  `submission_id` INT PRIMARY KEY,
  `student_id` INT,
  `capstone_id` INT,
  `submission_date` DATE,
  `github_url` VARCHAR,
  `portfolio_url` VARCHAR,
  `resume_url` VARCHAR
);

CREATE TABLE `mock_interviews` (
  `interview_id` INT PRIMARY KEY,
  `interview_date` DATE,
  `description` TEXT
);

CREATE TABLE `student_mock_interviews` (
  `student_interview_id` INT PRIMARY KEY,
  `student_id` INT,
  `interview_id` INT,
  `attendance_date` DATE,
  `score_out_of_5` DECIMAL(3, 2)
);

ALTER TABLE `students` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `mentors` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `topics` ADD FOREIGN KEY (`mentor_id`) REFERENCES `mentors` (`mentor_id`);

ALTER TABLE `tasks` ADD FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

ALTER TABLE `attendance` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `attendance` ADD FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

ALTER TABLE `user_company_drive_attendance` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `user_company_drive_attendance` ADD FOREIGN KEY (`drive_id`) REFERENCES `company_drive` (`drive_id`);

ALTER TABLE `capstone` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `queries` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `queries` ADD FOREIGN KEY (`mentor_id`) REFERENCES `mentors` (`mentor_id`);

ALTER TABLE `queries` ADD FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

ALTER TABLE `portfolio_submission` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `portfolio_submission` ADD FOREIGN KEY (`capstone_id`) REFERENCES `capstone` (`capstone_id`);

ALTER TABLE `student_mock_interviews` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `student_mock_interviews` ADD FOREIGN KEY (`interview_id`) REFERENCES `mock_interviews` (`interview_id`);
