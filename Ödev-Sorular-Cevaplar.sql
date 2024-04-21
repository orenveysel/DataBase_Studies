-- ÖDEV SORULARI + CEVAPLARI

-- Müşterilerin yıllara göre Ciroları nedir
SELECT c.ContactName [İsim Soyisim], sum(UnitPrice*Quantity*(1-Discount)) Ciro, year(o.OrderDate) Tarih
FROM  Customers as c
INNER JOIN Orders as o ON c.CustomerID = o.CustomerID 
INNER JOIN [Order Details] as od ON o.OrderID = od.OrderID
group by c.ContactName, o.OrderDate
order by Ciro desc

-- Çalışanların yıllara göre ciroları nedir
SELECT e.FirstName + ' ' + e.LastName Calisan, sum(UnitPrice*Quantity*(1-Discount)) Ciro, year(o.OrderDate) Tarih
FROM  Employees as e
INNER JOIN Orders as o ON e.EmployeeID = o.EmployeeID 
INNER JOIN [Order Details] as od ON o.OrderID = od.OrderID
group by e.FirstName + ' ' + e.LastName, o.OrderDate
order by Tarih desc

-- Kargo firmalarının 1998 yılındaki taşıdıkları sipariş sayısı nedir
SELECT s.CompanyName, od.Quantity, year(o.ShippedDate) Yil
FROM  Orders as o
INNER JOIN Shippers as s ON o.ShipVia = s.ShipperID
INNER JOIN [Order Details] as od on od.OrderID = o.OrderID
where year(o.ShippedDate) = 1998

-- En az ciro yaptığım ülke hangisidir
select top 1 o.ShipCountry, sum(UnitPrice*Quantity*(1-Discount)) Ciro
from Orders as o
INNER JOIN [Order Details] as od on od.OrderID = o.OrderID
group by o.ShipCountry
order by Ciro

-- En fazla ciro yaptığım şehir hangisidir
select top 1 o.ShipCity, o.ShipCountry, sum(UnitPrice*Quantity*(1-Discount)) Ciro
from Orders as o
INNER JOIN [Order Details] as od on od.OrderID = o.OrderID
group by o.ShipCity, o.ShipCountry
order by Ciro desc

-- Almanya en çok hangi kategorideki ürünleri sipariş ediyor
select c.CategoryName, count(*) Adet, o.ShipCountry
from Products as p
INNER JOIN Categories as c on p.CategoryID = c.CategoryID
INNER JOIN [Order Details] as od on od.ProductID = p.ProductID
INNER JOIN Orders as o on o.OrderID = od.OrderID
where o.ShipCountry = 'Germany'
Group by c.CategoryName, o.ShipCountry
Order by Adet desc

-- Tedarikçilerimden hangisinin ürünü en çok satandır
select top 5 s.CompanyName, sum(od.Quantity) Toplam, p.ProductName
from Suppliers as s
INNER JOIN Products as p on p.SupplierID = s.SupplierID
INNER JOIN [Order Details] as od on od.ProductID = p.ProductID
group by s.CompanyName, p.ProductName
order by Toplam desc

-- Tek seferde en çok sipariş alan ürün (ekstra)
select top 5 s.CompanyName, od.Quantity, p.ProductName
from Suppliers as s
INNER JOIN Products as p on p.SupplierID = s.SupplierID
INNER JOIN [Order Details] as od on od.ProductID = p.ProductID
order by Quantity desc

-- Satışlar içerisinde en çok indirim yapılan ürün hangisidir (Yanlış Cevap)
select p.ProductName, od.Discount
from Orders as o
INNER JOIN [Order Details] as od on od.OrderID = o.OrderID
INNER JOIN Products as p on p.ProductID = od.ProductID
order by Discount desc

-- Satışlar içerisinde en çok indirim yapılan ürün hangisidir (Doğru Cevap)
select top 1 ProductName, count(*) [indirim sayisi]
from [Order Details] as od
inner join Products as p on od.ProductID = p.ProductID
where od.Discount > 0
GROUP by ProductName, od.ProductID
order by [indirim sayisi] desc


