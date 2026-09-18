USE CrediCore;
GO
--tabla historial
CREATE TABLE Operaciones.HistorialPagos
(
    [IdPago] INT IDENTITY(1,1) PRIMARY KEY,
    [IdCredito] INT NOT NULL,
    [MontoAbono] DECIMAL(18,2) NOT NULL,
    [FechaPago] DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_HistorialPagos_Creditos
        FOREIGN KEY ([IdCredito])
        REFERENCES Operaciones.Creditos([IdCredito]),

    CONSTRAINT CK_HistorialPagos_MontoAbono
        CHECK ([MontoAbono] > 0)
);

SELECT TOP 10 *
FROM Operaciones.HistorialPagos;