-- create FUNCTION dbo.ufnGetInventoryStock(@ProductID int)
-- RETURNS INT
-- as
-- -- Returns the stock level for the product
-- BEGIN
--     DECLARE @ret int
--     select @ret = sum(p.Quantity)
--     from Production.ProductInventory p
--     where p.ProductID = @ProductID
--         and p.LocationID = '6'
--     if (@ret is null)
--         set @ret = 0;
--     RETURN @ret;
-- END

create FUNCTION dbo.UrunSatisAdetleri(@productID int)
RETURNS INT
as
BEGIN
    DECLARE @Adet INT, @return int;
    set @return = 0
    select @Adet=sum(quantity) from [Order Details]
    where ProductID=@productID
    if(@Adet is not null)
        set @return = @Adet
    RETURN @return
END

select dbo.UrunSatisAdetleri(1)

select ProductID, ProductName, dbo.UrunSatisAdetleri(ProductID) SatisAdedi 
from Products
order by ProductID DESC

-- Table value donen fonksiyonlar

create FUNCTION dbo.KargoSiparisAdetleri(@shipperID int)
RETURNS TABLE
as
RETURN
(
select s.CompanyName, COUNT(*) as 'Adet'
from Orders as o
inner JOIN Shippers as s on s.ShipperID = o.ShipVia
where s.ShipperID = @shipperID
GROUP by s.CompanyName
)

select * from dbo.KargoSiparisAdetleri(1)

