declare @sql nvarchar(max)  -- String degisken tanilama
set @sql = ' select * from Products' -- deger atama
-- exec @sql bu sekilde calismiyor
exec sp_executesql @sql -- calistiriyor
-- Ya da
exec (@sql)

-- Verilen tablodaki kayit sayisini veren procedure

-- create PROCEDURE KayitSayisi (@tablo as varchar(max))
-- as BEGIN
-- DECLARE @sql as NVARCHAR(max)
-- set @sql = 'Select count(*) from ' + @tablo
-- exec sp_executesql @sql
-- END

-- exec KayitSayisi 'Customers'
