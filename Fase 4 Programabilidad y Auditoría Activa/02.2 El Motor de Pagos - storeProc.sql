USE CrediCore
GO 

CREATE PROCEDURE Operaciones.SP_ProcesarPago
    @IdCredito INT,
    @MontoAbono DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SaldoActual DECIMAL(18,2);

    BEGIN TRY
        BEGIN TRAN;

        SELECT @SaldoActual = SaldoActual
        FROM Operaciones.Creditos
        WHERE IdCredito = @IdCredito;

        IF @SaldoActual IS NULL
            THROW 50001, 'El crédito ingresado no existe', 1;

        IF @MontoAbono <= 0
            THROW 50002, 'El monto del abono debe ser mayor que cero', 1;

        IF @MontoAbono > @SaldoActual
            THROW 50003, 'El monto del abono no puede ser mayor al saldo actual', 1;

        INSERT INTO Operaciones.HistorialPagos (IdCredito, MontoAbono)
        VALUES (@IdCredito, @MontoAbono);

        UPDATE Operaciones.Creditos
        SET SaldoActual = SaldoActual - @MontoAbono
        WHERE IdCredito = @IdCredito;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        THROW;
    END CATCH;
END;
GO