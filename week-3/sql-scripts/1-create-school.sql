-- 1. CREATE DATABASE
DROP DATABASE IF EXISTS school;
CREATE DATABASE IF NOT EXISTS school;
USE school;

-- 2. CREATE TABLES
CREATE TABLE IF NOT EXISTS teacher (
	teacher_id INT PRIMARY KEY,
	first_name VARCHAR(40) NOT NULL,
	language_1 VARCHAR(3) NOT NULL,
	language_2 VARCHAR(3) NOT NULL,
	dob DATE, 
	tax_id INT UNIQUE,
	phone_no VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS client (
	client_id INT PRIMARY KEY,
    client_name VARCHAR(20) NOT NULL,
    address VARCHAR(20),
    industry VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS participant(  -- student 
	participant_id INT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    phone_no VARCHAR(20),
    client INT -- This will the Foreign key from client
);

CREATE TABLE IF NOT EXISTS course (
	course_id INT PRIMARY KEY,
    course_name VARCHAR(20) NOT NULL, 
    language CHAR(3) NOT NULL, -- ENG / ESP
    level CHAR(2) NOT NULL, 	-- B1
    course_length_weeks INT,
    start_date DATE,
    in_school BOOLEAN, 
    teacher INT,
    client INT
);

-- 3. ALTER TABLES: adding foreign keys

-- 3.1. Altering participant table: client column
ALTER TABLE participant
	ADD FOREIGN KEY (client) -- in participants table
REFERENCES client(client_id) -- primary key on client table
ON DELETE SET NULL;

-- 3.2. Altering COURSE table: teacher column
ALTER TABLE course
	ADD FOREIGN KEY (teacher) -- on course table
REFERENCES teacher(teacher_id)-- pk on teacher table
ON DELETE CASCADE;

-- 3.3. Altering COURSE table: client column
ALTER TABLE course
	ADD FOREIGN KEY (client) -- on course table
REFERENCES client(client_id)-- pk on client table
ON DELETE CASCADE;

-- 3.4. TAKESCOURSE: primary key (combination of two)
CREATE TABLE takes_course (
	participant_id INT,
    course_id INT,
    PRIMARY KEY(participant_id, course_id),
		FOREIGN KEY (participant_id) REFERENCES participant(participant_id),
        FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- 4. POPULATE
INSERT INTO	teacher (teacher_id, first_name, language_1, language_2)
VALUES (1, Mica, ESP, ENG);

INSERT INTO teacher VALUES
(2, name, ess, cat, 1980-01-05, 67897, 9876),
(3, ddfdfdf, ess, cat, 1980-01-05, 678970, ddd),
(4, hellooo, ess, cat, 1980-01-05, 678971, 987dd6);

-- 5. MODIFYING THE DATA

-- 5.1. Delete
DELETE FROM teacher WHERE teacher_id = 1;

-- 5.2. UPDATE

UPDATE teacher
SET first_name = Mariona
WHERE teacher_id = 2;