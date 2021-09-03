﻿CREATE TABLE [dbo].[APODERADO]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Nombre] NVARCHAR(50) NOT NULL, 
    [Telf] INT NOT NULL, 
    [id_Alumnos] INT NOT NULL, 
    CONSTRAINT [FK_APODERADO_ALUMNO] FOREIGN KEY ([id_Alumnos]) REFERENCES [ALUMNO]([Id])
)
