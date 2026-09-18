USE CrediCore;
GO

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT * FROM Operaciones.Clientes;
SELECT * FROM Operaciones.Creditos;
SELECT * FROM Garantias.Vehiculos;


--BACKUP DATABASE CrediCore
--TO DISK = '/data/backup/CrediCore_Fase3.bak'
--WITH INIT;

--pago
SELECT IdCredito, SaldoActual
FROM Operaciones.Creditos
WHERE IdCredito = 1;

EXEC Operaciones.SP_ProcesarPago
    @IdCredito = 1,
    @MontoAbono = 100;

SELECT IdCredito, SaldoActual
FROM Operaciones.Creditos
WHERE IdCredito = 1;

SELECT *
FROM Operaciones.HistorialPagos
WHERE IdCredito = 1;

--tabla bitacora 
SELECT IdCredito, TasaInteresMensual FROM Operaciones.Creditos
WHERE IdCredito = 1;

UPDATE Operaciones.Creditos
SET TasaInteresMensual = 4.50
WHERE IdCredito = 1;

SELECT * FROM Auditoria.Logs_Creditos;

SELECT IdCredito, TasaInteresMensual
FROM Operaciones.Creditos
WHERE IdCredito = 1;