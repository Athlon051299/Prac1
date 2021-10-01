CREATE TABLE [dbo].[APODERADO] (
    [Id]        INT    IDENTITY (1,1)  NOT NULL,
    [Nombre]    NVARCHAR (50) NOT NULL,
    [Telefono]  NVARCHAR (50) NOT NULL,
    [Id_Alumno] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_APODERADO_ALUMNO] FOREIGN KEY ([Id_Alumno]) REFERENCES [dbo].[ALUMNO] ([Id])
);

