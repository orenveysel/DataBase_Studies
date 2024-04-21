-- Yazılan sorguları kaydetmenin iki yolu vardır
-- 1. Yol Stored Procedure yazmak, bu metod yazmaktan farksızdır
create PROCEDURE MusteriCirolari
as BEGIN
select orders.OrderID,
orders.CustomerID,
Customers.CompanyName Musteri,
orders.EmployeeID,
Employees.FirstName,
Employees.LastName,
orders.ShipCity,
orders.ShipCountry,
orders.ShipVia,
Shippers.CompanyName Kargo
from Orders
inner join Employees on Employees.EmployeeID = Orders.EmployeeID
inner join Customers on Customers.CustomerID = Orders.CustomerID
inner join Shippers on Shippers.ShipperID = Orders.ShipVia
end
-- Saklanan Procedureleri calistirmak icin EXEC komutu kullanılır
exec MusteriCirolari

-- 2. Yol View oluşturmak
Create View MusteriCirolariView
select orders.OrderID,
orders.CustomerID,
Customers.CompanyName Musteri,
orders.EmployeeID,
Employees.FirstName,
Employees.LastName,
orders.ShipCity,
orders.ShipCountry,
orders.ShipVia,
Shippers.CompanyName Kargo
from Orders
inner join Employees on Employees.EmployeeID = Orders.EmployeeID
inner join Customers on Customers.CustomerID = Orders.CustomerID
inner join Shippers on Shippers.ShipperID = Orders.ShipVia

-- View'leri cağırmak için
select * from MusteriCirolariView -- View
exec MusteriCirolari -- Stored Procedure

select ShipCountry,count(* )from MusteriCirolariView 
Group BY ShipCountry

-- Stored Procedurelerde Order tablosuna bir müşteriden alınan siparişi eklemek istesek
-- ve müşterinin son 10 siparişine göre bir iş kuralı olduğunu düşünürsek
-- bunu ancak stored procedure üzerinden yapabiliriz

-- İki sayiyi toplayan bir procedure
create procedure Topla(@sayi int, @sayi2 int)
as BEGIN

select @sayi + @sayi2
END


-- Yıllara göre müşteri cirolarını alan procedure
-- Yıl parametre olarak geçilecek

-- Olması gereken sorgu
select year(o.OrderDate), c.CompanyName,count(*) Adet
from Orders as o
inner join Customers as c on c.CustomerID = o.CustomerID
where year(o.OrderDate) = 1997
group by year(o.OrderDate), c.CompanyName

-- Procedure hali
ALTER PROCEDURE YilaGoreMusteriSiparisleri (@yil as int)
as BEGIN
declare @temp INT
set @temp = CONVERT(int,@yil)
if(@temp>0 or @temp is not null)
BEGIN
select year(o.OrderDate), c.CompanyName,count(*) Adet
from Orders as o
inner join Customers as c on c.CustomerID = o.CustomerID
where year(o.OrderDate) = @yil
group by year(o.OrderDate), c.CompanyName
END
ELSE
select 'Lutfen duzgun parametre giriniz'
end

exec YilaGoreMusteriSiparisleri null