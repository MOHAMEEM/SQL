declare c1 cursor 
for select st_id , st_fname 
	from student 
	where st_Address ='cairo'
for read only 
declare @id int , @name varchar(20)
open c1
fetch c1 into @id , @name 
while @@FETCH_STATUS=0		
	begin
		select @id,@name
		fetch c1 into @id , @name
	end
close c1
deallocate c1

------------------------------------
declare c1 cursor 
FOR select st_fname 
from student 
where St_Fname is not null
FOR read only 
declare @ename varchar(20),@allname varchar(300)=''
open c1
fetch c1 into @ename 
while @@FETCH_STATUS=0
	begin 
	set @allname=CONCAT(@allname,',',@ename)
	fetch c1 into @ename ,@allname
	end 
select @allname
close c1
deallocate c1




