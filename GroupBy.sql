select * from Employees

-- Ulkelere göre gruplayıp saydırma
select Country,count(*) 
from Employees
group by Country

-- Aşağıdaki saorgu hata verir. Çünkü sql server neye göre gruplayacağını bilmek ister
-- Group by claus yazılmak zorundadır
select Country,count(*) from Employees 

-- Müşterilerin ülkelere göre sayısı nedir -- Customers
select Country,COUNT(*) 
from Customers 
group by Country
order by 2 --3. yol kolon sayısındaki sıra verilerek yapılır -- 2. yol Count(*) -- 11. yol Adet

-- Hangi kategoride kaç adet ürün vardır -- Product tablosu
select CategoryID, count(*) [Urun Adedi]
from Products
group by CategoryID
order by 2 DESC


-- Çalışanların aldığı sipariş sayısı
select EmployeeID,COUNT(*) [Siparis Sayisi] from Orders Group by EmployeeID

-- Yıllara göre sipariş sayısı nedir 
select YEAR(OrderDate),COUNT(*) from Orders GROUP by YEAR(OrderDate)

-- 1997 yılındaki siparişlerin aylara göre dağılımı
select MONTH(OrderDate),COUNT(*) 
from Orders 
where YEAR(OrderDate) = 1997 -- where claus'ları fromdan sonra yazılır
GROUP by MONTH(OrderDate)
order by 1 DESC


-- 1996 yılında en fazla sipariş veren ilk 3 firma hangisidir
select CustomerID, COUNT(*) SiparisSayisi
from Orders 
where YEAR(OrderDate) = 1996
GROUP by CustomerID
order by COUNT(*) DESC

-- 1996 yılında en fazla sipariş alan ilk 3 çalışan hangisidir
select top 3 EmployeeID, COUNT(*) SiparisSayisi
from Orders 
where YEAR(OrderDate) = 1996
GROUP by EmployeeID
order by 2 DESC

SELECT top 3 * from Orders where OrderID = 10865
SELECT top 20 * from [Order Details]

select OrderID, sum(UnitPrice*Quantity*(1-Discount)) Ciro
from [Order Details]
where OrderID=10250
GROUP BY OrderID

select * from [Order Details] Where OrderID = 10865
-- 1000$ ve üzeri olan ciroların listesi

select OrderID, sum(UnitPrice*Quantity*(1-Discount)) Ciro
from [Order Details]
-- where sum(UnitPrice*Quantity*(1-Discount))>100
GROUP BY OrderID
HAVING sum(UnitPrice*Quantity*(1-Discount))>1000
order by Ciro DESC

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

-- Kargocuların taşıdığı sipariş sayısı nedir
select ShipVia,COUNT(*) Count
from Orders
group by ShipVia

-- Kargocuların taşıdığı sipariş sayısının yıllara göre dağılımı nedir
select YEAR(OrderDate) Yil, ShipVia Kargo, COUNT(*) Adet
from Orders
group by ShipVia, YEAR(OrderDate)
order by Yil, Kargo

-- Kargocuların taşıdığı sipariş sayısının yıllara göre dağılımı içerisinde aylara göre dağılımı nedir
select YEAR(OrderDate) Yil, MONTH(OrderDate) Ay, ShipVia Kargo, COUNT(*) Adet
from Orders
group by ShipVia, YEAR(OrderDate), MONTH(OrderDate)
order by Yil, Ay, Kargo

select * from Orders
