-- Sorgu birlestirme
-- Union 
select CompanyName, ContactName
from Suppliers
UNION
select CompanyName, ContactName
from Customers

-- Full Join
select c.CompanyName, o.OrderID
from Customers as c
full OUTER JOIN Orders as o on c.CustomerID = o.CustomerID
order by c.CompanyName

-- Self Join
select A.CompanyName as CustomerName1, B.CompanyName as CustomerName2
from Customers A, Customers B
where A.CustomerID <> B.CustomerID
and A.City = B.City
order by A.City;

-- self join Employee 1. yol
select e1.FirstName, e2.FirstName
from Employees e1, Employees e2
where e1.EmployeeID=e2.ReportsTo

-- self join Employee 2. yol
select e1.FirstName, e2.FirstName
from Employees e1
inner join Employees e2 on e1.EmployeeID=e2.ReportsTo

select p.ProductName, c.CategoryName
from Categories c
inner join Products p on p.CategoryID = c.CategoryID
-- Bu sorgu yukaridaki sorgu ile aynidir
select p.ProductName, c.CategoryName
from Categories c, Products p
where c.CategoryID = p.CategoryID

-- Exists : 20$ altindaki urunleri satan tedarikcilerin listesi
SELECT CompanyName
FROM Suppliers
WHERE EXISTS 
(SELECT ProductName 
FROM Products 
WHERE Products.SupplierID = Suppliers.supplierID AND UnitPrice < 20);

select s.CompanyName
from Products p
inner join Suppliers s on s.SupplierID = p.SupplierID
where p.UnitPrice<20
GROUP BY s.CompanyName

-- Any : 10 adet siparis verilmis urunlerin listesini verir
SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM [Order Details]
  WHERE Quantity = 10);
-- inner join ile cozumu
select p.ProductName
from Products p
inner join [Order Details] od on p.ProductID = od.ProductID
where od.Quantity = 10
GROUP by p.ProductName


