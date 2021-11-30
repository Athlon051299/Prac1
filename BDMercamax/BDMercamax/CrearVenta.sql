CREATE PROCEDURE [dbo].[CrearVenta]
	@id int,
	@n int,
	@factura int 
AS
	insert into Venta (barcode_producto,cantidad,id_factura)values((SELECT barcode from Producto where id_producto=@id),@n,@factura)
RETURN 0
