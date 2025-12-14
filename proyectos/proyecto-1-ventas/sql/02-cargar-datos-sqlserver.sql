-- ========================================
-- CARGA DE DATOS - Concesionario
-- Motor: Microsoft SQL Server
-- CORREGIDO: Fechas en formato correcto
-- ========================================

USE Concesionario;
GO

-- ========================================
-- Insertar datos en tabla: vehiculos
-- ========================================

INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (1, N'Toyota', N'Corolla', 2023, N'Sedan', 85000000, 68000000, N'Blanco', N'Gasolina', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (2, N'Toyota', N'RAV4', 2023, N'SUV', 145000000, 116000000, N'Negro', N'Hibrido', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (3, N'Chevrolet', N'Spark', 2023, N'Hatchback', 52000000, 42000000, N'Rojo', N'Gasolina', N'Manual', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (4, N'Chevrolet', N'Tracker', 2023, N'SUV', 98000000, 78400000, N'Gris', N'Gasolina', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (5, N'Mazda', 3, 2023, N'Sedan', 95000000, 76000000, N'Azul', N'Gasolina', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (6, N'Mazda', N'CX-5', 2023, N'SUV', 135000000, 108000000, N'Blanco', N'Gasolina', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (7, N'Renault', N'Logan', 2023, N'Sedan', 58000000, 46400000, N'Gris', N'Gasolina', N'Manual', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (8, N'Renault', N'Duster', 2023, N'SUV', 82000000, 65600000, N'Verde', N'Gasolina', N'Manual', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (9, N'Nissan', N'Versa', 2023, N'Sedan', 72000000, 57600000, N'Plata', N'Gasolina', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (10, N'Nissan', N'Kicks', 2023, N'SUV', 88000000, 70400000, N'Naranja', N'Gasolina', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (11, N'Toyota', N'Corolla', 2022, N'Sedan', 78000000, 62400000, N'Gris', N'Gasolina', N'Automatica', 15000, N'Usado');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (12, N'Chevrolet', N'Onix', 2022, N'Hatchback', 62000000, 49600000, N'Blanco', N'Gasolina', N'Manual', 22000, N'Usado');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (13, N'Mazda', N'CX-30', 2022, N'SUV', 115000000, 92000000, N'Rojo', N'Gasolina', N'Automatica', 18000, N'Usado');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (14, N'Renault', N'Sandero', 2021, N'Hatchback', 48000000, 38400000, N'Azul', N'Gasolina', N'Manual', 35000, N'Usado');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (15, N'Nissan', N'Sentra', 2022, N'Sedan', 82000000, 65600000, N'Negro', N'Gasolina', N'Automatica', 20000, N'Usado');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (16, N'Toyota', N'Hilux', 2023, N'Pickup', 165000000, 132000000, N'Blanco', N'Diesel', N'Manual', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (17, N'Ford', N'Ranger', 2023, N'Pickup', 155000000, 124000000, N'Gris', N'Diesel', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (18, N'Chevrolet', N'Montana', 2023, N'Pickup', 95000000, 76000000, N'Blanco', N'Gasolina', N'Manual', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (19, N'Kia', N'Sportage', 2023, N'SUV', 125000000, 100000000, N'Negro', N'Gasolina', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (20, N'Hyundai', N'Tucson', 2023, N'SUV', 130000000, 104000000, N'Plata', N'Gasolina', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (21, N'Honda', N'City', 2023, N'Sedan', 88000000, 70400000, N'Blanco', N'Gasolina', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (22, N'Honda', N'HR-V', 2023, N'SUV', 108000000, 86400000, N'Rojo', N'Gasolina', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (23, N'Volkswagen', N'Gol', 2023, N'Hatchback', 55000000, 44000000, N'Gris', N'Gasolina', N'Manual', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (24, N'Volkswagen', N'T-Cross', 2023, N'SUV', 105000000, 84000000, N'Azul', N'Gasolina', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (25, N'Suzuki', N'Swift', 2023, N'Hatchback', 65000000, 52000000, N'Amarillo', N'Gasolina', N'Manual', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (26, N'Suzuki', N'Vitara', 2023, N'SUV', 92000000, 73600000, N'Verde', N'Gasolina', N'Manual', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (27, N'Toyota', N'Prius', 2023, N'Sedan', 120000000, 96000000, N'Plata', N'Hibrido', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (28, N'Mazda', 2, 2023, N'Sedan', 68000000, 54400000, N'Blanco', N'Gasolina', N'Automatica', 0, N'Nuevo');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (29, N'Chevrolet', N'Cruze', 2022, N'Sedan', 92000000, 73600000, N'Negro', N'Gasolina', N'Automatica', 12000, N'Usado');
INSERT INTO vehiculos (id_vehiculo, marca, modelo, año, tipo, precio_lista, costo_adquisicion, color, combustible, transmision, kilometraje, estado) VALUES (30, N'Nissan', N'X-Trail', 2023, N'SUV', 148000000, 118400000, N'Gris', N'Gasolina', N'Automatica', 0, N'Nuevo');
GO

PRINT '✅ Datos de vehiculos cargados: 30 registros';
GO

-- ========================================
-- Insertar datos en tabla: clientes
-- ========================================

INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (1, N'Carlos', N'Rodriguez', 35, N'M', N'Bogota', 8500000, 720, N'Ingeniero', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (2, N'Maria', N'Garcia', 28, N'F', N'Medellin', 6200000, 680, N'Contadora', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (3, N'Juan', N'Martinez', 42, N'M', N'Cali', 12000000, 750, N'Gerente', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (4, N'Ana', N'Lopez', 31, N'F', N'Bogota', 7800000, 695, N'Arquitecta', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (5, N'Pedro', N'Hernandez', 45, N'M', N'Barranquilla', 9500000, 710, N'Empresario', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (6, N'Laura', N'Gonzalez', 26, N'F', N'Cartagena', 5500000, 650, N'Diseñadora', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (7, N'Diego', N'Ramirez', 38, N'M', N'Bogota', 11000000, 740, N'Abogado', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (8, N'Sofia', N'Torres', 33, N'F', N'Medellin', 7200000, 685, N'Medico', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (9, N'Luis', N'Flores', 29, N'M', N'Cali', 6800000, 670, N'Contador', N'Soltero');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (10, N'Carmen', N'Ruiz', 41, N'F', N'Bogota', 10500000, 730, N'Directora', N'Casada');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (11, N'Jorge', N'Diaz', 36, N'M', N'Pereira', 7500000, 700, N'Ingeniero', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (12, N'Valentina', N'Castro', 27, N'F', N'Bucaramanga', 6000000, 660, N'Economista', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (13, N'Andres', N'Moreno', 44, N'M', N'Bogota', 13500000, 770, N'Ejecutivo', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (14, N'Carolina', N'Vargas', 32, N'F', N'Medellin', 8200000, 715, N'Consultora', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (15, N'Ricardo', N'Ortiz', 39, N'M', N'Cali', 9200000, 725, N'Comerciante', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (16, N'Natalia', N'Mendoza', 30, N'F', N'Bogota', 7000000, 690, N'Profesora', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (17, N'Sebastian', N'Rojas', 37, N'M', N'Barranquilla', 8800000, 705, N'Ingeniero', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (18, N'Daniela', N'Parra', 25, N'F', N'Cartagena', 5200000, 640, N'Asistente', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (19, N'Miguel', N'Silva', 43, N'M', N'Bogota', 11500000, 745, N'Gerente', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (20, N'Isabella', N'Gomez', 34, N'F', N'Medellin', 8000000, 710, N'Abogada', N'Casada');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (21, N'Camilo', N'Reyes', 31, N'M', N'Cali', 7300000, 695, N'Analista', N'Soltero');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (22, N'Juliana', N'Soto', 28, N'F', N'Bogota', 6500000, 675, N'Marketing', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (23, N'Felipe', N'Cruz', 40, N'M', N'Pereira', 10000000, 735, N'Empresario', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (24, N'Mariana', N'Jimenez', 29, N'F', N'Bucaramanga', 6700000, 680, N'Diseñadora', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (25, N'Alejandro', N'Navarro', 46, N'M', N'Bogota', 14000000, 780, N'Director', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (26, N'Paola', N'Medina', 33, N'F', N'Medellin', 7900000, 720, N'Consultora', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (27, N'Oscar', N'Rios', 38, N'M', N'Cali', 9800000, 728, N'Ingeniero', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (28, N'Andrea', N'Herrera', 26, N'F', N'Bogota', 5800000, 655, N'Estudiante', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (29, N'Roberto', N'Castillo', 41, N'M', N'Barranquilla', 10800000, 740, N'Gerente', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (30, N'Claudia', N'Pena', 35, N'F', N'Cartagena', 8300000, 718, N'Ejecutiva', N'Casada');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (31, N'Gustavo', N'Mora', 32, N'M', N'Bogota', 7600000, 702, N'Contador', N'Soltero');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (32, N'Sandra', N'Guerrero', 37, N'F', N'Medellin', 8600000, 722, N'Medico', N'Casada');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (33, N'Mauricio', N'Vega', 28, N'M', N'Cali', 6300000, 668, N'Analista', N'Soltero');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (34, N'Lucia', N'Ramos', 42, N'F', N'Bogota', 11200000, 748, N'Directora', N'Casada');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (35, N'Fernando', N'Molina', 36, N'M', N'Pereira', 8100000, 712, N'Ingeniero', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (36, N'Viviana', N'Leon', 30, N'F', N'Bucaramanga', 7100000, 692, N'Arquitecta', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (37, N'Gabriel', N'Campos', 44, N'M', N'Bogota', 12500000, 755, N'Empresario', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (38, N'Monica', N'Santana', 31, N'F', N'Medellin', 7400000, 698, N'Economista', N'Soltera');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (39, N'Javier', N'Cortes', 39, N'M', N'Cali', 9600000, 730, N'Comerciante', N'Casado');
INSERT INTO clientes (id_cliente, nombre, apellido, edad, genero, ciudad, ingreso_mensual, score_crediticio, ocupacion, estado_civil) VALUES (40, N'Patricia', N'Romero', 34, N'F', N'Bogota', 8400000, 716, N'Consultora', N'Casada');
GO

PRINT '✅ Datos de clientes cargados: 40 registros';
GO

-- ========================================
-- Insertar datos en tabla: ventas
-- ========================================

INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (1, '2024-01-15', 1, 1, 82000000, 3000000, N'Financiamiento', N'Juan Perez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (2, '2024-01-18', 3, 6, 50000000, 2000000, N'Contado', N'Maria Silva');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (3, '2024-01-22', 5, 4, 92000000, 3000000, N'Financiamiento', N'Carlos Lopez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (4, '2024-02-03', 7, 9, 56000000, 2000000, N'Contado', N'Juan Perez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (5, '2024-02-10', 2, 3, 140000000, 5000000, N'Financiamiento', N'Ana Martinez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (6, '2024-02-14', 9, 12, 70000000, 2000000, N'Financiamiento', N'Maria Silva');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (7, '2024-02-20', 4, 7, 95000000, 3000000, N'Financiamiento', N'Carlos Lopez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (8, '2024-03-05', 11, 2, 76000000, 2000000, N'Contado', N'Juan Perez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (9, '2024-03-12', 6, 10, 132000000, 3000000, N'Financiamiento', N'Ana Martinez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (10, '2024-03-18', 8, 15, 80000000, 2000000, N'Financiamiento', N'Maria Silva');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (11, '2024-03-25', 13, 8, 112000000, 3000000, N'Contado', N'Carlos Lopez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (12, '2024-04-02', 10, 5, 86000000, 2000000, N'Financiamiento', N'Juan Perez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (13, '2024-04-08', 16, 13, 160000000, 5000000, N'Financiamiento', N'Ana Martinez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (14, '2024-04-15', 12, 18, 60000000, 2000000, N'Contado', N'Maria Silva');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (15, '2024-04-22', 14, 11, 46000000, 2000000, N'Financiamiento', N'Carlos Lopez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (16, '2024-05-01', 15, 14, 80000000, 2000000, N'Financiamiento', N'Juan Perez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (17, '2024-05-10', 17, 19, 150000000, 5000000, N'Financiamiento', N'Ana Martinez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (18, '2024-05-16', 19, 16, 122000000, 3000000, N'Contado', N'Maria Silva');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (19, '2024-05-23', 21, 17, 85000000, 3000000, N'Financiamiento', N'Carlos Lopez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (20, '2024-05-28', 18, 20, 92000000, 3000000, N'Financiamiento', N'Juan Perez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (21, '2024-06-05', 20, 23, 128000000, 2000000, N'Financiamiento', N'Ana Martinez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (22, '2024-06-12', 22, 21, 105000000, 3000000, N'Contado', N'Maria Silva');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (23, '2024-06-18', 24, 26, 102000000, 3000000, N'Financiamiento', N'Carlos Lopez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (24, '2024-06-25', 23, 22, 53000000, 2000000, N'Contado', N'Juan Perez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (25, '2024-07-03', 25, 24, 63000000, 2000000, N'Financiamiento', N'Ana Martinez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (26, '2024-07-10', 27, 25, 118000000, 2000000, N'Financiamiento', N'Maria Silva');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (27, '2024-07-15', 26, 28, 90000000, 2000000, N'Contado', N'Carlos Lopez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (28, '2024-07-22', 28, 27, 66000000, 2000000, N'Financiamiento', N'Juan Perez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (29, '2024-07-28', 30, 29, 145000000, 3000000, N'Financiamiento', N'Ana Martinez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (30, '2024-08-05', 29, 30, 90000000, 2000000, N'Contado', N'Maria Silva');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (31, '2024-08-12', 1, 31, 83000000, 2000000, N'Financiamiento', N'Carlos Lopez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (32, '2024-08-18', 3, 33, 51000000, 1000000, N'Contado', N'Juan Perez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (33, '2024-08-25', 5, 32, 93000000, 2000000, N'Financiamiento', N'Ana Martinez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (34, '2024-09-02', 2, 34, 142000000, 3000000, N'Financiamiento', N'Maria Silva');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (35, '2024-09-08', 7, 36, 57000000, 1000000, N'Contado', N'Carlos Lopez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (36, '2024-09-15', 4, 35, 96000000, 2000000, N'Financiamiento', N'Juan Perez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (37, '2024-09-22', 6, 37, 133000000, 2000000, N'Financiamiento', N'Ana Martinez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (38, '2024-09-28', 9, 38, 71000000, 1000000, N'Financiamiento', N'Maria Silva');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (39, '2024-10-05', 10, 39, 87000000, 1000000, N'Financiamiento', N'Carlos Lopez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (40, '2024-10-12', 8, 40, 81000000, 1000000, N'Contado', N'Juan Perez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (41, '2024-10-18', 16, 1, 162000000, 3000000, N'Financiamiento', N'Ana Martinez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (42, '2024-10-25', 19, 3, 123000000, 2000000, N'Contado', N'Maria Silva');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (43, '2024-11-01', 21, 7, 86000000, 2000000, N'Financiamiento', N'Carlos Lopez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (44, '2024-11-08', 17, 13, 152000000, 3000000, N'Financiamiento', N'Juan Perez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (45, '2024-11-15', 20, 19, 129000000, 1000000, N'Financiamiento', N'Ana Martinez');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (46, '2024-11-20', 22, 14, 106000000, 2000000, N'Contado', N'Maria Silva');
INSERT INTO ventas (id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, descuento, metodo_pago, vendedor) VALUES (47, '2024-11-25', 24, 23, 103000000, 2000000, N'Financiamiento', N'Carlos Lopez');
GO

PRINT '✅ Datos de ventas cargados: 47 registros';
GO

-- ========================================
-- Insertar datos en tabla: prestamos
-- ========================================

INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (1, 1, 1, 60000000, 18.5, 60, 1850000, '2024-01-14', N'Banco Bogota', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (2, 3, 4, 70000000, 17.2, 48, 2100000, '2024-01-21', N'Bancolombia', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (3, 5, 3, 100000000, 16.8, 72, 2380000, '2024-02-09', N'Davivienda', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (4, 6, 12, 50000000, 19.5, 36, 1820000, '2024-02-13', N'BBVA', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (5, 7, 7, 70000000, 17.9, 60, 2050000, '2024-02-19', N'Banco Bogota', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (6, 9, 10, 95000000, 16.5, 60, 2520000, '2024-03-11', N'Bancolombia', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (7, 10, 15, 60000000, 18.8, 48, 1950000, '2024-03-17', N'Davivienda', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (8, 12, 5, 65000000, 17.5, 60, 1900000, '2024-04-01', N'BBVA', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (9, 13, 13, 120000000, 15.9, 72, 2750000, '2024-04-07', N'Banco Bogota', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (10, 15, 11, 35000000, 20.2, 36, 1450000, '2024-04-21', N'Bancolombia', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (11, 16, 14, 60000000, 18.3, 48, 1880000, '2024-04-30', N'Davivienda', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (12, 17, 19, 110000000, 16.2, 72, 2550000, '2024-05-09', N'BBVA', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (13, 19, 17, 65000000, 17.8, 60, 1910000, '2024-05-22', N'Banco Bogota', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (14, 20, 20, 70000000, 17.4, 48, 2080000, '2024-05-27', N'Bancolombia', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (15, 21, 23, 95000000, 16.7, 60, 2490000, '2024-06-04', N'Davivienda', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (16, 23, 26, 75000000, 17.6, 48, 2200000, '2024-06-17', N'BBVA', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (17, 25, 24, 48000000, 19.8, 36, 1780000, '2024-07-02', N'Banco Bogota', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (18, 26, 25, 90000000, 16.4, 60, 2380000, '2024-07-09', N'Bancolombia', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (19, 28, 27, 50000000, 19.1, 36, 1850000, '2024-07-21', N'Davivienda', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (20, 29, 29, 105000000, 16.0, 72, 2480000, '2024-07-27', N'BBVA', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (21, 31, 31, 62000000, 18.6, 48, 1920000, '2024-08-11', N'Banco Bogota', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (22, 33, 32, 70000000, 17.3, 60, 2020000, '2024-08-24', N'Bancolombia', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (23, 34, 34, 105000000, 15.8, 72, 2430000, '2024-09-01', N'Davivienda', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (24, 36, 35, 72000000, 17.7, 48, 2130000, '2024-09-14', N'BBVA', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (25, 37, 37, 98000000, 16.3, 60, 2560000, '2024-09-21', N'Banco Bogota', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (26, 38, 38, 55000000, 18.9, 48, 1780000, '2024-09-27', N'Bancolombia', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (27, 39, 39, 65000000, 17.9, 60, 1900000, '2024-10-04', N'Davivienda', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (28, 41, 1, 120000000, 15.7, 72, 2710000, '2024-10-17', N'BBVA', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (29, 43, 7, 65000000, 18.0, 48, 1980000, '2024-10-31', N'Banco Bogota', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (30, 44, 13, 115000000, 16.1, 72, 2670000, '2024-11-07', N'Bancolombia', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (31, 45, 19, 95000000, 16.6, 60, 2500000, '2024-11-14', N'Davivienda', N'Activo');
INSERT INTO prestamos (id_prestamo, id_venta, id_cliente, monto_prestamo, tasa_interes_anual, plazo_meses, cuota_mensual, fecha_aprobacion, entidad_financiera, estado) VALUES (32, 47, 23, 78000000, 17.5, 48, 2250000, '2024-11-24', N'BBVA', N'Activo');
GO

PRINT '✅ Datos de prestamos cargados: 32 registros';
GO
