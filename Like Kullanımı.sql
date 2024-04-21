--
select * from Employees
-- FirstName a ile başlayan kayıtlar
select FirstName, LastName FROM Employees
where SUBSTRING(FirstName,1,1)='a'
-- like komutu ile
select FirstName, LastName FROM Employees
where FirstName like 'a%'
-- firstname alanında sonu t ile biten kayıtlar
select FirstName, LastName FROM Employees
where FirstName like '%t'
-- firstname alanında ikinci harfi a ile biten kayıtlar
select FirstName, LastName FROM Employees
where FirstName like '_a%'
-- firstname alanında a olan kayıtlar
select FirstName, LastName FROM Employees
where FirstName like '%a%'
-- ikinci harfi a ve 4. harfi r olan
select FirstName, LastName FROM Employees
where FirstName like '_a_r%'
-- a ile başlamayanlar
select FirstName, LastName FROM Employees
where FirstName not like 'a%'
-- firstname alanı t ile bitmeyenlerin listesi
select FirstName, LastName FROM Employees
where FirstName not like '%t'
-- ilk 10 kaydın getirilmesi
select top 10 * from Orders
-- ilk %10 kaydın getirilmesi
select top 10 percent * from Orders

-- contactname alanında 2. harfi a ya da e olanlar
--1. yol
select * from Customers
where ContactName like '_a%' or ContactName like '_e%'
--2. yol
select * from Customers
where ContactName like '_[ae]%'
-- ContactName'in ilk karakteri B ile F arasında olanlar gelsin
select * from Customers
where ContactName like '[B-F]%'
order by ContactName

select * from Customers
where ContactName BETWEEN 'B%' and 'G%'
Order by ContactName

select * from Customers
where ContactName BETWEEN 'B%' and 'G%'
Order by ContactName
