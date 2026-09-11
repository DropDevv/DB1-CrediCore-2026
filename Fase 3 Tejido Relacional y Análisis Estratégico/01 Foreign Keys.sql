USE CrediCore;
GO

-- Relación entre créditos y clientes
ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT FK_Creditos_Clientes
FOREIGN KEY (IdCliente)
REFERENCES Operaciones.Clientes(IdCliente);
GO

-- Relación entre créditos y vehículos
ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT FK_Creditos_Vehiculos
FOREIGN KEY (IdVehiculo)
REFERENCES Garantias.Vehiculos(IdVehiculo);
GO