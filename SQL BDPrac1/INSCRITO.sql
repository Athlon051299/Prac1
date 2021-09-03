﻿CREATE TABLE [dbo].[INSCRITO]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Id_alumno] INT NOT NULL, 
    [Cod_Curso] INT NOT NULL, 
    CONSTRAINT [FK_INSCRITO_ALUMNO] FOREIGN KEY ([Id_alumno]) REFERENCES [ALUMNO]([Id]), 
    CONSTRAINT [FK_INSCRITO_CURSO] FOREIGN KEY ([Cod_Curso]) REFERENCES [CURSO]([Codigo])
)