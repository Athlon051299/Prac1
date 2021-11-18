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
/*
Se está quitando la columna [dbo].[Cliente].[fecha_nacimiento_cliente]; puede que se pierdan datos.

Se está quitando la columna [dbo].[Cliente].[nombre_apellido]; puede que se pierdan datos.

Debe agregarse la columna [dbo].[Cliente].[email_cliente] de la tabla [dbo].[Cliente], pero esta columna no tiene un valor predeterminado y no admite valores NULL. Si la tabla contiene datos, el script ALTER no funcionará. Para evitar esta incidencia, agregue un valor predeterminado a la columna, márquela de modo que permita valores NULL o habilite la generación de valores predeterminados inteligentes como opción de implementación.

Debe agregarse la columna [dbo].[Cliente].[fecha_nacimiento] de la tabla [dbo].[Cliente], pero esta columna no tiene un valor predeterminado y no admite valores NULL. Si la tabla contiene datos, el script ALTER no funcionará. Para evitar esta incidencia, agregue un valor predeterminado a la columna, márquela de modo que permita valores NULL o habilite la generación de valores predeterminados inteligentes como opción de implementación.

Debe agregarse la columna [dbo].[Cliente].[nombre_apellido_cliente] de la tabla [dbo].[Cliente], pero esta columna no tiene un valor predeterminado y no admite valores NULL. Si la tabla contiene datos, el script ALTER no funcionará. Para evitar esta incidencia, agregue un valor predeterminado a la columna, márquela de modo que permita valores NULL o habilite la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[Cliente])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
/*
Se está quitando la columna [dbo].[LugarStock].[seccion_bodega]; puede que se pierdan datos.

Se está quitando la columna [dbo].[LugarStock].[seccion_gondola]; puede que se pierdan datos.

Debe agregarse la columna [dbo].[LugarStock].[sección_bodega] de la tabla [dbo].[LugarStock], pero esta columna no tiene un valor predeterminado y no admite valores NULL. Si la tabla contiene datos, el script ALTER no funcionará. Para evitar esta incidencia, agregue un valor predeterminado a la columna, márquela de modo que permita valores NULL o habilite la generación de valores predeterminados inteligentes como opción de implementación.

Debe agregarse la columna [dbo].[LugarStock].[sección_gondola] de la tabla [dbo].[LugarStock], pero esta columna no tiene un valor predeterminado y no admite valores NULL. Si la tabla contiene datos, el script ALTER no funcionará. Para evitar esta incidencia, agregue un valor predeterminado a la columna, márquela de modo que permita valores NULL o habilite la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[LugarStock])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
/*
Se está quitando la columna [dbo].[Producto].[id_productos]; puede que se pierdan datos.

Debe agregarse la columna [dbo].[Producto].[id_producto] de la tabla [dbo].[Producto], pero esta columna no tiene un valor predeterminado y no admite valores NULL. Si la tabla contiene datos, el script ALTER no funcionará. Para evitar esta incidencia, agregue un valor predeterminado a la columna, márquela de modo que permita valores NULL o habilite la generación de valores predeterminados inteligentes como opción de implementación.

La columna barcode de la tabla [dbo].[Producto] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.

La columna fecha_llegada de la tabla [dbo].[Producto] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.

La columna fecha_vencimiento de la tabla [dbo].[Producto] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.

La columna id_tipo de la tabla [dbo].[Producto] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.

La columna nit de la tabla [dbo].[Producto] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.

La columna nombre_producto de la tabla [dbo].[Producto] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.

La columna precio de la tabla [dbo].[Producto] debe cambiarse de NULL a NOT NULL. Si la tabla contiene datos, puede que no funcione el script ALTER. Para evitar esta incidencia, debe agregar valores en todas las filas de esta columna, marcar la columna de modo que permita valores NULL o habilitar la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[Producto])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
/*
Debe agregarse la columna [dbo].[Tipo_Producto].[puntos] de la tabla [dbo].[Tipo_Producto], pero esta columna no tiene un valor predeterminado y no admite valores NULL. Si la tabla contiene datos, el script ALTER no funcionará. Para evitar esta incidencia, agregue un valor predeterminado a la columna, márquela de modo que permita valores NULL o habilite la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[Tipo_Producto])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
PRINT N'Quitando Clave externa [dbo].[FK_Facturacion_ToTable]...';


GO
ALTER TABLE [dbo].[Facturacion] DROP CONSTRAINT [FK_Facturacion_ToTable];


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[Cliente]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Cliente] (
    [cc_cliente]              INT            NOT NULL,
    [nombre_apellido_cliente] NVARCHAR (MAX) NOT NULL,
    [telefono_cliente]        NVARCHAR (MAX) NOT NULL,
    [email_cliente]           NVARCHAR (MAX) NOT NULL,
    [direccion_cliente]       NVARCHAR (MAX) NOT NULL,
    [fecha_nacimiento]        DATE           NOT NULL,
    [puntos_acumulados]       INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([cc_cliente] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Cliente])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Cliente] ([cc_cliente], [telefono_cliente], [direccion_cliente], [puntos_acumulados])
        SELECT   [cc_cliente],
                 [telefono_cliente],
                 [direccion_cliente],
                 [puntos_acumulados]
        FROM     [dbo].[Cliente]
        ORDER BY [cc_cliente] ASC;
    END

DROP TABLE [dbo].[Cliente];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Cliente]', N'Cliente';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Modificando Tabla [dbo].[LugarStock]...';


GO
ALTER TABLE [dbo].[LugarStock] DROP COLUMN [seccion_bodega], COLUMN [seccion_gondola];


GO
ALTER TABLE [dbo].[LugarStock]
    ADD [sección_bodega]  NVARCHAR (MAX) NOT NULL,
        [sección_gondola] NVARCHAR (MAX) NOT NULL;


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[Producto]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Producto] (
    [id_producto]       INT             NOT NULL,
    [nombre_producto]   NVARCHAR (MAX)  NOT NULL,
    [fecha_llegada]     DATE            NOT NULL,
    [fecha_vencimiento] DATE            NOT NULL,
    [barcode]           INT             NOT NULL,
    [precio]            DECIMAL (18, 2) NOT NULL,
    [nit]               INT             NOT NULL,
    [id_tipo]           INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([id_producto] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Producto])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Producto] ([nombre_producto], [fecha_llegada], [fecha_vencimiento], [barcode], [precio], [nit], [id_tipo])
        SELECT [nombre_producto],
               [fecha_llegada],
               [fecha_vencimiento],
               [barcode],
               [precio],
               [nit],
               [id_tipo]
        FROM   [dbo].[Producto];
    END

DROP TABLE [dbo].[Producto];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Producto]', N'Producto';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Modificando Tabla [dbo].[Tipo_Producto]...';


GO
ALTER TABLE [dbo].[Tipo_Producto]
    ADD [puntos] INT NOT NULL;


GO
PRINT N'Creando Clave externa [dbo].[FK_Facturacion_ToTable]...';


GO
ALTER TABLE [dbo].[Facturacion] WITH NOCHECK
    ADD CONSTRAINT [FK_Facturacion_ToTable] FOREIGN KEY ([cc_cliente]) REFERENCES [dbo].[Cliente] ([cc_cliente]);


GO
PRINT N'Creando Clave externa [dbo].[FK_Producto_ToTable]...';


GO
ALTER TABLE [dbo].[Producto] WITH NOCHECK
    ADD CONSTRAINT [FK_Producto_ToTable] FOREIGN KEY ([nit]) REFERENCES [dbo].[Proveedor] ([nit]);


GO
PRINT N'Creando Clave externa [dbo].[FK_Producto_ToTable_1]...';


GO
ALTER TABLE [dbo].[Producto] WITH NOCHECK
    ADD CONSTRAINT [FK_Producto_ToTable_1] FOREIGN KEY ([id_tipo]) REFERENCES [dbo].[Tipo_Producto] ([id_tipo]);


GO
PRINT N'Creando Vista [dbo].[VerProductos]...';


GO
CREATE VIEW [dbo].[VerProductos]
	AS
	SELECT nombre_producto, precio FROM Producto
GO
PRINT N'Modificando Procedimiento [dbo].[LoginCliente]...';


GO
ALTER PROCEDURE [dbo].[LoginCliente]
	@user int
	
AS
	SELECT cc_cliente, nombre_apellido_cliente FROM Cliente WHERE cc_Cliente=@user
RETURN 0
GO
PRINT N'Creando Procedimiento [dbo].[VerProductoBodega]...';


GO
CREATE PROCEDURE [dbo].[VerProductoBodega]
	@codProd int 
	
AS
	SELECT cantidad_bodega, secciÓn_bodega fROM LugarStock WHERE barcode_producto=@codProd
RETURN 0
GO
PRINT N'Creando Procedimiento [dbo].[VerProductoGondola]...';


GO
CREATE PROCEDURE [dbo].[VerProductoGondola]
	@codProd int
	
AS
	SELECT cantidad_gondola, sección_gondola FROM LugarStock WHERE barcode_producto=@codProd
RETURN 0
GO
PRINT N'Creando Procedimiento [dbo].[VerPuntos]...';


GO
CREATE PROCEDURE [dbo].[VerPuntos]
	@user int
	
AS
	SELECT puntos_acumulados FROM Cliente WHERE cc_cliente=@user
RETURN 0
GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Facturacion] WITH CHECK CHECK CONSTRAINT [FK_Facturacion_ToTable];

ALTER TABLE [dbo].[Producto] WITH CHECK CHECK CONSTRAINT [FK_Producto_ToTable];

ALTER TABLE [dbo].[Producto] WITH CHECK CHECK CONSTRAINT [FK_Producto_ToTable_1];


GO
PRINT N'Actualización completada.';


GO
