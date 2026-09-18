USE CrediCore;
GO
--Agregar tabla de saldo actual 
ALTER TABLE Operaciones.Creditos
ADD SaldoActual DECIMAL(18,2) NULL;
GO

UPDATE Operaciones.Creditos
SET SaldoActual = MontoCapital;
GO

ALTER TABLE Operaciones.Creditos
ALTER COLUMN SaldoActual DECIMAL(18,2) NOT NULL;
GO

SELECT IdCredito, MontoCapital, SaldoActual
FROM Operaciones.Creditos;

--crear vista
CREATE VIEW Operaciones.vw_AtencionAlCliente
AS
SELECT
    CONCAT(c.Nombres, ' ', c.Apellidos) NombreCliente,
    cr.IdCredito NumeroCredito,
    v.Marca MarcaVehiculo,
    cr.Estado EstadoCredito,
    cr.SaldoActual
FROM Operaciones.Creditos cr
INNER JOIN Operaciones.Clientes c
    ON cr.IdCliente = c.IdCliente
INNER JOIN Garantias.Vehiculos v
    ON cr.IdVehiculo = v.IdVehiculo;


select * from Operaciones.vw_AtencionAlCliente