
select top(3)*
from Student

select top(3) st_fname from Student

--------------------------------
select top(2) salary
from Instructor
order by Salary desc
----------------------------------

select top(3) with ties*
from student
order by st_age desc


select top(3)*
from student
order by  newid()

select * into tab6
from student


insert into tab5
values (15,'ali')


insert into tab5
select St_Id,St_Fname from student


select sum(salary)
from Instructor
having count (Ins_Id)>16


select dname from Company_SD.dbo.Departments
union all 
select dept_name 
from Department

select *into mofed
from Company_SD.dbo.Employee

select * , ROW_NUMBER()over(order by st_age desc) as RN
from student

select * , dense_rank()over(order by st_address desc) as RN
from student

select * , Ntile(4)over(order by st_age desc) as RN
from student

select * 
		from (select * , ROW_NUMBER()over(order by st_age desc) as RN
	from student) as newtable

where RN=10

select * 
from (select *,DENSE_RANK()over (order by st_age desc )as DN 
from student   ) as newtable

where DN=5

select * , ROW_NUMBER()over(partition by  st_address order by st_age ) as RN
from student


---------RANK()-----
SELECT salary,

RANK() OVER ( ORDER BY salary desc) as rank

FROM Instructor;
-------------

select ins_name , Salary, 
	case 
	when Salary>300 then 'high score'
	when Salary<300 then  'low score'
	else 'no value'
	end as newsal

from Instructor


select ins_name,iif(salary>=300,'high','low')
from instructor



select format(getdate() , 'dd-mm-yyyy')

select format(eomonth(getdate()),'dd')

create schema mofed

use AdventureWorks2012

create synonym HE for HumanResources.Employee

select * from HE
select * from student

----------CONSTRAINT AND RULES-----------
create table Hospital
(
	HT_id int primary key ,
	HT_name varchar(20),

)

create table doctor  
(
	eid int   identity(1,1) ,
	ename varchar(20),
	eadd varchar(20) default 'alex',
	hiredate date default getdate(),
	sal int ,
	overtime int,
	netsal as isnull (sal,0) + isnull (overtime,0),
	BD date , 
	age as (year(getdate())-year(BD)),
	gender varchar(1),
	hour_rate int not null ,
	did int,

	constraint c10 primary key (eid,ename),
	constraint c11 unique (sal),
	constraint c12 unique (overtime),
	constraint c13 check (sal>1000),
	constraint c14 check (eadd in ('cairo','mansora','alex')),
	constraint c15 check (gender='f'or gender ='m'),
	constraint c16 check (overtime between 100 and 500),
	constraint c17 foreign key (did) references Hospital(HT_id)
	on delete set null on update cascade


)
---add constraint after run table 
alter table doctor add constraint c18 check (hour_rate>100)

---delete constraint 
alter table doctor drop constraint c18








----Create rule & delete it -------
create rule r2 as @x>1000
sp_bindrule r2 , 'instructor.salary'

sp_unbindrule 'instructor.salary'
drop rule r2

create










----create  data type has name is complexdt -----

create rule r7 as @x>1000
create default def7 as 5000

sp_addtype complexDT,'int'
sp_bindrule r7, complexDT
sp_bindefault def7,complexDT

create table vamoos (

	id int , 
	ename varchar(20),
	salary complexDT

)

create table vamoos_mohMM (

	id int , 
	ename varchar(20),
	salary complexDT,
	Edate complexDT
)


-----try create new data 

create rule r10 as @x>1000
create default def10 as 5000

sp_addtype eltyar ,'int'

sp_bindrule r10 , eltyar
sp_bindefault def10 ,eltyar

create table eltayarmofed(

	id int ,
	ename varchar(20),
	salary eltyar
)

insert into eltayarmofed(id,ename)
values(3,'khalil')

alter table eltayarmofed 
add height int

alter table eltayarmofed 
add weightn  eltyar

insert into eltayarmofed(id,ename)
values (7,'mofed')






