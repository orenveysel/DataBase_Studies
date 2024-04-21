-- 1- Hangi ülkelere ihracat yapıyorum?
-- Customer tablosundaki COuntry alanina gore yapılabiliyor

select distinct Country from Customers

-- Order tablosundaki ShipCountry alanina gore

select distinct ShipCountry from Orders

-- 2- Ülkesi (Country) ya Spain, ya France, ya da Germany olan müşteriler
select * from Customers where Country = 'Spain' or Country = 'France' or Country = 'Germany'
select * from Customers where Country in ('Spain','France','Germany')

-- 3- Bugün doğum günü olan çalışanlarım kimler? (Employees)
select * from Employees
where MONTH(BirthDate) = MONTH(GETDATE()) and day(BirthDate) = day(GETDATE())

-- 4- 1000 Adetten fazla satılan ürünler?
select ProductID, sum(Quantity) Adet
from [Order Details]
GROUP by ProductID
HAVING SUM(Quantity) > 1000

-- 5- Hangi kargo şirketine toplam ne kadar ödeme yapmışım? 
-- (Order tablosundaki Freitgh alani Navlun bilgilerini tutmaktadir)
-- Navlun, deniz ve nehir yolu ile taşınan eşya için, taşıma hizmeti karşılığında gemi şirketine ödenen ücret
select ShipVia, Sum(Freight) Navlun
from Orders
GROUP by ShipVia

-- 6- En fazla siparişi alan çalisan kimdir?
select top 1 e.FirstName, e.LastName, COUNT(*) Adet
from Orders as o
inner join Employees as e on e.EmployeeID = o.EmployeeID
GROUP by e.FirstName, e.LastName
Order by Adet desc
-- Ciroyu da katarsak
select top 1 e.FirstName, e.LastName, COUNT(*) Adet, sum(od.Quantity*od.UnitPrice) Ciro
from Orders as o
inner join Employees as e on e.EmployeeID = o.EmployeeID
inner JOIN [Order Details] as od on od.OrderID = o.OrderID
GROUP by e.FirstName, e.LastName
Order by Adet desc

-- 7- Sipariş vermeyen müşterilerim hangileridir?
select * 
from Customers as c 
left join Orders as o on c.CustomerID = o.CustomerID
where o.CustomerID is NULL

-- 8- En değerli müşterim hangisi? (Gelir ve adet bazında en fazla satış yaptığım müşteri)

select top 1 c.CompanyName, COUNT(*) Adet, sum(od.Quantity*od.UnitPrice) Ciro
from Customers as c
inner join Orders as o on o.CustomerID = c.CustomerID
inner join [Order Details] as od on od.OrderID = o.OrderID
GROUP by c.CompanyName
order by Ciro DESC

-- 9- Disardan girilecek Yil'a gore Aylik bazda ciro dağılımı yapan stored procedure yazini
-- create PROCEDURE AylikCiroDagilimi (@yil int)
-- AS
-- BEGIN
-- select MONTH(o.OrderDate) Ay, COUNT(*) Adet, SUM(od.Quantity*od.UnitPrice) Ciro
-- from Orders as o
-- inner join [Order Details] as od on od.OrderID = o.OrderID
-- where YEAR(o.OrderDate) = @yil
-- group by MONTH(o.OrderDate)
-- order by Ay
-- END

-- exec AylikCiroDagilimi 1996

-- 10- Disardan girilecek ulke bilgisine gore toplam siparis adetlerini 
-- yillara gore yapan stored procedure yazınız

-- CREATE PROCEDURE UlkeyeGoreCiroDagilimi (@ulke VARCHAR(50))
-- as
-- BEGIN
-- select o.ShipCountry Ulke, YEAR(o.OrderDate) Yil, COUNT(*) Adet, SUM(od.Quantity*od.UnitPrice) Ciro
-- from Orders as o
-- inner join [Order Details] as od on od.OrderID = o.OrderID
-- where o.ShipCountry = @ulke
-- group by o.ShipCountry, YEAR(o.OrderDate)
-- order by Ulke
-- END

-- exec UlkeyeGoreCiroDagilimi 'UK'

-- 11- En az kazandıran sipariş hangisidir, hangi müşteri vermiştir
select top 1 o.CustomerID, o.OrderID, SUM(od.Quantity*od.UnitPrice) Ciro
from Orders as o
inner join [Order Details] as od on od.OrderID = o.OrderID
GROUP BY o.CustomerID, o.OrderID
order by Ciro ASC

--12-Kargo Firmalarini 1997 yilinda tasidigi siparis sayisi nedir (Shippers , Orders)
Select s.CompanyName,count(*) adet
from Shippers s 
INNER join Orders o on s.ShipperID = o.ShipVia
where year(o.OrderDate) =1997 
group by s.CompanyName

--13- Musterilerin 1998 yilinda yaptigi cirolar nedir ?
select   c.CompanyName, sum(od.Quantity*od.UnitPrice) Ciro
from [Orders] o 
inner join Customers c on c.CustomerID =o.CustomerID
inner join [Order Details] od on od.OrderID=o.OrderID
where year(o.OrderDate) = 1998
group by  c.CompanyName
Order by Ciro desc

--14 -Adı şu şekilde olanlar: tAmEr, yAsEmin, tAnEr
--(A ile E arasında tek bir karakter olan çalişanlar: Employees)
select * from Employees 
where FirstName like '_A_E%'

--15-Kaç Gundur Yaşiyorsunuz. Hesaplattirin
select datediff(DAY,'01.01.2000',Getdate())




-- 1- select distinct Country from Customers

-- 2- select ContactName from Customers where Country = 'Spain' or Country = 'France' or Country = 'Germany'

-- 3- select FirstName, LastName, BirthDate from Employees
--    where BirthDate = GETDATE()

-- 4- select ProductID, COUNT(*) Adet, Quantity, UnitPrice
--    from [Order Details]
--    GROUP by ProductID, Quantity, UnitPrice
--    where (Adet * Quantity) > 1000

-- 14- select FirstName FROM Employees
--     where FirstName like '_a_e%'

select OrderID, Quantity
from [Order Details]
-- where sum(UnitPrice*Quantity*(1-Discount))>100
GROUP BY OrderID
HAVING sum(UnitPrice*Quantity*(1-Discount))>1000
order by Ciro DESC

-- Sipariş almayan çalışanların da gelecek şekilde sipariş adetleri nedir
select e.FirstName, COUNT(o.OrderID)
from Employees as e
left join Orders as o on o.EmployeeID = e.EmployeeID
where COUNT = 0
group by e.FirstName

select *
from Customers

select e.FirstName + ' ' + e.LastName [İsim Soyisim], count(*) Adet
from Employees e
inner join Orders o on e.EmployeeID=o.EmployeeID
group by e.FirstName + ' ' + e.LastName
Order by Adet desc

-- 15- DATEDIFF(day, BirthDate, GETDATE())

