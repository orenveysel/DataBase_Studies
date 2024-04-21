-- JOIN İŞLEMLERİ
-- 1) Inner Join: Bir tablodaki her bir kaydın diğer tabloda bir
-- karşılığı olan kayıtlar listelenir. Inner Join ifadesini yazarken
-- Inner cümlesini yazmazsak da (sadece Join yazarsak) bu yine
-- Inner Join olarak işleme alınır 

select Products.ProductID, Products.ProductName, Categories.CategoryName
from Products
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID

SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
FROM  Categories INNER JOIN
         Products ON Categories.CategoryID = Products.CategoryID

-- Tedarikçiler ile ürünler arasındaki ilişkiye bakalım
SELECT Products.ProductID, Products.ProductName, Suppliers.CompanyName, Products.UnitPrice, Suppliers.Country
FROM  Products INNER JOIN
         Suppliers ON Products.SupplierID = Suppliers.SupplierID

select p.ProductID, p.ProductName, c.CategoryName, p.UnitPrice, p.UnitsInStock, s.CompanyName, s.Country
from Products p
inner join Categories c on c.CategoryID = p.CategoryID
inner join Suppliers s on s.SupplierID = p.SupplierID

-- Müşterilerin sipariş adetlerini görelim
SELECT Customers.CustomerID, Customers.CompanyName, COUNT(*) AS Adet
FROM  Customers 
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CompanyName, Customers.CustomerID
Order by Adet desc

-- SAVEA firmasının cirosu nedir
SELECT o.OrderID, o.OrderDate, sum(UnitPrice*Quantity*(1-Discount)) Ciro
FROM  Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID 
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
where c.CustomerID = 'SAVEA'
group by o.OrderID, o.OrderDate
order by o.OrderID
/*

Coklu aciklama satiri

*/
-- Çalışanların Ad ve Soyadı ile beraber aldıkları sipariş adetlerini bulunuz
select e.FirstName + ' ' + e.LastName [İsim Soyisim], count(*) Adet
from Employees e
inner join Orders o on e.EmployeeID=o.EmployeeID
group by e.FirstName + ' ' + e.LastName
Order by Adet desc

-- Çalışanların Ad ve Soyadı ile beraber aldıkları siparişlerin cirolarını bulunuz
select e.FirstName + ' ' + e.LastName Calisan, count(*) Adet, sum(UnitPrice*Quantity*(1-Discount)) Ciro
from Employees as e
inner join Orders as o on e.EmployeeID=o.EmployeeID
inner join [Order Details] as od on od.OrderID=o.OrderID
group by e.FirstName + ' ' + e.LastName
Order by Ciro desc, Adet desc

-- Kargo Firmalarının taşıdığı siparişlerin listesi(Kargo firmasının ismi de gelsin)
Select s.CompanyName, o.CustomerID, o.EmployeeID, o.OrderDate, o.ShipCity
from Shippers as s
inner join Orders as o on o.ShipVia = s.ShipperID
inner join Customers as c on c.CustomerID = o.CustomerID

-- Müşterilerin isimlerini de gösterelim
Select s.CompanyName, c.CompanyName, o.EmployeeID, o.OrderDate, o.ShipCity
from Shippers as s
inner join Orders as o on o.ShipVia = s.ShipperID
inner join Customers as c on c.CustomerID = o.CustomerID

-- Siparişi alan çalışanların isimlerini de gösterelim
Select s.CompanyName, c.CompanyName, e.FirstName + ' ' + e.LastName Calisan, o.OrderDate, o.ShipCity
from Shippers as s
inner join Orders as o on o.ShipVia = s.ShipperID
inner join Customers as c on c.CustomerID = o.CustomerID
inner join Employees as e on e.EmployeeID = o.EmployeeID

-- Categori bazinda siparis adedi bulalim
select c.CategoryName, count(o.OrderID) [Siparis Adedi], sum(od.UnitPrice*od.Quantity*(1-od.Discount)) Ciro
from Orders as o
inner join [Order Details] as od on od.OrderID = o.OrderID 
inner join Products as p on p.ProductID = od.ProductID
inner join Categories as c on c.CategoryID = p.CategoryID
GROUP by c.CategoryName

-- Calisanlarin siparislerini tasiyan kargo firmalari hangileridir, Nancy'den supheleniyorum
-- Bakin bakim hangi kargo firmalari ile calismis
select s.CompanyName, count(o.OrderID) Sayi
from Employees as e
inner join Orders as o on o.EmployeeID = e.EmployeeID
inner join Shippers as s on s.ShipperID = o.ShipVia
where e.FirstName = 'Nancy'
GROUP by s.CompanyName

-- Diger calisanlari da dikkate alirsak
select e.FirstName + ' ' + e.LastName Calisan, s.CompanyName, count(o.OrderID) Adet
from Employees as e
inner join Orders as o on o.EmployeeID = e.EmployeeID
inner join Shippers as s on s.ShipperID = o.ShipVia
-- where e.FirstName = 'Nancy'
GROUP by s.CompanyName, e.FirstName + ' ' + e.LastName
order by Calisan, Adet desc


