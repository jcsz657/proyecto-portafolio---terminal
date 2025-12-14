-- ========================================
-- PROYECTO: Análisis de Ventas Automotrices
-- Base de datos: Concesionario de Vehículos
-- ========================================

-- Tabla: vehiculos
-- Almacena el inventario de vehículos disponibles
CREATE TABLE IF NOT EXISTS vehiculos (
    id_vehiculo INTEGER PRIMARY KEY,
    marca TEXT NOT NULL,
    modelo TEXT NOT NULL,
    año INTEGER NOT NULL,
    tipo TEXT NOT NULL,
    precio_lista INTEGER NOT NULL,
    costo_adquisicion INTEGER NOT NULL,
    color TEXT,
    combustible TEXT,
    transmision TEXT,
    kilometraje INTEGER DEFAULT 0,
    estado TEXT CHECK(estado IN ('Nuevo', 'Usado'))
);

-- Tabla: clientes
-- Información de clientes del concesionario
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    edad INTEGER NOT NULL,
    genero TEXT CHECK(genero IN ('M', 'F')),
    ciudad TEXT,
    ingreso_mensual INTEGER,
    score_crediticio INTEGER CHECK(score_crediticio BETWEEN 300 AND 850),
    ocupacion TEXT,
    estado_civil TEXT
);

-- Tabla: ventas
-- Registro de todas las ventas realizadas
CREATE TABLE IF NOT EXISTS ventas (
    id_venta INTEGER PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_vehiculo INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    precio_final INTEGER NOT NULL,
    descuento INTEGER DEFAULT 0,
    metodo_pago TEXT CHECK(metodo_pago IN ('Contado', 'Financiamiento')),
    vendedor TEXT,
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabla: prestamos
-- Información de financiamiento para compras a crédito
CREATE TABLE IF NOT EXISTS prestamos (
    id_prestamo INTEGER PRIMARY KEY,
    id_venta INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    monto_prestamo INTEGER NOT NULL,
    tasa_interes_anual REAL NOT NULL,
    plazo_meses INTEGER NOT NULL,
    cuota_mensual INTEGER NOT NULL,
    fecha_aprobacion DATE NOT NULL,
    entidad_financiera TEXT,
    estado TEXT DEFAULT 'Activo',
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Índices para optimizar consultas
CREATE INDEX IF NOT EXISTS idx_ventas_fecha ON ventas(fecha_venta);
CREATE INDEX IF NOT EXISTS idx_ventas_cliente ON ventas(id_cliente);
CREATE INDEX IF NOT EXISTS idx_vehiculos_marca ON vehiculos(marca);
CREATE INDEX IF NOT EXISTS idx_clientes_ciudad ON clientes(ciudad);