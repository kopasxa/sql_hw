use [Sporting goods store]
go

create trigger CheckInsertProd
on product
instead of insert
as
begin
	declare @name int, @count int, @qu int, @id int
	select @qu = quantity from inserted
	select @count = count(product.id), @id = product.id from product
	where product.cost = (select cost from inserted) and product.name = (select name from inserted)
	group by product.id

	if @count > 0
		begin
			update product set quantity = @qu
			where @id = product.id
		end
	else 
		begin
			insert into product (cost, manufacturer, name, quantity, selling, view_)
			values ((select cost from inserted), (select manufacturer from inserted), (select name from inserted), (select quantity from inserted), (select selling from inserted), (select view_ from inserted))			
		end
end

