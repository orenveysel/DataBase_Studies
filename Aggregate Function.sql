-- Toplam fonksiyonları ve gruplama fonksiyonları içerir

-- 1 Count: Sorgudaki kayıt sayısını verir. Null kayıtları saymaz
Select COUNT(*) from Employees
SELECT COUNT(Region) from Employees -- Null kayıtları saymaz
select count(*)  from Employees where Region is NULL
select * from Employees

-- Sum: Toplama fonksiyonu
-- Urunlerin toplam fiyatı 
select sum(UnitPrice) from Products
-- Urunlerin fiyat ortalamaları
select sum(UnitPrice)/count(*) Ortalama from Products
-- Daha kısa yolu Avg kullanma
select AVG(UnitPrice) Ortalama from Products

-- Çalışanların yaş ortalaması
SELECT Avg(year(GetDate()) - year(BirthDate)) from Employees
SELECT Avg(DATEDIFF(YEAR,BirthDate,GETDATE())) from Employees

-- Aşağıdaki sorgular hata verecektir.
-- Sum ve Avg ancak sayısal alanlarda kullanılır
select sum(FirstName) from Employees
select sum(BirthDate) from Employees

select Avg(FirstName) from Employees
select Avg(BirthDate) from Employees

-- Max: Maximum değeri bulur
SELECT Max(UnitPrice) from Products
select Max(FirstName) from Employees
select FirstName from Employees order by FirstName DESC
select Max(BirthDate) from Employees


-- Min: Minimum değeri bulur
select Min(UnitPrice) from Products
select Min(FirstName) from Employees
select Min(BirthDate) from Employees

