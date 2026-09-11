-- Créditos con monto mayor al promedio histórico
SELECT
    c.Nombres + ' ' + c.Apellidos NombreCliente,
    cr.MontoCapital
FROM Operaciones.Creditos cr
INNER JOIN Operaciones.Clientes c
    ON cr.IdCliente = c.IdCliente
WHERE cr.MontoCapital >
(
    SELECT AVG(MontoCapital)
    FROM Operaciones.Creditos
);


-- Créditos garantizados con vehículos del año 2011 hacia atrás
SELECT
    c.Nombres + ' ' + c.Apellidos NombreCliente,
    cr.IdCredito
FROM Operaciones.Creditos cr
INNER JOIN Operaciones.Clientes c
    ON cr.IdCliente = c.IdCliente
WHERE cr.IdVehiculo IN
(
    SELECT v.IdVehiculo
    FROM Garantias.Vehiculos v
    WHERE v.Anio <= 2011
);