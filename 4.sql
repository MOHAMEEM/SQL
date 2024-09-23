select * from Student

create proc Getst 
as s
	select * from student 

Getst


create proc Getaddress @add varchar(20)
as 

	select st_id , st_fname , st_address 
	from student 
	where St_Address=@add


Getaddress 'cairo'
Getaddress 'alex'

alter proc inst @id int ,@name varchar(20)
as 
	begin try
	insert into Student(St_Id,St_Fname)
	values (@id,@name)
	end try
	begin catch 
		select 'Error'
	end catch

inst 17,'ali'

create proc sumdata @x int , @y int =100
as 
	select @x+@y


sumdata 20


create proc getstbyage @age1 int , @age2 int 
as	
	select st_id,st_fname 
	from student 
	where St_Age between @age1 and @age2

getstbyage 25,28

insert into tab6(St_Id,St_Fname)
execute getstbyage 25,28


declare @t table(x int , y varchar(20))
insert into @t
execute getstbyage 25,28
select count (*) from @t


----------------very Hard --------------
alter proc Getdata @did int , @age int output , @name varchar(20) output
as 
	select @age=st_age, @name=St_Fname
	from student 
	where st_id =@did

declare @x int , @y varchar(20)
execute Getdata 10, @x output , @y output
select @x,@y
--------------------------------


alter proc  Getts @did int , @age int output ,@names varchar(20) output,@lastname varchar(20) output
as 
select @age =st_age,@names=St_Fname,@lastname=St_Lname
from student 
where st_id=@did


declare @n int, @v varchar(20),@last varchar(20)
execute Getts 4,@n output ,@v output ,@last output
select @n,@v,@last

------Trigger----

insert into Student(St_Id,St_Fname)
values(40,'ali')

alter trigger t1 
on student 
after insert 
as 
	select 'Welcome to insert into DB'

create trigger t4 
on Department
instead of insert , update , Delete
as 
	select 'NOT ALLOWED'

UPDATE Department
set Dept_Id=4
where Dept_Id=3



alter trigger dbo.t7 
on dbo.sales
after update 
as 
	select 'hi'

update dbo.sales
set Product_id=4
where Product_id=7

create trigger t2
on sales
after update 
as 
	if UPDATE(salesman)
		select 'hi'

update sales
set salesman ='mohammmed'
where Product_id=2
	
---drop trigger t7 ---




create trigger t5
on course 
after update 
as 
	select * from inserted
	select * from deleted

update Course
set Crs_Name='Cloud',Crs_Duration=45
where Crs_Id=100

create trigger t8 
on course 
instead of delete
as
	if FORMAT(GETDATE(),'dddd')='friday'
		begin
		select 'not delete'

		---rollback   OR
		insert into Course
		select * from deleted

		end
	

create table History
(
_user varchar(20),
_date date,
_oldid int ,
_newid int
)



alter trigger t10
on topic 
instead of update 
as 
	if UPDATE(top_id)
	begin
	declare @old int , @new int
	select @old=top_id from deleted
	select @new=top_id from inserted
	insert into History
	values (SUSER_SNAME(),GETDATE(),@old,@new)
	end

update Topic 
set Top_Id=10,Top_Name='moo'
where Top_Id=4


--------------XML 

select * from student 
for xml path