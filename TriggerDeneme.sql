select top 10 * from Products where UnitsInStock < 5
select top 10 * from [Order Details]
insert into [Order Details] (OrderID,ProductID,UnitPrice,Quantity,Discount)
values (10248,74,0,2,0)

--delete from [Order Details] where OrderId = 10248 and productId = 17
