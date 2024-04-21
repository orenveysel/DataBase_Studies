select top 1 * from Orders
SELECT * from Customers where CustomerID='VINET' -- Siparişi veren müşteri
SELECT * from Employees WHERE EmployeeID=5 -- Siparişi alan çalışan 
select * from Shippers where ShipperID=3 -- Siparişi taşıyan kargo firması

-- 1996 yılına ait siparişlerin listesi
select * from Orders where YEAR(OrderDate)=1996
-- 1996 yılında Aralık ayındaki siparişlerin listesi
select * from Orders where YEAR(OrderDate)=1996 and MONTH(OrderDate)=12
-- 1996 yılında Aralık ayının sonu gününe ait siparişlerin listesi
select * from Orders where YEAR(OrderDate)=1996 and MONTH(OrderDate)=12 and DAY(OrderDate)=31
-- Tarih alanlarını string değer ile sorgulama
select * from Orders where OrderDate='1996-12-12'
select * from Orders where OrderDate='1996.12.12'
select * from Orders where OrderDate='1996/12/12'
select * from Orders where OrderDate=CONVERT(datetime, '1996-12-25')
select * from Orders where OrderDate=CONVERT(datetime, '1996-25-12', 104)
select * from Orders where OrderDate>'1996-12-12'
-- DatePart Kullanımı: DatePart(tip, tarihKolonu)
-- Yıla göre tarihin parçasını alma
select * from Orders where Datepart (year, OrderDate) = 1996
select * from Orders where Datepart (yyyy, OrderDate) = 1996
select * from Orders where Datepart (yy, OrderDate) = 1996
-- Aya göre tarihin parçasını alma
select * from Orders where Datepart (MONTH, OrderDate) = 12 and DATEPART(year, OrderDate) = 1996

-- 1996 yılının son çeyreğindeki siparişlerin listesi
select * from Orders where YEAR(OrderDate)=1996 and MONTH(OrderDate)>=10 and MONTH(OrderDate)<=12
-- DatePart ile
select * from Orders where DATEPART(quarter, OrderDate)=4 and datepart(year,orderdate)=1996
-- Çalışanların yaşlarını bulalım
select FirstName, LastName, BirthDate, DATEDIFF(year, BirthDate, GETDATE()) Yas
from Employees
-- Çalışanların çalışma süreleri
select FirstName, LastName, BirthDate, DATEDIFF(year, BirthDate, GETDATE()) Yas,
HireDate, DATEDIFF(year, HireDate, GETDATE()) CalismaYili
from Employees

-- DatePart Detay
SELECT Datepart(hour, GETDATE()) Saat,
DATEPART(MINUTE, GETDATE()) dakika,
DATEPART(SECOND, GETDATE()) saniye,
DATEPART(MILLISECOND, GETDATE()) milisecond,
DATEPART(MICROSECOND, GETDATE()) microsecond


-- sorular
select * from Orders
-- Geç gönderilen siparişlerin listesi
select * from Orders
where ShippedDate > RequiredDate


