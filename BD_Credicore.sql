--==========================================
--Tarea 3 - Proyecto CrediCore
--Jefersson Chuc 2290-24-17162
--==========================================

--creacion BD
CREATE DATABASE CrediCore;
GO

USE CrediCore;
GO

--creacion esquemas
CREATE SCHEMA Operaciones;
GO

CREATE SCHEMA Garantias;
GO

--Tabla clientes
CREATE TABLE Operaciones.Clientes
(
    [IdCliente] INT IDENTITY(1,1) PRIMARY KEY,
    [Nombres] VARCHAR(100) NOT NULL,
    [Apellidos] VARCHAR(100) NOT NULL,
    [DPI] CHAR(13) NOT NULL UNIQUE,-- El DPI debe ser único 
    [Telefono] VARCHAR(15) NULL,
    [Correo] VARCHAR(150) NULL
);
GO

--Tabla vehiculos
CREATE TABLE Garantias.Vehiculos
(
    [IdVehiculo] INT IDENTITY(1,1) PRIMARY KEY,
    [Modelo] VARCHAR(100) NOT NULL,
    [Marca] VARCHAR(100) NOT NULL,
    [Anio] SMALLINT NOT NULL,
    [Color] VARCHAR(50) NULL,
    [NumeroTitulo] VARCHAR(50) NOT NULL,
    [Placa] VARCHAR(20) NOT NULL,
    [NumeroChasis] VARCHAR(50) NOT NULL,

    CONSTRAINT CK_Vehiculos_Anio
        CHECK ([Anio] >= 2011),-- Solo se permiten vehículos con año igual o mayor a 2011

    CONSTRAINT UQ_Vehiculos_Placa_Chasis
        UNIQUE ([Placa], [NumeroChasis])-- La combinación de placa y número de chasis debe ser única
);
GO

--Tabla creditos
CREATE TABLE Operaciones.Creditos
(
    [IdCredito] INT IDENTITY(1,1) PRIMARY KEY,
    [IdCliente] INT NOT NULL,
    [IdVehiculo] INT NOT NULL,
    [MontoCapital] DECIMAL(18,2) NOT NULL,
    [TasaInteresMensual] DECIMAL(5,2) NOT NULL,
    [Estado] VARCHAR(20) NOT NULL DEFAULT 'Activo',--Todo crédito se crea con estado 'Activo' 
    [FechaDesembolso] DATETIME NOT NULL DEFAULT GETDATE(),--y con la fecha y hora de desembolso obtenida del servidor

    CONSTRAINT CK_Creditos_MontoCapital
        CHECK ([MontoCapital] > 1000),-- El capital otorgado debe ser estrictamente mayor a Q1,000

    CONSTRAINT CK_Creditos_TasaInteres
        CHECK ([TasaInteresMensual] >= 0)-- La tasa de interés mensual no puede ser negativa
);
GO