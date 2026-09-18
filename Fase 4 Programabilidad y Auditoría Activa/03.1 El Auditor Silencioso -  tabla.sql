USE CrediCore
GO 

CREATE SCHEMA Auditoria;
GO

CREATE TABLE Auditoria.Logs_Creditos
(
    [IdLog] INT IDENTITY(1,1) PRIMARY KEY,
    [Accion] VARCHAR(20) NOT NULL,
    [ValorAnterior] DECIMAL(5,2) NOT NULL,
    [ValorNuevo] DECIMAL(5,2) NOT NULL,
    [FechaHora] DATETIME NOT NULL DEFAULT GETDATE()
);
GO

SELECT *
FROM Auditoria.Logs_Creditos;