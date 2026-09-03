USE CrediCore;
GO

-- Reporte de riesgo acumulado
SELECT
    Estado,
    SUM(MontoCapital) TotalCapitalPrestado,
    AVG(TasaInteresMensual) PromedioTasaInteres
FROM Operaciones.Creditos
GROUP BY Estado;

-- Reporte de concentración vehicular
SELECT
    V.Marca,
    COUNT(*) CantidadPrestamos
FROM Operaciones.Creditos C
INNER JOIN Garantias.Vehiculos V
    ON C.IdVehiculo = V.IdVehiculo
GROUP BY V.Marca
HAVING COUNT(*) > 50
ORDER BY CantidadPrestamos DESC;

-- Análisis de extremos
SELECT
    MAX(MontoCapital) PrestamoMayor,
    MIN(MontoCapital) PrestamoMenor
FROM Operaciones.Creditos;