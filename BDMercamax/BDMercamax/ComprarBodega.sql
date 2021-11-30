CREATE PROCEDURE [dbo].[ComprarBodega]
	@codigo int = 0,
	@n int
AS
	UPDATE LugarStock SET cantidad_bodega = cantidad_bodega+@n WHERE barcode_producto = @codigo
RETURN 0
