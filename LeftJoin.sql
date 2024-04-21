select * 
from Products 
order by ProductID desc

select top 5 p.ProductName, sum(Quantity) Adet
from [Order Details] as od
RIGHT join Products as p on p.ProductID = od.ProductID
group by p.ProductName
order by 2 asc

select top 5 p.ProductName, sum(Quantity) Adet
from Products as p
LEFT join [Order Details] as od on od.ProductID = p.ProductID
group by p.ProductName
order by 2 asc

select * 
from Employees
insert into Employees (FirstName,LastName) values ('Ayse','Kaya')

-- Sipariş almayan çalışanların da gelecek şekilde sipariş adetleri nedir
select e.FirstName, COUNT(o.OrderID)
from Employees as e
left join Orders as o on o.EmployeeID = e.EmployeeID
group by e.FirstName

