-- CRUD Create, Read, Update, Delete kelimelerinin kisaltmasidir

-- Kayit ekleme : Create => Insert islemi

-- INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...);

-- exec sp_helpstats 'dbo.Customers'
-- exec sp_helpdb

-- create TABLE #ExampleTempTable (
--     ID INT PRIMARY KEY,
--     Name NVARCHAR(50),
--     Age INT
-- );

-- create TABLE ##ExampleTempTable (
--     ID INT PRIMARY KEY,
--     Name NVARCHAR(50),
--     Age INT
-- );

-- Employees tablosuna kendinizi kaydedin
Insert into Employees (FirstName, LastName, City, Country, ReportsTo)
                values('Veysel', 'Oren', 'Istanbul', 'Turkey', 2)
Insert into Employees (FirstName, LastName, City, Country, BirthDate)
values('Feride2', 'Yilmaz', 'Istanbul', 'Turkey', convert(datetime, '13/01/2000'))

-- Yurtici kargo firmasini ekleyin
Insert into Shippers (CompanyName, Phone)
                VALUES('Yurtici Kargo','444 5 555')

-- Veri Guncelleme : Update
-- Update table_name
-- SET column1 = value1, column2 = value2, ...
-- WHERE condition

-- Tarih Alaninin 
Update Employees
SET HireDate = CONVERT(datetime, '13.12.2000',104)
Where EmployeeID = 17

-- Money alaninin guncellenmesi
Update Products SET UnitPrice = 30.1234
where ProductID = 78

select * from Products order by ProductID DESC

-- Tablonun yedegini almaya yarar
SELECT *
INTO YedekProduct
FROM Products
Update YedekProduct SET UnitPrice = 30.1234
-- where ProductID = 78

-- Cok kayitli tablodan yedek alma  *** ÇALIŞIRKEN MUTLAKA YEDEK AL***
SELECT top 10 *
INTO YedekOrder
FROM Orders

-- diger yontem
-- backup database Northwind
-- to disk = 'c:\Ercan\northwindBackup2.bak';

select * from YedekOrder

select * from Employees
-- Tablodan veri silmek için
-- DELETE FROM table_name WHERE condition;
delete from Employees where EmployeeID >= 12

select * from Shippers
insert into Shippers (CompanyName,Phone) VALUES ('Mng Kargo','1232132')
insert into Shippers VALUES ('Mng Kargo','1232132')
