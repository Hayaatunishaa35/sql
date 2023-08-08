create database joins;
use joins;

create table parent(
	pk int not null primary key,
    col1 int,
    col2 int,
    col3 int
);
insert into parent (pk,col1,col2,col3) values
					(1,100,200,300),
                    (2,400,500,600),
                    (3,700,800,900),
                    (4,1000,1100,1200),
                    (5,1300,1400,1500),
                    (6,1600,1700,1800),
                    (7,1900,2000,2100);
                    
create table child1(
	pk int,
    col1 int,
    col2 int,
    col3 int
);

insert into child1 (pk,col1,col2,col3) values
                    (2,400,500,600),
                    (3,700,800,900),
                    (4,1000,1100,1200),
                    (7,1900,2000,2100);
create table child2(
	pk int,
    col1 int,
    col2 int,
    col3 int
);

insert into child2 (pk,col1,col2,col3) values
                    (2,400,500,600),
                    (3,700,800,900),
                    (5,1300,1400,1500),
                    (6,1600,1700,1800);
                    

-- inner join
select parent.*, child1.* from parent inner join child1 on parent.pk=child1.pk;           

-- outer join->left join(left table ki sari values hongi hi hongi)
select parent.pk, parent.col1, parent.col2, child2.col3 from parent left join child2 on parent.pk=child2.pk;

-- alias -> use of as
-- the above query can be reduced to 
select p.pk,p.col1,p.col2,c.col3 from parent as p left join child2 as c on p.pk = c.pk;
-- outer join->right join
select child1.pk, parent.col1, child1.col1 from parent right join child1 on parent.pk=child1.pk;

-- outer join->full join
-- no keyword for full join so we need to use UNION
select child1.*, child2.* from child1 left join child2 on child1.pk=child2.pk
union
select child1.*, child2.* from child1 right join child2 on child1.pk=child2.pk;
select * from parent;

-- cross join _>list out all the combinations of joins
select child1.*, child2.* from child1 cross join child2 ;

-- self join




-- join without using join keyword
select child1.*, child2.* from child1 , child2 where child1.pk=child2.pk;


drop table if exists child1;
drop database if exists joins;