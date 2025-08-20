--Assignmnet

--1
use [314local];
declare @str varchar(50)='A&789AHEW37';
declare @i int=1;
declare @ch varchar;
declare @result varchar(50)='';
while @i<=len(@str)
begin
    set @ch=substring(@str,@i,1);
     if @ch like '[0-9]'
 
         set @result=@result+@ch;
    set @i=@i+1;
end;
    select @result ;

--2

select datediff(year,'2002-06-03',getdate()) as age;
--select datediff(year,'2002-06-03','2026-01-01');

--3

create table err(id int ,val int, err_col as cast('dgjhf' as int));
insert into err(id,val) values(1,10),(2,20),(3,40),(4,30);
select * from err;
select id,val from err;
select err_col from err;

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
select datepart(weekday,dob) as day_of_week from da--day of week(1-7)
select datepart(month,dob) as month_of_year from da;--month of year
select datepart(day,dob) as day_of_month from da;-- day of month

select datediff(day,'2024-12-31','2025-12-31') as day_of_year;--day of year(1-365/366)
select datediff(week,'2016-12-31','2017-03-03') as week_of_year;-- week of year(1-52/53)
select datepart(weekday,'2017-02-11');--day of week(1-7)
select datepart(month,'2017-07-23');--month of year
select datepart(day,'2017-07-23');-- day of month

--5

create table em(emp_id int primary key,emp_name varchar(20),manager_id int foreign key(manager_id) references em(emp_id));

insert into em(emp_id,emp_name,manager_id)
values(1,'sameer',null),(2,'saaki',1),(3,'srinu',2),(4,'sampath',2),(5,'damodar',2),(6,'sam',3),(7,'ran',4),(8,'you',5);

with emh as (
select emp_id, emp_name, manager_id
from em
where manager_id is null
union all
select e.emp_id, e.emp_name, e.manager_id
from em e
join emh eh on e.manager_id = eh.emp_id
)
select * from emh;