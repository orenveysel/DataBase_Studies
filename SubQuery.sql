-- SubQuery : Alt sorgu ya da iç içe sorgu

-- Urunler tablosunda fiyatı ortalamanın üzerinde olan ürünlerin listesi
DECLARE @ortalamaFiyat money -- Para tipinden bir değişken tanımlandı
select @ortalamaFiyat=AVG(UnitPrice) from Products -- değişkene ortalama fiyat atandı
select * from Products WHERE UnitPrice > @ortalamaFiyat -- bulunan ortalama fiyat sorguda kullanıldı

-- Kısa yol
select * from Products 
where UnitPrice > (select AVG(UnitPrice) from Products)

-- hiç sipariş almamış ürünler hangileridir
-- insert into Products (ProductName,CategoryID,SupplierID,UnitPrice, Discontinued)
--     VALUES ('Pide',1,1,25,1)

select * from Products
where ProductID not in (select ProductID from [Order Details])

select ProductName, 
(select CategoryName from Categories c where c.CategoryID=p.CategoryID) CategoriAdi,
(select CompanyName from Suppliers s where s.SupplierID=p.SupplierID) Tedarikçi
from Products p


select * from Products

