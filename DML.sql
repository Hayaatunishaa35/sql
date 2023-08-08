CREATE DATABASE DML;
SHOW DATABASES;
USE DML;

CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);


-- insert first way 
INSERT INTO Worker
	(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES
    (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
    (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
    (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
    (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
    (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
    (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
    (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
    (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
    
    
    
CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE DATETIME,
FOREIGN KEY(WORKER_REF_ID)
	REFERENCES Worker(WORKER_ID)
    ON DELETE CASCADE
);

INSERT INTO Bonus
	(WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE) VALUES
    (001, 5000, '16-02-20'),
    (002, 3000, '16-06-11'),
    (003, 4000, '16-02-20'),
    (001, 4500, '16-02-20'),
    (002, 3500, '16-06-11');
    

CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(10),
AFFECTED_FROM DATETIME,
FOREIGN KEY(WORKER_REF_ID)
	REFERENCES Worker(WORKER_ID)
    ON DELETE SET NULL
);

INSERT INTO Title
	(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM) VALUES
    (001, 'Manager', '2016-02-20 00:00:00'),
    (002, 'Executive', '2016-06-11 00:00:00'),
    (008, 'Executive', '2016-06-11 00:00:00'),
    (005, 'Manager', '2016-06-11 00:00:00'),
    (004, 'Manager', '2016-06-11 00:00:00'),
    (007, 'Executive', '2016-06-11 00:00:00'),
    (006, 'Lead', '2016-06-11 00:00:00'),
    (003, 'Lead', '2016-06-11 00:00:00');

-- insert second way     
insert into worker values (009,'kfjd','kfhjd',8593,'14-04-11 09.00.00', 'Admin');
-- other values will be null
insert into worker (worker_id,first_name) values (0320993,'skjdfk');


-- update
update worker set first_name = 'hayat', last_name = 'hayat', salary = '1000000000' where worker_id = 001;

-- update multiple rows
set sql_safe_updates = 0; -- disabling safe updates, if enable you cant edit,update or delete a whole touple or large number of data
update worker set last_name = 'hayat';
update worker set salary = salary+1000;

set sql_safe_updates = 1;  -- set it to one after use


-- delete 
delete from worker where worker_id in (002,003);

set sql_safe_updates = 0; -- now we want to delete a whole table
delete from worker;
set sql_safe_updates = 1; 



-- on delete cascade
delete from worker where worker_id = 2; -- the entry in bonus table corresponding to id = 2 will also be deleted due to the use of ON DELETE CASCADE in foreign key
 
-- on delete set null
delete from worker where worker_id = 3; -- the entry in title table corresponding to id = 3 will be set to null due to the use of ON DELETE set null in foreign key


--  replace

-- if data is present, it will replace it
replace into worker (worker_id,first_name) values (005,'modi');

-- if data is not present, it will insert it
replace into worker (worker_id, first_name) values (8760,'dshfjd');
replace into worker set worker_id = 0010, first_name = 'rajat';


SELECT * FROM worker;
drop database if exists org1;