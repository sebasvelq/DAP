--- Procedimiento de almacenado
CREATE PROCEDURE CargarDatos
AS
BEGIN
    -- Cargar datos desde el archivo CSV
    BULK INSERT TempData
    FROM 'C:\Users\gigim\OneDrive\Desktop\AnalisisdeDatos\Portafolio\OrdenCompasPer�\Data\ReportePCBienes202301.csv'
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
    SELECT DISTINCT FECHA_PROCESO, FECHA_FORMALIZACI�N, FECHA_�LTIMO_ESTADO
    FROM TempData;

    -- Insertar en la tabla DimOrden
    INSERT INTO DimOrden (OrdenElectronica, OrdenElectronicaGenerada, EstadoOrdenElectronica, DocumentoEstadoOCAM, OrdenDigitalizada, DescripcionEstado, DescripcionCesionDerechos, AcuerdoMarco)
    SELECT DISTINCT ORDEN_ELECTR�NICA, ORDEN_ELECTR�NICA_GENERADA, ESTADO_ORDEN_ELECTR�NICA, DOCUMENTO_ESTADO_OCAM, ORDEN_DIGITALIZADA, DESCRIPCI�N_ESTADO, DESCRIPCI�N_CESI�N_DERECHOS, ACUERDO_MARCO
    FROM TempData;

    -- Insertar en la tabla FactOrden
    INSERT INTO FactOrden (ProveedorID, EntidadID, TiempoID, OrdenID, TipoProcedimiento, SubTotal, IGV, Total)
    SELECT
        (SELECT ProveedorID FROM DimProveedor WHERE RUC_Proveedor = t.RUC_PROVEEDOR AND Proveedor = t.PROVEEDOR),
        (SELECT EntidadID FROM DimEntidad WHERE RUC_Entidad = t.RUC_ENTIDAD AND Entidad = t.ENTIDAD),
        (SELECT TiempoID FROM DimTiempo WHERE FechaProceso = t.FECHA_PROCESO AND FechaFormalizacion = t.FECHA_FORMALIZACI�N AND FechaUltimoEstado = t.FECHA_�LTIMO_ESTADO),
        (SELECT OrdenID FROM DimOrden WHERE OrdenElectronica = t.ORDEN_ELECTR�NICA AND OrdenElectronicaGenerada = t.ORDEN_ELECTR�NICA_GENERADA AND EstadoOrdenElectronica = t.ESTADO_ORDEN_ELECTR�NICA),
        t.TIPO_PROCEDIMIENTO,
        t.SUB_TOTAL,
        t.IGV,
        t.TOTAL
    FROM TempData t;

    -- Limpiar la tabla temporal
    TRUNCATE TABLE TempData;
END;
