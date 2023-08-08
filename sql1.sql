-- CREATE DATABASE temp;

-- USE temp;

-- CREATE TABLE student (
-- id INT PRIMARY KEY,
-- name VARCHAR(255)
-- );

-- INSERT INTO student VALUES(1, 'Hayat');
-- INSERT INTO student VALUES(2, 'Ifra');
-- SELECT * FROM student;

-- DROP DATABASE IF EXISTS hayatunisha;

-- printing multiple columns
SELECT FIRST_NAME, SALARY FROM Worker;


-- dummy table without from keyword
SELECT 44+11;

SELECT now();

-- useful keywords
SELECT * FROM Worker WHERE SALARY >=100000;

SELECT * FROM Worker WHERE DEPARTMENT = 'HR';

SELECT * FROM Worker WHERE SALARY BETWEEN 80000 AND 100000;

SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin';

SELECT * FROM Worker WHERE DEPARTMENT IN ('HR', 'Admin');

SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR', 'Admin');

select * from Worker where salary is null;

-- wildcard
select * from Worker where name like '%i%';
select * from Worker where name like '_i%';

-- sorting
select * from Worker order by salary desc;
select * from Worker order by salary asc;
select * from Worker order by salary;

-- grouping
-- group the worker based on department
select department from worker group by department; -- output will be same as distinct beacuse we havent used aggregation like : count(), avg(), min(), max()

select department, count(*) from worker group by department;

-- find the avg salary in each department
select department, avg(salary) from worker group by department;

-- find the minimum salary in each department
select department, min(salary) from worker group by department;


-- Having
select department, count(department) from worker group by department having count(department)>2;
