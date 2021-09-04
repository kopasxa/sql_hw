use [Sporting goods store]
go

create trigger dropEmp
on employees
for delete
as
begin
	insert into dropedEmployee (name, position, dateOfEmployment, gender, salary)
	values ((select name from deleted), (select position from deleted), (select dateOfEmployment from deleted), (select gender from deleted), (select salary from deleted))
end