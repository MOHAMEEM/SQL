--------
declare @z int 
select @z=st_age from student where st_id =6
select @z
---------
declare @x int =(select avg(st_age) from student)
select @x


declare @y int=100
select @y

declare @id int , @name varchar(20)
select @id= st_id,@name=st_fname 
from Student where st_id=7
select  @id, @name

declare @i int
update Student
set St_Fname='ali' ,@i=dept_id
where st_id=7
select @i

 execute('select * from student')

declare @tab varchar(20)='*' , @col  varchar(20) ='student'
	
execute( 'select' + @tab +'from '+ @col  )

------ backspace after from was very important ☝🏿 ----


declare @n int=5
select top(@n)* from Student

declare @t table(x int)
insert into @t
select st_id from student where St_Address='alex'
select * from @t

-------
declare @v table(x int,ename varchar(20),age int)
insert into @v
select st_id ,st_fname,St_Age from student where St_Address='alex'
select * from @v

----------- Control of flow statment 

declare @if int 
update student 
	set St_Age+=1
select @if = @@rowcount
if @if > 0
	begin
	select 'multi row affected'
	select 'hello'
	end
else 

	select 'no rows affected'
select @@rowcount





if exists (select * from sys.tables where name='studen')
	select 'table is existed' 

else 
	create table exist (
		
		eid int , 
		ename varchar(20),
	
	)

begin try 
	select St_Fname from student
end try
begin catch 
	select ERROR_LINE()
end catch

declare @check int =10
	while @check<=20	
		begin
			set @check+=1
			if @check=14
					continue
			if @check=16			
				break
	
				select @check
			end


---Function -----
---1/ scalar function---

create function findname (@id int )

returns varchar(20)

	begin
		declare @name varchar(20)
		select @name =st_fname from student 
		where st_id=@id
		return @name
	end

	select dbo.getname(7)

----create

create function gettable (@did int)
returns table 
as 
return 
(

	select ins_name, salary*12 as totalsal
	from Instructor
	where Dept_Id=@did

)

select * from dbo.gettable(10)


select ins_name from gettable(10)
select sum (totalsal)from gettable(10)

--------

select sname , grade ,
x=lag(sname)over(order by grade),
y=lead(sname)over(order by grade)
from grades

--------------------

create table ##exam
(

	eid int , 
	ename varchar(20),
	edate int


)


declare @t table(x int , ename varchar(20))
insert into @t values (1,'ali')
insert into @t values (2,'ali')


select * from @t

-----------rollup cube pivot unpivot-------


select Product_id asx,sum(quantity) as quantity
from sales 
group by rollup (Product_id) 

select Product_id asx,sum(quantity) as quantity
from sales 
group by  (Product_id)

select Product_id asx,sum(quantity) as quantity
from sales 
group by  (Product_id)
union all 
select 'NULL', sum(quantity)
from sales


-------
select Product_id ,salesman ,sum(quantity) as quantity
from sales 
group by rollup (Product_id,salesman) 

select Product_id ,salesman ,sum(quantity) as quantity
from sales 
group by  Product_id,salesman

select Product_id ,salesman ,sum(quantity) as quantity
from sales 
group by cube (Product_id,salesman) 

select Product_id ,salesman ,sum(quantity) as quantity
from sales 
group by grouping sets  (Product_id,salesman) 

-------

select * 
from sales
pivot(sum(quantity)for salesman IN ([Ahmed],[Ali],[Mohamed]))as pvt

------
select*from v_alex
 
 select * FROM vjoin

 select snam from vjoin
 -------
 alter view vjoins(sid , sname , did , dname)
 as
 select st_id,st_fname ,d.dept_id ,dept_name
 from student s inner join Department d
 on d.dept_id = s.dept_id

---- select sname from vjoins---







-------Trying-----

create view mohamed(sid,Dept_name,ins_name,salary)
as 
	select Dept_name , ins_name, salary
	from Department d inner join Instructor i
	on d.Dept_Id=i.Dept_Id

select Dept_name from mohamed


-------------------failed --------------------------

create view mohamed2(sid,ins_name, Evaluation)
as
	select  Dept_name , ins_name, Evaluation
	from   mohamed m inner join Ins_Course Ic
	on m.sid=Ic.Ins_Id

select*from mohamed2

-----------------------------------------------------



sp_helptext