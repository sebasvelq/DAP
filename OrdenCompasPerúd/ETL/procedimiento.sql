--- Procedimiento de almacenado
CREATE PROCEDURE CargarDatos
AS
BEGIN
    -- Cargar datos desde el archivo CSV
    BULK INSERT TempData
    FROM 'C:\Users\gigim\OneDrive\Desktop\AnalisisdeDatos\Portafolio\OrdenCompasPerú\Data\ReportePCBienes202301.csv'
    WITH (
        FIELDTERMINATOR = ';',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2,
        CODEPAGE = 'ACP'
    );

    -- Limpiar y organizar los datos
    -- Insertar en la tabla DimProveedor
    INSERT INTO DimProveedor (RUC_Proveedor, Proveedor)
    SELECT DISTINCT RUC_PROVEEDOR, PROVEEDOR
    FROM TempData;

    -- Insertar en la tabla DimEntidad
    INSERT INTO DimEntidad (RUC_Entidad, Entidad)
    SELECT DISTINCT RUC_ENTIDAD, ENTIDAD
    FROM TempData;

    -- Insertar en la tabla DimTiempo
    INSERT INTO DimTiempo (FechaProceso, FechaFormalizacion, FechaUltimoEstado)
    SELECT DISTINCT FECHA_PROCESO, FECHA_FORMALIZACIÓN, FECHA_ÚLTIMO_ESTADO
    FROM TempData;

    -- Insertar en la tabla DimOrden
    INSERT INTO DimOrden (OrdenElectronica, OrdenElectronicaGenerada, EstadoOrdenElectronica, DocumentoEstadoOCAM, OrdenDigitalizada, DescripcionEstado, DescripcionCesionDerechos, AcuerdoMarco)
    SELECT DISTINCT ORDEN_ELECTRÓNICA, ORDEN_ELECTRÓNICA_GENERADA, ESTADO_ORDEN_ELECTRÓNICA, DOCUMENTO_ESTADO_OCAM, ORDEN_DIGITALIZADA, DESCRIPCIÓN_ESTADO, DESCRIPCIÓN_CESIÓN_DERECHOS, ACUERDO_MARCO
    FROM TempData;

    -- Insertar en la tabla FactOrden
    INSERT INTO FactOrden (ProveedorID, EntidadID, TiempoID, OrdenID, TipoProcedimiento, SubTotal, IGV, Total)
    SELECT
        (SELECT ProveedorID FROM DimProveedor WHERE RUC_Proveedor = t.RUC_PROVEEDOR AND Proveedor = t.PROVEEDOR),
        (SELECT EntidadID FROM DimEntidad WHERE RUC_Entidad = t.RUC_ENTIDAD AND Entidad = t.ENTIDAD),
        (SELECT TiempoID FROM DimTiempo WHERE FechaProceso = t.FECHA_PROCESO AND FechaFormalizacion = t.FECHA_FORMALIZACIÓN AND FechaUltimoEstado = t.FECHA_ÚLTIMO_ESTADO),
        (SELECT OrdenID FROM DimOrden WHERE OrdenElectronica = t.ORDEN_ELECTRÓNICA AND OrdenElectronicaGenerada = t.ORDEN_ELECTRÓNICA_GENERADA AND EstadoOrdenElectronica = t.ESTADO_ORDEN_ELECTRÓNICA),
        t.TIPO_PROCEDIMIENTO,
        t.SUB_TOTAL,
        t.IGV,
        t.TOTAL
    FROM TempData t;

    -- Limpiar la tabla temporal
    TRUNCATE TABLE TempData;
END;
