CREATE TABLE [dbo].[CURSO] (
    [Cod]         INT   IDENTITY (1,1)  NOT NULL,
    [Nombre]      NVARCHAR (50) NOT NULL,
    [Fecha_incio] NVARCHAR (50) NOT NULL,
    [Duracion]    NVARCHAR (50) NOT NULL,
    [Valor]       INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Cod] ASC)
);

