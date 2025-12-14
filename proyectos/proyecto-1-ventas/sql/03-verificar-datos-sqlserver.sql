-- ========================================
-- VERIFICACIÓN DE DATOS - Concesionario
-- Motor: Microsoft SQL Server
-- ========================================

USE Concesionario;
GO

PRINT '========================================';
PRINT '🔍 VERIFICACIÓN DE DATOS CARGADOS';
PRINT '========================================';
PRINT '';
GO

-- Verificar conteo de registros en cada tabla
PRINT '📊 Conteo de registros por tabla:';
PRINT '-----------------------------------';
GO

DECLARE @vehiculos INT, @clientes INT, @ventas INT, @prestamos INT;

SELECT @vehiculos = COUNT(*) FROM vehiculos;
SELECT @clientes = COUNT(*) FROM clientes;
SELECT @ventas = COUNT(*) FROM ventas;
SELECT @prestamos = COUNT(*) FROM prestamos;

PRINT '  Vehículos:  ' + CAST(@vehiculos AS VARCHAR(10));
PRINT '  Clientes:   ' + CAST(@clientes AS VARCHAR(10));
PRINT '  Ventas:     ' + CAST(@ventas AS VARCHAR(10));
PRINT '  Préstamos:  ' + CAST(@prestamos AS VARCHAR(10));
PRINT '';
GO

-- Verificar ventas totales
PRINT '💰 Resumen financiero:';
PRINT '-----------------------------------';
GO

SELECT
    'Total Ventas (COP)' AS Metrica,
    FORMAT(SUM(precio_final), 'C', 'es-CO') AS Valor
FROM ventas
UNION ALL
SELECT
    'Ticket Promedio',
    FORMAT(AVG(precio_final), 'C', 'es-CO')
FROM ventas
UNION ALL
SELECT
    'Total Préstamos',
    FORMAT(SUM(monto_prestamo), 'C', 'es-CO')
FROM prestamos;
GO

-- Ver muestra de datos de cada tabla
PRINT '';
PRINT '========================================';
PRINT '📋 MUESTRA DE DATOS (Top 3 registros)';
PRINT '========================================';
PRINT '';
GO

PRINT '--- VEHÍCULOS ---';
SELECT TOP 3 marca, modelo, precio_lista, estado FROM vehiculos;
GO

PRINT '--- CLIENTES ---';
SELECT TOP 3 nombre, apellido, ciudad, score_crediticio FROM clientes;
GO

PRINT '--- VENTAS ---';
SELECT TOP 3 id_venta, fecha_venta, precio_final, metodo_pago FROM ventas;
GO

PRINT '--- PRÉSTAMOS ---';
SELECT TOP 3 id_prestamo, monto_prestamo, tasa_interes_anual, plazo_meses FROM prestamos;
GO

PRINT '';
PRINT '========================================';
PRINT '✅ VERIFICACIÓN COMPLETADA';
PRINT '========================================';
PRINT 'La base de datos está lista para usar.';
PRINT 'Consulta la guía SQL en: ../guias/GUIA-SQL-COMPLETA.md';
PRINT '========================================';
GO