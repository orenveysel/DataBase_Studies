select * from Customers --where Country='Germany'

-- Berlindeki müşteriler
select * from Customers where City='Berlin'

-- İkinci bir şart vermek istersek and ifadesi ile çoğaltılabilir.
select * from Customers WHERE Country = 'USA' and Region = 'AK'

-- Hem USA'de hem de UK'da olan müşteriler
select * from Customers where Country = 'USA' or Country = 'AK'

-- Gelen listeyi ülkelere göre sıralı vaziyette alalım
-- Bu durumda order by ifadesi kullanılır
select *
from Customers
where Country = 'USA' or Country = 'UK'
order by Country ASC
-- Listeyi tersten sıralamak için
select *
from Customers
where Country = 'USA' or Country = 'UK'
order by Country DESC
-- Birden fazla alana göre sıralama
select * from Customers order by Country DESC, City ASC

-- Product tablosunda kategorisi 3 olan kayıtlar listesi
select * from Products where CategoryID=3
-- Employee tablosunda ingiliz uyruklu vatandaşların listesi
select * from Employees where Country='UK'
-- Kolonlara farklı isim verme: Alias = Takma isim
SELECT FirstName as Adi, LastName as Soyadi, Country as Ulke FROM Employees
-- Tablolara takma isim verme
SELECT FirstName  Adi, LastName  Soyadi, Country  Ulke FROM Employees as [sirket Calisanlari]

-- Kolonlara birden fazla kelime ile takma isim verme
SELECT FirstName + ' ' + LastName [Ad Soyad] from Employees

--Select farklı kullanımı
SELECT 5*3 -- Çarpma
SELECT 5+3
SELECT GETDATE() Tarih
SELECT 'Ali Veli'

-- Tablodaki kayı sayısını bulma
SELECT * FROM Employees
SELECT count(EmployeeID) [Kayit Sayisi] from Employees
SELECT count(Region) [Kayit Sayisi] from Employees -- Kayıt sayısı 9 adettir, null kayıtları sayılmaz
SELECT count(Country) [Kayit Sayisi] from Employees -- Kayıt sayısı 9 adettir
SELECT count(*) [Kayit Sayisi] from Employees
-- Eğer tekil kayıtların sayısını istersek distinct kelimesini kullanmamız gerekir
SELECT COUNT(distinct country) from Employees -- Kayıt sayısı 2 gelecektir
-- null kayıtların listelenmesi
select * from Employees where Region is NULL
-- null olmayan kayıtların listelenmesi
select * from Employees where Region is not NULL

-- Soru: fax'ı olmayan müşterilerin listesi
SELECT * from Customers where Fax is NULL

