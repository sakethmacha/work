create table student(id int,name varchar(20),age int);
insert into student(id,name,age)
values(1,'saaki',23),
(2,'saketh',23),
(3,'srinivas',24),
(4,'shirisha',25),
(5,'vilva priya',16),
(6,'laxmi swaroopa',12);
select * from student where id=6;
update student
set name='salaar'
where id=2;
select name from student where id=1;
create table employee(id int,name varchar(20),gender varchar(10),age int);
insert into employee(id,name,gender,age)
values(11,'sankalp','male',25),
(12,'mani','mali',24),(13,'sanjana','female',23),(14,'sanjai','male',23),(15,'kiara','female',33);
select * from employee;
create table employees(id int identity(1,1) primary key,name varchar(20));
insert into employees(name)
values('saketh'),
('saaki'),
('srinivas');
select * from employees;
select * into worker from employee;
select * from worker;
select * into gang from worker where 1=0;
select * from gang;
create table name(first_name varchar(20),last_name varchar(20),full_name as (first_name+' '+last_name));
insert into name(first_name,last_name)
values('saketh','macha'),
('saaki','macha');
select * from name;
update worker
set name='sahadev'
where age=23;
create table mul(a int,b int,c as a*b);
insert into mul(a,b)
values(2,3),(3,4),(4,5),(5,6);
select * from mul;
select * from employee;
select id,name from employee;
select * into emp from employees;
select * from emp;
insert into emp values('hello');
select * from emp;
insert into emp values('srinu');
create table cred(id int primary key,name varchar(20),password varchar(20));
insert into cred(id,name,password)
values(1,'saketh','saaki'),
(2,'saaki','saketh');
select * from cred;
select * into cred2 from cred;
select * from cred2;
insert into cred2 values(1,'sameer','sankalp');
select * from cred2;
insert into cred values(3,'sameer','sankalp');
alter table student
add department varchar(20);
select * from student;
update student
set department ='mpc'
where name='salaar';
update student
set department='bipc'
where name='srinivas' or name='shirisha';
select department,sum(age) from student
group by Department;
select * from student
order by id desc;
select distinct department,name,id,age
from student;
insert into student values(1,'eddi',25,'cec');
select * from student;
insert into student values(2,'salaar',23,'mpc');
select isnull(department,'cec') from student;
select * from student;
select * from student
where age between 20 and 30;
select * from student
where name like '_a%';
select * from student
where department in('mpc','cec');
select * from student
where department is null;
SELECT department, COUNT(*) AS num_employees
FROM student
WHERE age > 23
GROUP BY department
HAVING COUNT(*) > 0
ORDER BY num_employees DESC;
select * from student
where age>20;


SET STATISTICS TIME ON;
SET STATISTICS IO ON;
select * from student where id=1;
select id,name from student where id=11;
insert into student(id,name,age,department)
values(7,'qwerty',34,'mpc'),
(8,'asdfg',35,'bipc'),(9,'zxcv',32,'cec'),(10,'poiuy',31,'cec'),(11,'dfghj',29,'ca'),(12,'rfv',28,'bipc');
CREATE TABLE student_manual (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    email NVARCHAR(100),
    address NVARCHAR(200)
);
INSERT INTO student_manual (id, name, email, address)
VALUES
(1, 'Alice', 'alice@example.com', '123 Apple St'),
(2, 'Bob', 'bob@example.com', '456 Banana Rd'),
(3, 'Charlie', 'charlie@example.com', '789 Cherry Ln'),
(4, 'David', 'david@example.com', '321 Date Blvd'),
(5, 'Eva', 'eva@example.com', '654 Elm St'),
(6, 'Frank', 'frank@example.com', '987 Fig Ave'),
(7, 'Grace', 'grace@example.com', '741 Grape Dr'),
(8, 'Hannah', 'hannah@example.com', '852 Honey St'),
(9, 'Ian', 'ian@example.com', '963 Ivy Rd'),
(10, 'Jane', 'jane@example.com', '159 Juniper Way');
select * from student_manual where id=1;
select * from student_manual where id=10;
alter table student
add constraint pk primary key (id);
select * from student;
insert into student(id,name,age,department)
values(1,'s',34,'dd');

select * from student;
select ascii('AB');
select ltrim('    saketh              ');
select rtrim('     saketh              ');
select charindex('eth','saketh');
select concat('sql','server');
select concat('     ','s');
select format(getdate(),'dd-mm-yyyy');--
select left('saketh',3);--index included
select right('saketh',3);-- index excluded
select len('saketh');
select patindex('%e%','hello');
select patindex('%j%','hello');
select replicate('1',6);
select replace('saketh reddy','reddy','macha');
select reverse('saketh');
select stuff('hello',2,1,'i');--replace character, length to replace
select substring('hello',2,3);-- start index, length of substring from starting index
sp_helpindex 'student_manual';
select dateadd(month,5,'2025-08-18');
select dateadd(day,11,'2025-08-18');
select datepart(month,'2025-08-18');
select year(getdate());
select month(getdate());
select day('2025-08-27');
create nonclustered index i on student_manual(email);
create nonclustered index ii on student_manual(email) include(name,address);
select name,address from student_manual where email='frank@example.com';
set statistics time on;
set statistics io on;
drop index i on student_manual;
select current_timestamp;
select getdate();
select datename(month,getdate());
select datename(weekday,getdate());--monday
select datepart(month,getdate());
select datepart(weekday,getdate());--monday-2 default
select datediff(weekday,'2025-08-18','2026-05-30');--return difference between dates
select eomonth(getdate());
select isdate(getdate());
select isdate('18-08-2025');--0
select isdate('2025-08-18');--1
select isdate('2025/08/18');--1
select isdate('2025/18/08');--0
select * from student;
select avg(age) from student;
select avg(id) from student;
select count(age) from student;
select count(name) from student;
select count(*) from student;
select min(age) min from student;
select max(age) max from student;
select sum(age) sum from student;
select count_big(age) from student;
select count(department) from student;
select count_big(department) from student

--Assignmnet

--1

select 

--2

select datediff(year,'2002-06-03',getdate() as age;
select datediff(year,'2002-06-03','2026-01-01');

--3




--4

create table d(dob date);
insert into d(dob)
values('2025/12/31');
create table da(dob date);
insert into da(dob)
values('2025/12/31');
insert into da(dob)
values('2024/12/31'),('2023/12/30'),('2017/01/01'),('2002/06/03');
select * from da;

--select datediff(day,'2024-12-31',(select * from da)) as day_of_year;
select datediff(day,cast(concat(year(dob)-1,'/12','/31') as date),dob) as day_of_year from da;--day of year(1-365/366)
select datediff(week,cast(concat(year(dob)-1,'/12','/31') as date),dob) as week_of_year from da;-- week of year(1-52/53)
select datepart(week,dob) as day_of_week from da-- week of year(1-52/53)
select datepart(weekday,dob) as day_of_week from da--day of week(1-7)
select datepart(week,dob) as day_of_week from da
select datepart(month,dob) as month_of_year from da;--month of year
select datepart(day,dob) as day_of_month from da;-- day of month

select datediff(day,'2024-12-31','2025-12-31') as day_of_year;--day of year(1-365/366)
select datediff(week,'2016-12-31','2017-03-03') as week_of_year;-- week of year(1-52/53)
select datepart(weekday,'2017-02-11');--day of week(1-7)
select datepart(month,'2017-07-23');--month of year
select datepart(day,'2017-07-23');-- day of month

--5


--
CREATE TABLE sale (
    sale_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    region VARCHAR(50),
    sale_amount DECIMAL(10, 2),
    sale_date DATE
);
INSERT INTO sale (sale_id, employee_name, region, sale_amount, sale_date)
VALUES 
(1, 'Alice', 'North', 1000.00, '2025-08-01'),
(2, 'Bob', 'North', 1500.00, '2025-08-02'),
(3, 'Alice', 'North', 2000.00, '2025-08-03'),
(4, 'Charlie', 'South', 1200.00, '2025-08-01'),
(5, 'David', 'South', 3000.00, '2025-08-02'),
(6, 'Alice', 'North', 1800.00, '2025-08-05'),
(7, 'Charlie', 'South', 700.00, '2025-08-06'),
(8, 'Bob', 'North', 2200.00, '2025-08-06'),
(9, 'David', 'South', 4000.00, '2025-08-07'),
(10, 'Bob', 'North', 1000.00, '2025-08-09');
INSERT INTO sale (sale_id, employee_name, region, sale_amount, sale_date)
VALUES 
(11, 'Alice', 'South', 1000.00, '2025-08-01');
SELECT employee_name, SUM(sale_amount) AS total_sales
FROM sale
GROUP BY employee_name
HAVING SUM(sale_amount) > 3000;
select sale_date,sum(sale_amount) as total
from sale
group by sale_date
having sum(sale_amount)>2000;
select sale_date,employee_name,sum(sale_amount)
from sale
group by sale_date,employee_name;
select sale_date,employee_name,sum(sale_amount)
from sale
group by rollup (sale_date,employee_name);
select sale_date,sum(sale_amount) as total
from sale
group by rollup(sale_date);
select sale_date,sum(sale_amount) as total
from sale
group by sale_date;
select sale_date,employee_name,sum(sale_amount)
from sale
group by cube (sale_date,employee_name);
select sale_date,sum(sale_amount) as total
from sale
group by cube(sale_date);
select * from sale;
SELECT 
    sale_id,
    employee_name,
    region,
    sale_amount,
    max(sale_amount) OVER (PARTITION BY region) AS region_total
FROM sale;
SELECT 
    sale_id,
    employee_name,
    region,
    sale_amount,
    sum(sale_amount) OVER (partition by employee_name) AS region_total
FROM sale;
select employee_name, region, sale_amount,
       ROW_NUMBER() over (partition by region order by sale_amount desc) as row_num
from sale;
select employee_name, region, sale_amount,
       Rank() over (partition by region order by sale_amount desc) as row_num
from sale;
select employee_name, region, sale_amount,
       dense_rank() over (partition by region order by sale_amount desc) as row_num
from sale;
select employee_name, region, sale_amount,
       ntile(6) over (partition by region order by sale_amount desc) as row_num
from sale;
select employee_name, region, sale_amount,first_value(sale_amount) over(partition by region order by sale_amount desc) as first_value
from sale;
select employee_name, region, sale_amount,first_value(sale_amount) over(order by sale_amount desc) as first_value
from sale;   
select employee_name, region, sale_amount,last_value(sale_amount) over(partition by region order by sale_amount desc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last_value
from sale;
select employee_name, region, sale_amount,nth_value(sale_amount,2) over(partition by region order by sale_amount desc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last_value
from sale;
select * from(select *,rank() over(partition by region order by sale_amount desc) as rn from sale) as sale2 where rn=2;
select *,lag(sale_amount) over(partition by region order by sale_amount desc) from sale;
select *,lag(sale_amount,2,10000) over(partition by region order by sale_amount desc) from sale;
select *,lead(sale_amount) over(partition by region order by sale_amount desc) from sale;
with sale3 as(
select *,rank() over(partition by region order by sale_amount desc) as rn from sale)
select * from sale3;
with sale3 as(
select *,count(region) over(partition by region) as count from sale)
select * from sale3;
with sale3 as(
select region,count(region)as count 
from sale
group by region)
select * from sale3;

create table em(emp_id int primary key,emp_name varchar(20),manager_id int foreign key(manager_id) references em(emp_id));

insert into em(emp_id,emp_name,manager_id)
values(1,'sameer',null),(2,'saaki',1),(3,'srinu',2),(4,'sampath',2),(5,'damodar',2),(6,'sam',3),(7,'ran',4),(8,'you',5);

with emh as (
select emp_id, emp_name, manager_id,1 as level
from em
where manager_id is null
union all
select e.emp_id, e.emp_name, e.manager_id,eh.level+1
from em e
join emh eh on e.manager_id = eh.emp_id
)
select * from emh; 
set statistics time on;
set statistics io on;
select * from em
union all
select * from em;
select * from em
intersect
select * from em;
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
select * from table1;

create table table2(id int,name varchar(20),dep varchar(20));
insert into table2(id,name,dep)
values(5,'saketh','ece'),(6,'srinivas','civil'),
(7,'shirisha','cse'),(8,'priya','it'),(9,'vilva','mech'),
(10,'laxmi','cse');
insert into table2(id,name,dep)
values(11,'saketh','ece'),(12,'srinivas','civil'),
(13,'shirisha','cse'),(8,'priya','it'),(9,'vilva','mech'),
(10,'laxmi','cse');

select * from table1
union
select * from table2;

select * from table1
union all
select * from table2;

select * from table2
except
select * from table1;

select * from table1
intersect
select * from table2;
insert into table1(id,name,dep)
values(9,'zurich','ece'),(10,'surosh','it'),(11,'sarosh','eee'),
(12,'sarrosh','ece'),(13,'sourish','civil');
 select name from table1
 where soundex(name)=soundex('suresh');