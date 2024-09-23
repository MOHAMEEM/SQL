insert into student(St_Id,St_Fname,St_Address)
values(15,'mofed','menofia')


insert into Student(St_Id,St_Fname,St_Address)
values(16,'bayan','menofia')

update Student
	set St_Fname='norhan',St_Age=20
where St_Id=16


delete from Student
where St_Id=15


select distinct st_fname
from Student

select St_Fname from Student

select * from student
where St_Address in ('cairo','alex','mansora')


select * from Student
order by St_Age desc 

select * from Student
order by St_Age asc 


select * from student 
where St_Age>=23 and St_Age<=25

select * from student 
where St_Age between 23 and 25

select st_fname,Dept_name 
from Student s inner join Department d
on s.Dept_Id=d.Dept_Id

select st_fname,Grade,Crs_name
from Student s , Stud_Course sc ,Course c
where s.St_Id=sc.St_Id and sc.Crs_Id=c.Crs_Id


select st_fname,Grade,Crs_name,dept_location
from Student s inner join Stud_Course sc
on s.St_Id=sc.St_Id
inner join Course c
on sc.Crs_Id=c.Crs_Id
inner join Department d
on d.Dept_Id=s.Dept_Id
----------------------???*-------
select st_fname,Dept_name 
from Student s inner join Department d
on s.Dept_Id=d.Dept_Id

select st_fname,Dept_name 
from Student s right outer join Department d
on s.Dept_Id=d.Dept_Id

update Stud_Course
	set Grade+=10
from Student s inner join Stud_Course sc
on s.St_Id=sc.St_Id

select isnull(st_fname,'has no name') 
from Student

-----
select coalesce(st_fname,st_address,'has no name') 
from Student
select coalesce(st_fname,st_address) 
from Student

select concat(st_fname,'+',St_Age) 
from Student

select st_fname , dept_id, st_age 
from student 
order by St_Address

------Aggregate function------

select  max(salary),dept_id
from Instructor
where Salary>1000
group by Dept_Id
having count(Ins_Id)<2


select distinct (select sum (dept_id) from Student)
from Student
where Dept_Id is not null


select dept_id
from student
where Dept_Id is not null

select min(salary),Dept_id
from Instructor
group by Dept_Id

select avg (isnull(St_Age,0))
from Student

select sum(St_Age)/count(*)
from Student

select sum(salary),d.Dept_id,Dept_name
from Instructor i inner join Department d
	on d.Dept_Id=i.Dept_Id
group by d.Dept_Id,Dept_Name

select avg(st_age),St_Address,dept_id
from student 
group by st_address,Dept_Id

select * ,(select count(Salary) from Instructor)as new
from Student

----SUBQUERIES+DML-----
delete  from Stud_Course
where st_id in (select st_id from student where St_Address='alex')



