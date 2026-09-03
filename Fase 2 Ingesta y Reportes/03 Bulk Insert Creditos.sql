USE CrediCore;
GO

-- Bulk Insert
BULK INSERT Operaciones.Creditos
FROM '/data/creditos_2000.txt'
WITH
(
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY,
    TABLOCK
);

SELECT * FROM Operaciones.Creditos C;