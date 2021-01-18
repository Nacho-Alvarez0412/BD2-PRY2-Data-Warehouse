﻿CREATE TABLE [dbo].[CLIENTES]
(
	[Id] INT IDENTITY NOT NULL, 
    [Codigo] NCHAR(5) NOT NULL, 
    [Pais] NCHAR(10) NOT NULL,
    CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED ([Id] ASC)
)
