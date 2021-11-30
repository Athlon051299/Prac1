CREATE PROCEDURE [dbo].[MoverAgondola]
	@codigo int,
	@n int
AS
	UPDATE LugarStock SET cantidad_bodega = cantidad_bodega-@n, cantidad_gondola=cantidad_gondola+@n WHERE barcode_producto = @codigo
RETURN 0
