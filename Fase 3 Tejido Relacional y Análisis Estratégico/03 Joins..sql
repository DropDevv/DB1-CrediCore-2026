-- Reporte maestro de créditos
SELECT
    c.Nombres + ' ' + c.Apellidos NombreCliente,
    c.Telefono,
    v.Marca,
    v.Placa,
    cr.MontoCapital MontoCredito,
    cr.Estado EstadoActual
FROM Operaciones.Creditos cr
INNER JOIN Operaciones.Clientes c
    ON cr.IdCliente = c.IdCliente
INNER JOIN Garantias.Vehiculos v
    ON cr.IdVehiculo = v.IdVehiculo;

-- Clientes que nunca han tramitado un crédito
SELECT
    c.Nombres + ' ' + c.Apellidos NombreCliente,
    c.Telefono
FROM Operaciones.Clientes c
LEFT JOIN Operaciones.Creditos cr
    ON c.IdCliente = cr.IdCliente
WHERE cr.IdCredito IS NULL;



--Prueba para verificar consulta
BEGIN TRANSACTION;
SET NOCOUNT OFF;

INSERT INTO Operaciones.Clientes (Nombres, Apellidos, DPI, Telefono, Correo)
VALUES ('Cliente', 'Sin Credito', '9999999999999', '55555555', 'sincredito@correo.com');

SELECT
    c.Nombres + ' ' + c.Apellidos NombreCliente,
    c.Telefono,
	cr.Idcredito
FROM Operaciones.Clientes c
LEFT JOIN Operaciones.Creditos cr
    ON c.IdCliente = cr.IdCliente
WHERE cr.IdCredito IS NULL;


ROLLBACK TRANSACTION;