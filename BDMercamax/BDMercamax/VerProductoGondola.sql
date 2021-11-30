CREATE PROCEDURE [dbo].[VerProductoGondola]
	@codProd int
	
AS
<<<<<<< HEAD
	SELECT cantidad_gondola, seccion_gondola FROM LugarStock WHERE barcode_producto=@codProd
=======
	SELECT cantidad_gondola, sección_gondola FROM LugarStock WHERE barcode_producto=@codProd
>>>>>>> master
RETURN 0
