use [Sporting goods store]
go

create trigger moreEmp
on employees
instead of insert
as
begin
	declare @count int = (select count(employees.id) from employees)
	if @count > 6
		begin 
			print('sorry, you can"t add new employe (')
		end
	else
		begin
			print('ok')
		end
end