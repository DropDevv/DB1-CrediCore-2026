SELECT TOP 1
    C.IdCliente,
    C.Nombres,
    C.Apellidos
FROM Operaciones.Clientes C
INNER JOIN Operaciones.Creditos CR
    ON C.IdCliente = CR.IdCliente;


DELETE FROM Operaciones.Clientes
WHERE IdCliente = 1;