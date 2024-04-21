-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER dbo.CheckProduct -- Once Create sonra degisiklige ihtiyac olunca alter olarak kullanilir
	on dbo.[Order Details]
	INSTEAD OF INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Insert statements for trigger here
	-- Degisken Tanimlama
	Declare @productId int, @quantity int, @orderId int, @stocks smallint, @price money
	-- Gelen datayi yakalama
	select @productId=i.ProductID, 
		@quantity=i.Quantity, 
		@orderId=i.OrderID,
		@price = i.UnitPrice
	from inserted i
    -- Product Tablosuna gidip elimizdeki urun miktarina bakıyoruz
	select @stocks = UnitsInStock from Products where ProductID = @productId
	if(@quantity>@stocks) 
	Begin
		RAISERROR('Elimizdeki stok miktari satilandan kucuktur!', 16, 1);
		return
	End

	-- Fiyat kontrolu
	if(@price<1)
	Begin
		RAISERROR('Satis tutari 0 dan buyuk olmak zorundadir!', 16, 1);
		return
	End
	-- Product Tablosundaki UnitInStock alanini guncelleyelim
	Update Products set UnitsInStock = UnitsInStock - @quantity where ProductID = @productId

	-- Product Tablosundaki UnitOnOrder alanini guncelleyelim
	Update Products set UnitsOnOrder = UnitsOnOrder + @quantity where ProductID = @productId
END
GO
