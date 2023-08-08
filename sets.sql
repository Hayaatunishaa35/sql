
-- the columns must be same for set operations
create database if not exists sets;
use sets;

create table dept1(
 empid int,
 name varchar(25),
 role varchar(25)
);

create table dept2(
empid int,
name varchar(25),
role varchar(25)
);

insert into dept1 (empid,name,role) values
				(1,'A','engineer'),
                (2,'B','salesman'),
                (3,'C','manager'),
                (4,'D','salesman'),
                (5,'E','engineer');
                
insert into dept2 (empid,name,role) values
                (3,'C','manager'),
                (6,'F','marketing'),
                (7,'G','salesman');
                

-- union
-- dept1 U dept2
select * from dept1
union
select * from dept2;                
                
                
-- No keyword for intersect or minus so we need to emulate
-- Intersect
-- dept1 ^ dept2

select dept1.* from dept1 inner join dept2 using (empid);

-- minus
-- dept1-dept2
select dept1.* from dept1 left join dept2 using (empid)
where dept2.empid is null;-- making right table parameter as null
