CREATE PROCEDURE [dbo].[VerProductoBodega]
	@codProd int 
	
AS
<<<<<<< HEAD
	SELECT cantidad_bodega, seccion_bodega fROM LugarStock WHERE barcode_producto=@codProd
=======
	SELECT cantidad_bodega, secciÓn_bodega fROM LugarStock WHERE barcode_producto=@codProd
>>>>>>> master
RETURN 0
 