--Assignment 2

--1

create table table1(id int,name varchar(20),dep varchar(20));
insert into table1(id,name,dep)
values(1,'saketh','ece'),(2,'srinivas','civil'),
(3,'shirisha','cse'),(4,'priya','it'),(5,'vilva','mech'),
(6,'laxmi','cse');
insert into table1(id,name,dep)
values(7,'ramesh','ece'),(8,'rakesh','civil'),
(9,'saketh','cse');
insert into table1(id,name,dep)
values(7,'siroosh','ece');
insert into table1(id,name,dep)
values(9,'zurich','ece'),(10,'surosh','it'),(11,'sarosh','eee'),
(12,'sarrosh','ece'),(13,'sourish','civil');
insert into table1(id,name,dep)
values(9,'sureshchandra','ece'),(10,'sureshwar','it');
select * from table1;

select name from table1
 where soundex(name)=soundex('suresh');

 select Name,difference(Name, 'suresh') AS similarity_score
from table1
where  soundex(name)=soundex('suresh')
order by similarity_score desc;

--solution
select Name,difference(Name, 'suresh') AS similarity_score
from table1
order by similarity_score desc;


--2

with tempmax as(
           select *,dense_rank() over(order by salary desc) as rn
           from lec
)
select * from tempmax where rn=2;

--3

create table lec(id int,name varchar(20),salary int,dep varchar(20));
insert into lec(id,name,salary,dep)
values(1,'sameer',10000,'ece'),
       (2,'rahul',20000,'cse'),
       (3,'ramya',15000,'ece'),
       (4,'hamsa',12000,'cse'),
       (5,'raj',25000,'it'),
       (6,'laxmi',22000,'mech'),
       (7,'shirisha',30000,'it'),
       (8,'srinu',35000,'civil'),
       (9,'saketh',40000,'mech'),
       (10,'amar',40000,'civil');

select dep,max(salary) as max_salary from lec
group by dep;

--4

create table maxi(numbers int);
insert into maxi(numbers)
values(7859),(6897),(9875),(8659),(7600),(7550);

with temaxi as(
    select *,dense_rank() over(order by numbers desc) as rn
    from maxi
)
select * from temaxi where rn=1;

--5

create table emp_details(
     emp_id int,
     emp_name varchar(20),
     emp_designation varchar(20),
     emp_age int);
     insert into emp_details values(310,'pradeep','hr',36),
    (311,'ashok','manager',28),
    (312,'pavan kumar','developer',25),
    (313,'santhosh','manager',28),
    (314,'tharun','designer',26);

    select * from emp_details where emp_designation='manager';
