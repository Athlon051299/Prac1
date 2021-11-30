/*
Script de implementación para BDMercamax

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "BDMercamax"
:setvar DefaultFilePrefix "BDMercamax"
:setvar DefaultDataPath "C:\Users\maarc\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\maarc\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'La siguiente operación se generó a partir de un archivo de registro de refactorización 3122cd56-c82d-4a6f-9518-17a48b033acd';

PRINT N'Cambiar el nombre de [dbo].[LugarStock].[sección_bodega] a seccion_bodega';


GO
EXECUTE sp_rename @objname = N'[dbo].[LugarStock].[sección_bodega]', @newname = N'seccion_bodega', @objtype = N'COLUMN';


GO
PRINT N'La siguiente operación se generó a partir de un archivo de registro de refactorización 3fbd021d-a382-4d99-909e-a3a9bcb82d9d';

PRINT N'Cambiar el nombre de [dbo].[LugarStock].[sección_gondola] a seccion_gondola';


GO
EXECUTE sp_rename @objname = N'[dbo].[LugarStock].[sección_gondola]', @newname = N'seccion_gondola', @objtype = N'COLUMN';


GO
PRINT N'Modificando Procedimiento [dbo].[VerProductoBodega]...';


GO
ALTER PROCEDURE [dbo].[VerProductoBodega]
	@codProd int 
	
AS
	SELECT cantidad_bodega, seccion_bodega fROM LugarStock WHERE barcode_producto=@codProd
RETURN 0
GO
PRINT N'Modificando Procedimiento [dbo].[VerProductoGondola]...';


GO
ALTER PROCEDURE [dbo].[VerProductoGondola]
	@codProd int
	
AS
	SELECT cantidad_gondola, seccion_gondola FROM LugarStock WHERE barcode_producto=@codProd
RETURN 0
GO
PRINT N'Creando Procedimiento [dbo].[ActualizarGondola]...';


GO
CREATE PROCEDURE [dbo].[ActualizarGondola]
	@id int,
	@n int
AS
	UPDATE LugarStock SET cantidad_gondola=cantidad_gondola- @n WHERE barcode_producto=(SELECT barcode FROM Producto WHERE id_producto=@id)
RETURN 0
GO
PRINT N'Creando Procedimiento [dbo].[ActualizarPuntos]...';


GO
CREATE PROCEDURE [dbo].[ActualizarPuntos]
@id int,
@n int
AS
	UPDATE Cliente SET puntos_acumulados=puntos_acumulados+ @n  WHERE cc_cliente=@id
RETURN 0
GO
-- Paso de refactorización para actualizar el servidor de destino con los registros de transacciones implementadas

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3122cd56-c82d-4a6f-9518-17a48b033acd')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3122cd56-c82d-4a6f-9518-17a48b033acd')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3fbd021d-a382-4d99-909e-a3a9bcb82d9d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3fbd021d-a382-4d99-909e-a3a9bcb82d9d')

GO

GO
PRINT N'Actualización completada.';


GO
