USE master;
GO

CREATE LOGIN CrediCoreDev
WITH PASSWORD = 'CrediCore#2026Dev!';
GO

USE CrediCore;
GO

CREATE USER CrediCoreDev
FOR LOGIN CrediCoreDev;
GO

GRANT SELECT ON Operaciones.vw_AtencionAlCliente
TO CrediCoreDev;
GO

GRANT EXECUTE TO CrediCoreDev;
GO