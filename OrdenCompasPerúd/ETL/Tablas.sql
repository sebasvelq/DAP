--Crear las tablas de dimensiones y la tabla de hechos
CREATE TABLE DimProveedor (
    ProveedorID INT IDENTITY(1,1) PRIMARY KEY,
    RUC_Proveedor VARCHAR(20),
    Proveedor VARCHAR(255)
);

CREATE TABLE DimEntidad (
    EntidadID INT IDENTITY(1,1) PRIMARY KEY,
    RUC_Entidad VARCHAR(20),
    Entidad VARCHAR(255)
);

CREATE TABLE DimTiempo (
    TiempoID INT IDENTITY(1,1) PRIMARY KEY,
    FechaProceso DATETIME,
    FechaFormalizacion DATETIME,
    FechaUltimoEstado DATETIME
);

CREATE TABLE DimOrden (
    OrdenID INT IDENTITY(1,1) PRIMARY KEY,
    OrdenElectronica VARCHAR(50),
    OrdenElectronicaGenerada VARCHAR(255),
    EstadoOrdenElectronica VARCHAR(50),
    DocumentoEstadoOCAM VARCHAR(50),
    OrdenDigitalizada VARCHAR(255),
    DescripcionEstado VARCHAR(255),
    DescripcionCesionDerechos VARCHAR(255),
    AcuerdoMarco VARCHAR(255)
);

CREATE TABLE FactOrden (
    OrdenID INT,
    ProveedorID INT,
    EntidadID INT,
    TiempoID INT,
    TipoProcedimiento VARCHAR(50),
    SubTotal DECIMAL(18, 2),
    IGV DECIMAL(18, 2),
    Total DECIMAL(18, 2),
    FOREIGN KEY (ProveedorID) REFERENCES DimProveedor(ProveedorID),
    FOREIGN KEY (EntidadID) REFERENCES DimEntidad(EntidadID),
    FOREIGN KEY (TiempoID) REFERENCES DimTiempo(TiempoID),
    FOREIGN KEY (OrdenID) REFERENCES DimOrden(OrdenID)
);
