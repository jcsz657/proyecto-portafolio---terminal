-- ========================================
-- PROYECTO: Análisis de Ventas Automotrices
-- Base de datos: Concesionario de Vehículos
-- Motor: Microsoft SQL Server
-- ========================================

-- IMPORTANTE: Ejecutar este script en SQL Server Management Studio (SSMS)

-- 1. CREAR LA BASE DE DATOS
USE master;
GO

-- Eliminar la base de datos si existe (para empezar limpio)
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Concesionario')
BEGIN
    ALTER DATABASE Concesionario SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Concesionario;
END
GO

-- Crear la nueva base de datos
CREATE DATABASE Concesionario;
GO

-- Usar la base de datos recién creada
USE Concesionario;
GO

PRINT '✅ Base de datos Concesionario creada exitosamente';
GO

-- ========================================
-- 2. CREAR TABLAS
-- ========================================

-- Tabla: vehiculos
-- Almacena el inventario de vehículos disponibles
CREATE TABLE vehiculos (
    id_vehiculo INT PRIMARY KEY,
    marca NVARCHAR(50) NOT NULL,
    modelo NVARCHAR(50) NOT NULL,
    año INT NOT NULL,
    tipo NVARCHAR(20) NOT NULL,
    precio_lista BIGINT NOT NULL,
    costo_adquisicion BIGINT NOT NULL,
    color NVARCHAR(20),
    combustible NVARCHAR(20),
    transmision NVARCHAR(20),
    kilometraje INT DEFAULT 0,
    estado NVARCHAR(10) CHECK(estado IN ('Nuevo', 'Usado'))
);
GO

PRINT '✅ Tabla vehiculos creada';
GO

-- Tabla: clientes
-- Información de clientes del concesionario
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL,
    apellido NVARCHAR(50) NOT NULL,
    edad INT NOT NULL,
    genero NCHAR(1) CHECK(genero IN ('M', 'F')),
    ciudad NVARCHAR(50),
    ingreso_mensual BIGINT,
    score_crediticio INT CHECK(score_crediticio BETWEEN 300 AND 850),
    ocupacion NVARCHAR(50),
    estado_civil NVARCHAR(20)
);
GO

PRINT '✅ Tabla clientes creada';
GO

-- Tabla: ventas
-- Registro de todas las ventas realizadas
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_vehiculo INT NOT NULL,
    id_cliente INT NOT NULL,
    precio_final BIGINT NOT NULL,
    descuento BIGINT DEFAULT 0,
    metodo_pago NVARCHAR(20) CHECK(metodo_pago IN ('Contado', 'Financiamiento')),
    vendedor NVARCHAR(50),
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
GO

PRINT '✅ Tabla ventas creada';
GO

-- Tabla: prestamos
-- Información de financiamiento para compras a crédito
CREATE TABLE prestamos (
    id_prestamo INT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_cliente INT NOT NULL,
    monto_prestamo BIGINT NOT NULL,
    tasa_interes_anual DECIMAL(5,2) NOT NULL,
    plazo_meses INT NOT NULL,
    cuota_mensual BIGINT NOT NULL,
    fecha_aprobacion DATE NOT NULL,
    entidad_financiera NVARCHAR(50),
    estado NVARCHAR(20) DEFAULT 'Activo',
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
GO

PRINT '✅ Tabla prestamos creada';
GO

-- ========================================
-- 3. CREAR ÍNDICES PARA OPTIMIZACIÓN
-- ========================================

CREATE INDEX idx_ventas_fecha ON ventas(fecha_venta);
CREATE INDEX idx_ventas_cliente ON ventas(id_cliente);
CREATE INDEX idx_vehiculos_marca ON vehiculos(marca);
CREATE INDEX idx_clientes_ciudad ON clientes(ciudad);
GO

PRINT '✅ Índices creados';
GO

PRINT '';
PRINT '========================================';
PRINT '✅ ESTRUCTURA DE BASE DE DATOS CREADA';
PRINT '========================================';
PRINT 'Tablas creadas: vehiculos, clientes, ventas, prestamos';
PRINT 'Próximo paso: Ejecutar script 02-cargar-datos-sqlserver.sql';
PRINT '========================================';
GO