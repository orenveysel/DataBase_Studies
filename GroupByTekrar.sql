-- Tablodaki kayıt sayısını bulma
-- Count built-in function a '*' parametresi verilirse tablodaki Primary Key'e göre sayma işlemi yapar
Select count(*) from Employees -- 9 gelecektir
-- Count built-in function a '*' parametresi yerine herhangi bir kolon ismi de verilebilir
select COUNT(Country) from Employees -- 9 gelecektir
-- Null kayıt olan bir kolonu saydırırsak null kayıtları saymaz
select COUNT(Region) from Employees -- 5 sonucunu verecektir
-- Sayılan kolon içerisindeki verileri tekilleştirmek için distinct komutu kullanılır
select COUNT(distinct Country) from Employees -- 2 sonucu verecektir

-- Ülkelere göre saydırmak istersek gruplamak gerekecek, yani sql'e diyeceğiz ki
-- ülkelere göre gruplayıp say
SELECT Country, COUNT(Country) 
from Employees
GROUP by Country

select * from Employees

SELECT TitleOfCourtesy, COUNT(TitleOfCourtesy) 
from Employees
GROUP by TitleOfCourtesy

-- Null kayıt olan region'a göre gruplar ve count fonksiyonuna '*' geçersek null kayıtların da sayısını verecektir
select region, COUNT(*)
from Employees
group by Region
-- Count fonksiyonuna içerisinde null kayıt olan bir alanı saymasını söylersek 
-- sonuç farklı çıkacaktır
select region, COUNT(Region)
from Employees
group by Region

select * from Employees

-- Categorilerdeki fiyat ortalamasını bulalım
select CategoryId, AVG(UnitPrice) 
from Products
GROUP by CategoryID

-- 1996 yılında hangi ülke kaç adet sipariş vermiş
select ShipCountry,COUNT(*) Adet
from Orders
where YEAR(OrderDate) = 1996
GROUP by ShipCountry
ORDER by Adet desc--Count(*)

-- Almanyanın yıllara göre sipariş dağılımı nedir
select YEAR(OrderDate) Yillar,COUNT(*) Adet
from Orders
where ShipCountry = 'Germany'
GROUP by YEAR(OrderDate)
ORDER by Yillar --Count(*)

-- 1997 yılında almanyanın verdiği siparişlerin şehirlere göre dağılımı
select ShipCity,COUNT(*) Adet
from Orders
where ShipCountry = 'Germany' and YEAR(OrderDate) = 1997
GROUP by ShipCity
ORDER by Adet

-- 1 numaralı kargo firmasının taşıdığı siparişlerin ülkelere göre dağılımı
select ShipVia, ShipCountry,COUNT(*) Siparis
from Orders
where ShipVia = 1
GROUP by ShipCountry, ShipVia
-- join ile kargo firmasının ismini getirme
select Shippers.CompanyName, ShipCountry,COUNT(*) Siparis
from Orders
inner join Shippers on shippers.ShipperID=Orders.ShipVia
where ShipVia = 1
GROUP by ShipCountry, Shippers.CompanyName

-- USA ile çalışan kargo firmaları hangileridir ve kaç adet taşıma yapmışlardır
select Shippers.CompanyName, ShipVia,COUNT(*) Adet
from Orders
inner join Shippers on shippers.ShipperID=Orders.ShipVia
where ShipCountry = 'USA' 
GROUP by ShipVia, Shippers.CompanyName
ORDER by ShipVia

-- Fransaya en çok satış yapan çalışan kimdir
select Shippers.CompanyName, ShipVia,COUNT(*) Adet
from Orders
inner join Shippers on shippers.ShipperID=Orders.ShipVia
where ShipCountry = 'France' 
GROUP by ShipVia, Shippers.CompanyName
ORDER by ShipVia

--1997 yılında UK'da en fazla sipariş veren müşteri kimdir
select top 3 CustomerID,COUNT(*) Adet
from Orders
where ShipCountry = 'UK' and YEAR(OrderDate) = 1997
GROUP by CustomerID
ORDER by Adet DESC

select top 20 * from [Order Details]
--10250	65	16,80	15	0,15 = Ciro = 16.80 x 6*(1-0.05) = 95.76
--10251	22	16,80	6	0,05 = Ciro = 15.6 x 15 *(1-0.05) = 222.3
--10251	57	15,60	15	0,05 = Ciro = 16.8 x 20           = 336 
-- Toplam Ciro                                            = 654.06
select UnitPrice*Quantity*(1-Discount) 
from [Order Details]
where OrderID = 10251

