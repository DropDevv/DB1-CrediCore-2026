USE CrediCore
GO 

CREATE TRIGGER Operaciones.TR_AuditarTasaCredito
ON Operaciones.Creditos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Auditoria.Logs_Creditos
        (Accion, ValorAnterior, ValorNuevo, FechaHora)
    SELECT
        'UPDATE',
        d.TasaInteresMensual,
        i.TasaInteresMensual,
        GETDATE()
    FROM inserted i
    INNER JOIN deleted d
        ON i.IdCredito = d.IdCredito
    WHERE i.TasaInteresMensual <> d.TasaInteresMensual;
END;
GO