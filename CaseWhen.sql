select FirstName, LastName,
    case (country)
    when 'USA' then 'Amerika'
    when 'UK' then 'Ingiltere'
    else 'Belirsiz Ulke'
    END Ulke
from Employees

-- Unite price 50'den küçük olanlar ucuz ürün, 50-150 arasında olanlar ekonomik
-- 150> olanlar pahalı olarak geri dönsün
select p.ProductName, 
    case
        when p.UnitPrice < 50 then sum(od.Quantity)
        when (p.UnitPrice >= 50 and p.UnitPrice < 150) then sum(od.Quantity)
        else sum(od.Quantity)
    END [Urun Tipi]
from Products p
inner join [Order Details] as od on od.ProductID = p.ProductID 
GROUP by p.ProductName, p.UnitPrice