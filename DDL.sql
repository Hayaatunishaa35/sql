create database if not exists ddl;
use ddl;

create table account(
id int primary key,
name varchar(225) unique,
balance int not null default 0
-- constraint acc_balance_chk check(balance>1000)
);

insert into account (id,name,balance) values
					(1,'A',100000);
                    
insert into account (id,name,balance) values                    
                    (2,'B', 100);

drop database if exists ddl;

insert into account (id,name,balance) values
					(1,'A',3000),
                    (2,'b',3000);
                    
insert into account (id,name,balance) values
					(3,'d',3000),
                    (5,'e',3000);
                    
insert into account (id,name) values                    
                    (4,'c');
        
        
        
-- Alter
-- Add new col
alter table account add interest float not null default 0;

-- alter the datatype
alter table account modify interest double not null default 0;

-- when desc is not used with order by , it is used to describe the entity
desc account;

-- change column - reanme the column
alter table account change column interest savin_interest double not null default 0;

-- drop / remove column
alter table account drop column savin_interest;

-- rename the table
alter table account rename to account_details;
select * from account;
select * from account_details;
