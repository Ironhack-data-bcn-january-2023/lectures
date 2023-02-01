USE employees;

-- Selecting EVERYTHING at once
SELECT * FROM departments;

SELECT * 
	FROM departments; -- same, in two lines

-- Selecting SOME columns at once
SELECT birth_date, first_name
	FROM employees;
    
SELECT BIRTH_DATE, first_name
	FROM EMployees; -- not case sensitive
	
-- Using an alias
SELECT birth_date as DOB, first_name
	FROM employees;
    
-- Using alias: dones't change original table
SELECT birth_date as DOB, first_name as name, hire_date
	FROM employees;

-- Using a filter 
SELECT first_name, last_name, gender
	FROM employees
	WHERE first_name = "Parto";

-- df[[first_name, last_name, gender]] & last_name == "Parto"

-- case_sensitive
SELECT first_name, last_name, gender
	FROM employees
	WHERE first_name = "parto";  -- 228results -- it retrieves capitalized values when querying lowercase

SELECT first_name, last_name, gender
	FROM employees
	WHERE first_name = "parto" AND gender = "F"; -- 87results
    
    -- Every "Bezalel" that is a woman AND anyone that is a man
    SELECT first_name, last_name, gender
		FROM employees
			WHERE (first_name = "Bezalel" AND gender = "F")
				OR gender = "M";
    
    -- parentheses for readiblity and also logic

-- Hugo, Mark, Ramzi, Mayuko

-- select (3 columns)
	-- from table employees
    -- where name is either: hugo
    -- or mark
    -- (...)

select first_name, last_name, gender
	from employees
    where first_name = "Hugo"
		or first_name = "Mark"
        or first_name = "Ramzi"
        or first_name = "Mayuko";
        
-- AND operator
-- IN operator

SELECT first_name, last_name, gender
	FROM employees
    WHERE first_name IN ("Hugo", "Mark", "Mayuko", "Ramzi");

-- NOT IN

SELECT first_name, last_name, gender
	FROM employees
    WHERE first_name NOT IN ("Hugo", "Mark", "Mayuko", "Ramzi");
    

-- Anna, Anneke, Ana, etc

SELECT * FROM employees 
	WHERE first_name LIKE("an%");
    
-- María Ana -- doesn't work
-- Ana María -- works

-- How to get anyone who's second name would be Ana
SELECT * FROM employees 
	WHERE first_name LIKE("% ana");
    
-- Ana María, González Rodríguez
SELECT * FROM employees 
	WHERE first_name LIKE("%ana%"); -- MasANAo
    
-- % is a wildcard operator that covers for anything for strings
-- *: everything, columns
-- bash: "*.csv" -> everything that ends with csv


-- wildcard for one character
SELECT * FROM employees 
	WHERE first_name LIKE("An___"); -- Angel/Anwar/Angus/An___
    
-- escaping a reserved character in a LIKE command: ~ (?)
-- https://stackoverflow.com/questions/712580/list-of-special-characters-for-sql-like-clause
    
SELECT * FROM employees 
	WHERE first_name LIKE("An%"); -- Ana/Ane/Ann/Annna/Annnnna
    
-- _an%
-- Tanya, Daniel, Bansky
SELECT *
	FROM employees
    WHERE first_name LIKE("_an%");
    
-- Men have been born in 1955
SELECT * 
	FROM employees
    WHERE birth_date LIKE("1955%")
		AND gender = "M";
        
-- Everyone born in the 60s: range

SELECT birth_date, first_name
	FROM employees
    WHERE birth_date >= "1960-01-01" 
		AND birth_date < "1970-01-01";
        
        
-- SELECT birth_date, first_name
	-- FROM employees
    -- WHERE "1960-01-01" < birth_date <= "1970-01-01";
    
SELECT birth_date, first_name
	FROM employees
		WHERE birth_date BETWEEN "1960-01-01" AND "1970-01-01";
    
SELECT * 
	FROM salaries
		WHERE salary BETWEEN 70000 AND 80000;
		
		
USE employees;	
SELECT * FROM employees
	WHERE first_name BETWEEN "A" AND "D"
    ORDER BY first_name;
    
-- D not included: A, B, C

-- doesnt work for ranges like this one :/
SELECT * FROM employees
	WHERE first_name > "A" AND first_name <= "D"
    ORDER BY first_name DESC;
    
SELECT * 
	FROM employees	
    WHERE birth_date IS NOT NULL;

-- Total amount of salaries?


SELECT SUM(salary)
	FROM salaries
    WHERE salary > 50000;
    
-- If you want to look at deparments: join, groupby, sum

SELECT * FROM SALARIES;

SELECT salary, (salary * 0.85 + 1000)
	FROM salaries;
    
-- Pandas: result is SAVED into the df
-- df["aftertax"] = df.salary.apply(lambda x: x*0.85 + 1000)
-- df[["salary", "aftertax"]]

-- Result here is not saved
SELECT salary, (salary * 0.85 + 1000) AS aftertax
	FROM salaries;
    
-- 1. all the salaries of everyone in the 90s

SELECT SUM(salary)
	FROM salaries
    WHERE from_date 
		LIKE "199%"; -- 90's
    
-- 2. ONWARDS
SELECT SUM(salary)
	FROM salaries
    WHERE from_date >= "1990-01-01" -- 90's
    
SELECT AVG(salary)
	FROM salaries;
    
SELECT ROUND(AVG(salary)) as "mean salary"
	FROM salaries; 

SELECT ROUND(AVG(salary)) as `mean salary`
	FROM salaries; 
    
SELECT ROUND(AVG(salary)) as mean_salary
	FROM salaries; 
    
-- How many people joined the company after the 90's: 135k
SELECT 	COUNT(emp_no)
	FROM employees
    WHERE hire_date >= "1990-01-01";
    
select * from departments;

-- len(df.column.unique())
SELECT COUNT(DISTINCT dept_name)
	FROM departments; -- 9 departments
    
-- What is the most frequent name?
SELECT first_name, COUNT(first_name) as my_count
	FROM employees
		GROUP BY first_name
	ORDER BY my_count DESC;

-- COLUMNS
-- TABLE
-- CONDITION

SELECT first_name, last_name
	FROM table
		WHERE condition = "something else"
        
-- Multiple conditions: AND, OR; more conditions (a AND B) or C

-- DISTINCT (for unique values)
-- ORDER BY

-- Aggregation functions
	-- COUNT
	-- SUM ()
	-- AVG()
    
-- GROUPBY: how frequent the names are
	-- SELECT first_name, COUNT(first_name) as count
	-- 	FROM employees
		--  GROUP BY first_name
		-- ORDER BY count DESC;

-- GROUPBY & ORDER BY: more than one variable
-- patterns: LIKE("%, _, __")
-- DATES: BETWEEN, >=, "1900-01-01"


SELECT first_name, last_name FROM employees;

SELECT CONCAT(first_name, " ", last_name) as full_name
	FROM employees;
    
SELECT * FROM salaries;

-- New column as result of two other columns
SELECT (emp_no + salary) as random_calculation
	FROM salaries;
    
-- temporary table, view -> result of subqueries (or just queries)

-- WHERE & HAVING

SELECT *
	FROM employees
		WHERE hire_date >= "1999-01-01"; -- 1527 results
        
SELECT *
	FROM employees
		HAVING hire_date >= "1999-01-01"; -- 1527 results

SELECT first_name, COUNT(first_name) as COUNT
	FROM employees
    WHERE hire_date LIKE("1986%")
		GROUP BY first_name
    ORDER BY COUNT DESC;



-- Get only those names that happen more than 20 times
SELECT first_name, COUNT(first_name) as COUNT
	FROM employees
    WHERE hire_date LIKE("1986%")
		GROUP BY first_name
	HAVING COUNT >= 20
    ORDER BY COUNT DESC;
        
-- The top 3 most repeated names
-- Hired in 1986
-- As long as they are repeated more than 20 times
         -- Limit: 3
SELECT first_name, COUNT(first_name) as COUNT
	FROM employees
    WHERE hire_date LIKE("1986%")
		GROUP BY first_name
	HAVING COUNT >= 20
    ORDER BY COUNT DESC
    LIMIT 3;