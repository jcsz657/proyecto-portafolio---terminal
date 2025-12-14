# 🎓 GUÍA COMPLETA DE SQL - De Básico a Intermedio Avanzado

**Proyecto:** Análisis de Ventas Automotrices
**Base de datos:** concesionario.db
**Objetivo:** Dominar SQL desde cero hasta nivel intermedio-avanzado

---

## 📚 ÍNDICE

1. [Introducción y Configuración](#1-introducción-y-configuración)
2. [Nivel 1: SQL Básico](#2-nivel-1-sql-básico)
3. [Nivel 2: Agregaciones y Agrupaciones](#3-nivel-2-agregaciones-y-agrupaciones)
4. [Nivel 3: JOINs (Combinaciones de Tablas)](#4-nivel-3-joins)
5. [Nivel 4: SQL Intermedio-Avanzado](#5-nivel-4-sql-intermedio-avanzado)
6. [Proyecto Final: Análisis Completo](#6-proyecto-final)

---

## 1. Introducción y Configuración

### ¿Qué es SQL?
SQL (Structured Query Language) es el lenguaje estándar para trabajar con bases de datos relacionales. Es **LA HABILIDAD MÁS DEMANDADA** para analistas de datos (90%+ de ofertas laborales).

### Tu Base de Datos

Tienes 4 tablas principales:

```
📊 vehiculos (30 registros)
   - id_vehiculo, marca, modelo, año, tipo, precio_lista, etc.

👥 clientes (40 registros)
   - id_cliente, nombre, apellido, edad, ciudad, ingreso_mensual, score_crediticio, etc.

🚗 ventas (47 registros)
   - id_venta, fecha_venta, id_vehiculo, id_cliente, precio_final, metodo_pago, etc.

💰 prestamos (32 registros)
   - id_prestamo, id_venta, monto_prestamo, tasa_interes_anual, plazo_meses, etc.
```

### Cómo Conectarte a la Base de Datos

**Opción 1: Desde Python (Recomendado para principiantes)**
```python
import sqlite3

# Conectar a la base de datos
conn = sqlite3.connect('sql/concesionario.db')
cursor = conn.cursor()

# Ejecutar consulta
cursor.execute("SELECT * FROM vehiculos LIMIT 5")

# Ver resultados
for row in cursor.fetchall():
    print(row)

conn.close()
```

**Opción 2: DB Browser for SQLite (Interfaz Gráfica)**
- Descargar: https://sqlitebrowser.org/
- Abrir el archivo `concesionario.db`

**Opción 3: Línea de comandos**
```bash
sqlite3 sql/concesionario.db
```

---

## 2. NIVEL 1: SQL Básico

### 2.1 SELECT - Seleccionar Datos

**Sintaxis básica:**
```sql
SELECT columna1, columna2, ...
FROM tabla;
```

#### Ejercicio 1: Tu Primera Consulta
```sql
-- Ver todos los vehículos
SELECT * FROM vehiculos;
```

**Explicación:**
- `SELECT *` = selecciona TODAS las columnas
- `FROM vehiculos` = de la tabla vehiculos

#### Ejercicio 2: Seleccionar Columnas Específicas
```sql
-- Ver solo marca, modelo y precio de vehículos
SELECT marca, modelo, precio_lista
FROM vehiculos;
```

**¿Por qué no usar SELECT *?**
- En bases de datos grandes, consume mucha memoria
- En empresas, es una mala práctica
- Siempre especifica las columnas que necesitas

---

### 2.2 WHERE - Filtrar Datos

**Sintaxis:**
```sql
SELECT columnas
FROM tabla
WHERE condicion;
```

#### Ejercicio 3: Filtro Simple
```sql
-- Ver solo vehículos Toyota
SELECT marca, modelo, precio_lista
FROM vehiculos
WHERE marca = 'Toyota';
```

**Operadores de comparación:**
- `=` : Igual
- `!=` o `<>` : Diferente
- `>` : Mayor que
- `<` : Menor que
- `>=` : Mayor o igual
- `<=` : Menor o igual

#### Ejercicio 4: Filtros Numéricos
```sql
-- Vehículos con precio mayor a 100 millones
SELECT marca, modelo, precio_lista
FROM vehiculos
WHERE precio_lista > 100000000;
```

#### Ejercicio 5: Múltiples Condiciones (AND / OR)
```sql
-- SUVs de marca Toyota
SELECT marca, modelo, tipo, precio_lista
FROM vehiculos
WHERE marca = 'Toyota' AND tipo = 'SUV';

-- Vehículos Toyota O Mazda
SELECT marca, modelo, precio_lista
FROM vehiculos
WHERE marca = 'Toyota' OR marca = 'Mazda';
```

#### Ejercicio 6: IN - Múltiples Valores
```sql
-- Vehículos de Bogotá, Medellín o Cali
-- (aplicado a clientes en este caso)
SELECT nombre, apellido, ciudad
FROM clientes
WHERE ciudad IN ('Bogota', 'Medellin', 'Cali');
```

#### Ejercicio 7: BETWEEN - Rangos
```sql
-- Clientes con ingresos entre 7 y 10 millones
SELECT nombre, apellido, ingreso_mensual
FROM clientes
WHERE ingreso_mensual BETWEEN 7000000 AND 10000000;
```

#### Ejercicio 8: LIKE - Búsqueda de Patrones
```sql
-- Vehículos cuyo modelo empieza con 'C'
SELECT marca, modelo
FROM vehiculos
WHERE modelo LIKE 'C%';

-- Vehículos cuyo modelo contiene 'ra'
SELECT marca, modelo
FROM vehiculos
WHERE modelo LIKE '%ra%';
```

**Wildcards:**
- `%` : Cualquier cantidad de caracteres
- `_` : Un solo carácter

---

### 2.3 ORDER BY - Ordenar Resultados

```sql
-- Vehículos ordenados por precio (menor a mayor)
SELECT marca, modelo, precio_lista
FROM vehiculos
ORDER BY precio_lista ASC;

-- Vehículos ordenados por precio (mayor a menor)
SELECT marca, modelo, precio_lista
FROM vehiculos
ORDER BY precio_lista DESC;
```

**ASC** = Ascendente (menor a mayor) - Por defecto
**DESC** = Descendente (mayor a menor)

#### Ejercicio 9: Ordenar por Múltiples Columnas
```sql
-- Ordenar por marca y luego por precio
SELECT marca, modelo, precio_lista
FROM vehiculos
ORDER BY marca ASC, precio_lista DESC;
```

---

### 2.4 LIMIT - Limitar Resultados

```sql
-- Top 5 vehículos más caros
SELECT marca, modelo, precio_lista
FROM vehiculos
ORDER BY precio_lista DESC
LIMIT 5;

-- Top 10 clientes con mejor score crediticio
SELECT nombre, apellido, score_crediticio
FROM clientes
ORDER BY score_crediticio DESC
LIMIT 10;
```

---

### 🎯 EJERCICIOS PRÁCTICOS - NIVEL 1

**Resuelve estos ejercicios tú mismo antes de ver las respuestas:**

1. Muestra todos los vehículos de tipo 'Pickup'
2. Clientes mayores de 35 años
3. Ventas realizadas después de junio 2024
4. Top 5 clientes con mayor ingreso mensual
5. Vehículos usados con precio menor a 80 millones
6. Clientes de Bogotá con score crediticio mayor a 700
7. Ventas pagadas en 'Contado'
8. Los 3 vehículos más baratos disponibles

<details>
<summary><b>Ver Soluciones</b></summary>

```sql
-- 1. Vehículos tipo Pickup
SELECT * FROM vehiculos WHERE tipo = 'Pickup';

-- 2. Clientes mayores de 35 años
SELECT nombre, apellido, edad FROM clientes WHERE edad > 35;

-- 3. Ventas después de junio 2024
SELECT * FROM ventas WHERE fecha_venta > '2024-06-30';

-- 4. Top 5 clientes con mayor ingreso
SELECT nombre, apellido, ingreso_mensual
FROM clientes
ORDER BY ingreso_mensual DESC
LIMIT 5;

-- 5. Vehículos usados < 80 millones
SELECT marca, modelo, precio_lista
FROM vehiculos
WHERE estado = 'Usado' AND precio_lista < 80000000;

-- 6. Clientes Bogotá + score > 700
SELECT nombre, apellido, ciudad, score_crediticio
FROM clientes
WHERE ciudad = 'Bogota' AND score_crediticio > 700;

-- 7. Ventas en contado
SELECT * FROM ventas WHERE metodo_pago = 'Contado';

-- 8. 3 vehículos más baratos
SELECT marca, modelo, precio_lista
FROM vehiculos
ORDER BY precio_lista ASC
LIMIT 3;
```
</details>

---

## 3. NIVEL 2: Agregaciones y Agrupaciones

### 3.1 Funciones de Agregación

Las funciones de agregación calculan un **valor único** a partir de múltiples filas.

**Funciones principales:**
- `COUNT()` - Contar registros
- `SUM()` - Sumar valores
- `AVG()` - Promedio
- `MAX()` - Valor máximo
- `MIN()` - Valor mínimo

#### COUNT - Contar Registros

```sql
-- ¿Cuántos vehículos tenemos en total?
SELECT COUNT(*) AS total_vehiculos
FROM vehiculos;

-- ¿Cuántos vehículos nuevos?
SELECT COUNT(*) AS vehiculos_nuevos
FROM vehiculos
WHERE estado = 'Nuevo';
```

**Nota:** `AS` crea un alias (nombre personalizado) para la columna.

#### SUM - Sumar Valores

```sql
-- Total de ventas en COP
SELECT SUM(precio_final) AS ventas_totales
FROM ventas;

-- Total de descuentos otorgados
SELECT SUM(descuento) AS descuentos_totales
FROM ventas;
```

#### AVG - Promedio

```sql
-- Precio promedio de vehículos
SELECT AVG(precio_lista) AS precio_promedio
FROM vehiculos;

-- Ingreso promedio de clientes
SELECT AVG(ingreso_mensual) AS ingreso_promedio
FROM clientes;
```

#### MAX y MIN

```sql
-- Vehículo más caro y más barato
SELECT
    MAX(precio_lista) AS precio_maximo,
    MIN(precio_lista) AS precio_minimo
FROM vehiculos;
```

---

### 3.2 GROUP BY - Agrupar Datos

`GROUP BY` agrupa filas que tienen valores iguales en columnas especificadas.

**Sintaxis:**
```sql
SELECT columna_agrupacion, FUNCION_AGREGACION(columna)
FROM tabla
GROUP BY columna_agrupacion;
```

#### Ejercicio 10: Ventas por Método de Pago

```sql
-- ¿Cuántas ventas por cada método de pago?
SELECT
    metodo_pago,
    COUNT(*) AS cantidad_ventas,
    SUM(precio_final) AS total_ventas
FROM ventas
GROUP BY metodo_pago;
```

**Resultado esperado:**
```
metodo_pago      | cantidad_ventas | total_ventas
-----------------|-----------------|-------------
Contado          | 15              | 1,350,000,000
Financiamiento   | 32              | 3,231,000,000
```

#### Ejercicio 11: Vehículos por Marca

```sql
-- ¿Cuántos vehículos hay de cada marca?
SELECT
    marca,
    COUNT(*) AS cantidad,
    AVG(precio_lista) AS precio_promedio
FROM vehiculos
GROUP BY marca
ORDER BY cantidad DESC;
```

#### Ejercicio 12: Clientes por Ciudad

```sql
SELECT
    ciudad,
    COUNT(*) AS total_clientes,
    AVG(ingreso_mensual) AS ingreso_promedio
FROM clientes
GROUP BY ciudad
ORDER BY total_clientes DESC;
```

---

### 3.3 HAVING - Filtrar Grupos

`WHERE` filtra **filas individuales** ANTES de agrupar.
`HAVING` filtra **grupos** DESPUÉS de agrupar.

```sql
-- Marcas con más de 2 vehículos en inventario
SELECT
    marca,
    COUNT(*) AS cantidad
FROM vehiculos
GROUP BY marca
HAVING COUNT(*) > 2;
```

```sql
-- Ciudades con ingreso promedio superior a 8 millones
SELECT
    ciudad,
    AVG(ingreso_mensual) AS ingreso_promedio
FROM clientes
GROUP BY ciudad
HAVING AVG(ingreso_mensual) > 8000000;
```

---

### 3.4 Funciones de Fecha

```sql
-- Ventas por mes
SELECT
    strftime('%Y-%m', fecha_venta) AS mes,
    COUNT(*) AS cantidad_ventas,
    SUM(precio_final) AS total_ventas
FROM ventas
GROUP BY mes
ORDER BY mes;
```

**Funciones de fecha útiles en SQLite:**
- `strftime('%Y', fecha)` - Año
- `strftime('%m', fecha)` - Mes
- `strftime('%Y-%m', fecha)` - Año-Mes
- `strftime('%w', fecha)` - Día de la semana

---

### 🎯 EJERCICIOS PRÁCTICOS - NIVEL 2

1. Total de préstamos otorgados por cada banco
2. Promedio de tasa de interés por plazo (36, 48, 60, 72 meses)
3. Número de ventas por vendedor
4. Vehículos por tipo (Sedan, SUV, etc.) con precio promedio
5. Clientes por rango de edad (20-30, 31-40, 41-50)
6. Ventas mensuales en el año 2024
7. Marcas que tienen precio promedio superior a 90 millones
8. Ciudades con más de 5 clientes

<details>
<summary><b>Ver Soluciones</b></summary>

```sql
-- 1. Préstamos por banco
SELECT
    entidad_financiera,
    COUNT(*) AS total_prestamos,
    SUM(monto_prestamo) AS monto_total
FROM prestamos
GROUP BY entidad_financiera;

-- 2. Tasa promedio por plazo
SELECT
    plazo_meses,
    AVG(tasa_interes_anual) AS tasa_promedio,
    COUNT(*) AS cantidad_prestamos
FROM prestamos
GROUP BY plazo_meses
ORDER BY plazo_meses;

-- 3. Ventas por vendedor
SELECT
    vendedor,
    COUNT(*) AS ventas_realizadas,
    SUM(precio_final) AS total_vendido
FROM ventas
GROUP BY vendedor
ORDER BY total_vendido DESC;

-- 4. Vehículos por tipo
SELECT
    tipo,
    COUNT(*) AS cantidad,
    AVG(precio_lista) AS precio_promedio
FROM vehiculos
GROUP BY tipo;

-- 5. Clientes por rango de edad
SELECT
    CASE
        WHEN edad BETWEEN 20 AND 30 THEN '20-30'
        WHEN edad BETWEEN 31 AND 40 THEN '31-40'
        WHEN edad BETWEEN 41 AND 50 THEN '41-50'
        ELSE '50+'
    END AS rango_edad,
    COUNT(*) AS cantidad
FROM clientes
GROUP BY rango_edad;

-- 6. Ventas mensuales 2024
SELECT
    strftime('%Y-%m', fecha_venta) AS mes,
    COUNT(*) AS ventas,
    SUM(precio_final) AS total
FROM ventas
WHERE fecha_venta >= '2024-01-01'
GROUP BY mes
ORDER BY mes;

-- 7. Marcas con precio promedio > 90M
SELECT
    marca,
    AVG(precio_lista) AS precio_promedio
FROM vehiculos
GROUP BY marca
HAVING AVG(precio_lista) > 90000000;

-- 8. Ciudades con más de 5 clientes
SELECT
    ciudad,
    COUNT(*) AS total_clientes
FROM clientes
GROUP BY ciudad
HAVING COUNT(*) > 5;
```
</details>

---

## 4. NIVEL 3: JOINs (Combinaciones de Tablas)

**JOINs son CRÍTICOS para analistas de datos.** Permiten combinar datos de múltiples tablas.

### 4.1 Conceptos de JOINs

Imagina que tienes:
- Tabla A (ventas): id_venta, id_cliente, precio
- Tabla B (clientes): id_cliente, nombre, ciudad

Para saber **quién compró** necesitas **unir** ambas tablas por `id_cliente`.

### 4.2 INNER JOIN

`INNER JOIN` devuelve solo los registros que tienen coincidencia en AMBAS tablas.

**Sintaxis:**
```sql
SELECT columnas
FROM tabla1
INNER JOIN tabla2
ON tabla1.columna_comun = tabla2.columna_comun;
```

#### Ejercicio 13: Ventas con Información del Cliente

```sql
-- Ver ventas con nombre del cliente
SELECT
    v.id_venta,
    v.fecha_venta,
    c.nombre,
    c.apellido,
    v.precio_final
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
ORDER BY v.fecha_venta DESC
LIMIT 10;
```

**Explicación:**
- `v` y `c` son **alias** para las tablas (más corto)
- `ON v.id_cliente = c.id_cliente` especifica la relación

#### Ejercicio 14: Ventas con Datos del Vehículo

```sql
-- Ver qué vehículos se vendieron
SELECT
    v.fecha_venta,
    ve.marca,
    ve.modelo,
    ve.año,
    v.precio_final
FROM ventas v
INNER JOIN vehiculos ve ON v.id_vehiculo = ve.id_vehiculo
ORDER BY v.fecha_venta;
```

#### Ejercicio 15: JOIN Triple - Ventas + Cliente + Vehículo

```sql
-- Análisis completo de ventas
SELECT
    v.id_venta,
    v.fecha_venta,
    c.nombre || ' ' || c.apellido AS cliente,
    c.ciudad,
    ve.marca,
    ve.modelo,
    v.precio_final,
    v.metodo_pago
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN vehiculos ve ON v.id_vehiculo = ve.id_vehiculo
ORDER BY v.fecha_venta DESC;
```

**Nota:** `||` concatena texto en SQLite.

---

### 4.3 LEFT JOIN

`LEFT JOIN` devuelve TODOS los registros de la tabla izquierda, y los coincidentes de la derecha. Si no hay coincidencia, devuelve NULL.

```sql
-- Ver todos los clientes y sus compras (incluso si no han comprado)
SELECT
    c.nombre,
    c.apellido,
    COUNT(v.id_venta) AS total_compras
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
ORDER BY total_compras DESC;
```

**¿Cuándo usar LEFT JOIN?**
- Cuando quieres ver TODO de la tabla principal (izquierda)
- Ejemplo: Clientes que NO han comprado, vehículos que NO se han vendido

```sql
-- Vehículos que aún no se han vendido
SELECT
    ve.marca,
    ve.modelo,
    ve.precio_lista,
    v.id_venta
FROM vehiculos ve
LEFT JOIN ventas v ON ve.id_vehiculo = v.id_vehiculo
WHERE v.id_venta IS NULL;
```

---

### 4.4 Análisis con JOINs y Agregaciones

#### Ejercicio 16: Top Clientes por Monto de Compra

```sql
SELECT
    c.nombre || ' ' || c.apellido AS cliente,
    c.ciudad,
    COUNT(v.id_venta) AS total_compras,
    SUM(v.precio_final) AS monto_total
FROM clientes c
INNER JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
ORDER BY monto_total DESC
LIMIT 10;
```

#### Ejercicio 17: Análisis de Préstamos por Cliente

```sql
SELECT
    c.nombre || ' ' || c.apellido AS cliente,
    c.score_crediticio,
    COUNT(p.id_prestamo) AS total_prestamos,
    SUM(p.monto_prestamo) AS deuda_total,
    AVG(p.tasa_interes_anual) AS tasa_promedio
FROM clientes c
INNER JOIN prestamos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente
ORDER BY deuda_total DESC;
```

---

### 🎯 EJERCICIOS PRÁCTICOS - NIVEL 3

1. Listar todas las ventas con nombre completo del cliente y marca/modelo del vehículo
2. Calcular el total de ventas por ciudad (usando JOIN con clientes)
3. Mostrar préstamos con información del cliente y del vehículo comprado
4. Identificar qué vendedor ha vendido más SUVs
5. Clientes que han comprado más de una vez
6. Promedio de score crediticio de clientes que solicitaron préstamo vs los que no
7. Marcas más vendidas en cada ciudad
8. Vehículos que NO se han vendido aún

<details>
<summary><b>Ver Soluciones</b></summary>

```sql
-- 1. Ventas con cliente y vehículo
SELECT
    v.id_venta,
    v.fecha_venta,
    c.nombre || ' ' || c.apellido AS cliente,
    ve.marca || ' ' || ve.modelo AS vehiculo,
    v.precio_final
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN vehiculos ve ON v.id_vehiculo = ve.id_vehiculo;

-- 2. Ventas por ciudad
SELECT
    c.ciudad,
    COUNT(v.id_venta) AS total_ventas,
    SUM(v.precio_final) AS monto_total
FROM clientes c
INNER JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.ciudad
ORDER BY monto_total DESC;

-- 3. Préstamos con info completa
SELECT
    p.id_prestamo,
    c.nombre || ' ' || c.apellido AS cliente,
    ve.marca || ' ' || ve.modelo AS vehiculo,
    p.monto_prestamo,
    p.tasa_interes_anual,
    p.plazo_meses
FROM prestamos p
INNER JOIN ventas v ON p.id_venta = v.id_venta
INNER JOIN clientes c ON p.id_cliente = c.id_cliente
INNER JOIN vehiculos ve ON v.id_vehiculo = ve.id_vehiculo;

-- 4. Vendedor top en SUVs
SELECT
    v.vendedor,
    COUNT(*) AS suvs_vendidos
FROM ventas v
INNER JOIN vehiculos ve ON v.id_vehiculo = ve.id_vehiculo
WHERE ve.tipo = 'SUV'
GROUP BY v.vendedor
ORDER BY suvs_vendidos DESC
LIMIT 1;

-- 5. Clientes con múltiples compras
SELECT
    c.nombre || ' ' || c.apellido AS cliente,
    COUNT(v.id_venta) AS compras
FROM clientes c
INNER JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
HAVING COUNT(v.id_venta) > 1;

-- 6. Score: con préstamo vs sin préstamo
SELECT
    CASE
        WHEN p.id_cliente IS NOT NULL THEN 'Con Prestamo'
        ELSE 'Sin Prestamo'
    END AS categoria,
    AVG(c.score_crediticio) AS score_promedio
FROM clientes c
LEFT JOIN prestamos p ON c.id_cliente = p.id_cliente
GROUP BY categoria;

-- 7. Marca más vendida por ciudad
SELECT
    c.ciudad,
    ve.marca,
    COUNT(*) AS ventas
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN vehiculos ve ON v.id_vehiculo = ve.id_vehiculo
GROUP BY c.ciudad, ve.marca
ORDER BY c.ciudad, ventas DESC;

-- 8. Vehículos no vendidos
SELECT
    ve.marca,
    ve.modelo,
    ve.precio_lista
FROM vehiculos ve
LEFT JOIN ventas v ON ve.id_vehiculo = v.id_vehiculo
WHERE v.id_venta IS NULL;
```
</details>

---

## 5. NIVEL 4: SQL Intermedio-Avanzado

### 5.1 Subconsultas (Subqueries)

Una subconsulta es una consulta **dentro de otra consulta**.

#### Subconsulta en WHERE

```sql
-- Clientes con ingresos superiores al promedio
SELECT nombre, apellido, ingreso_mensual
FROM clientes
WHERE ingreso_mensual > (
    SELECT AVG(ingreso_mensual)
    FROM clientes
);
```

```sql
-- Vehículos más caros que el promedio de su tipo
SELECT v1.marca, v1.modelo, v1.tipo, v1.precio_lista
FROM vehiculos v1
WHERE v1.precio_lista > (
    SELECT AVG(v2.precio_lista)
    FROM vehiculos v2
    WHERE v2.tipo = v1.tipo
);
```

#### Subconsulta con IN

```sql
-- Clientes que tienen préstamos activos
SELECT nombre, apellido, ciudad
FROM clientes
WHERE id_cliente IN (
    SELECT DISTINCT id_cliente
    FROM prestamos
);
```

---

### 5.2 CASE WHEN - Lógica Condicional

`CASE WHEN` permite crear categorías o aplicar lógica condicional.

```sql
-- Clasificar clientes por score crediticio
SELECT
    nombre,
    apellido,
    score_crediticio,
    CASE
        WHEN score_crediticio >= 750 THEN 'Excelente'
        WHEN score_crediticio >= 700 THEN 'Bueno'
        WHEN score_crediticio >= 650 THEN 'Regular'
        ELSE 'Malo'
    END AS categoria_credito
FROM clientes
ORDER BY score_crediticio DESC;
```

```sql
-- Categorizar ventas por monto
SELECT
    id_venta,
    precio_final,
    CASE
        WHEN precio_final >= 150000000 THEN 'Premium'
        WHEN precio_final >= 100000000 THEN 'Alto'
        WHEN precio_final >= 70000000 THEN 'Medio'
        ELSE 'Economico'
    END AS segmento
FROM ventas;
```

---

### 5.3 Window Functions (Funciones de Ventana)

**Window Functions son CLAVE para análisis avanzado.** Permiten cálculos sobre un "conjunto de filas" relacionado con la fila actual.

#### ROW_NUMBER - Numerar Filas

```sql
-- Ranking de ventas por monto
SELECT
    fecha_venta,
    precio_final,
    vendedor,
    ROW_NUMBER() OVER (ORDER BY precio_final DESC) AS ranking
FROM ventas;
```

#### RANK - Con Empates

```sql
-- Ranking de clientes por ingreso
SELECT
    nombre,
    apellido,
    ingreso_mensual,
    RANK() OVER (ORDER BY ingreso_mensual DESC) AS ranking
FROM clientes;
```

#### Partition By - Ranking por Grupos

```sql
-- Mejores 3 ventas de cada vendedor
SELECT *
FROM (
    SELECT
        vendedor,
        fecha_venta,
        precio_final,
        ROW_NUMBER() OVER (
            PARTITION BY vendedor
            ORDER BY precio_final DESC
        ) AS ranking_vendedor
    FROM ventas
)
WHERE ranking_vendedor <= 3;
```

---

### 5.4 CTE (Common Table Expressions)

CTEs hacen tu código más legible y permiten queries complejos.

**Sintaxis:**
```sql
WITH nombre_cte AS (
    -- Consulta
)
SELECT * FROM nombre_cte;
```

#### Ejemplo: Análisis de Clientes Premium

```sql
WITH clientes_premium AS (
    SELECT
        c.id_cliente,
        c.nombre || ' ' || c.apellido AS cliente,
        SUM(v.precio_final) AS total_comprado
    FROM clientes c
    INNER JOIN ventas v ON c.id_cliente = v.id_cliente
    GROUP BY c.id_cliente
    HAVING SUM(v.precio_final) > 100000000
)
SELECT
    cp.*,
    c.score_crediticio,
    c.ingreso_mensual
FROM clientes_premium cp
INNER JOIN clientes c ON cp.id_cliente = c.id_cliente
ORDER BY cp.total_comprado DESC;
```

---

### 🎯 EJERCICIOS PRÁCTICOS - NIVEL 4

1. Clientes que compraron vehículos más caros que el promedio
2. Ranking de las 5 mejores ventas por mes
3. Categorizar préstamos por riesgo (tasa alta, media, baja)
4. Calcular el ticket promedio por ciudad y compararlo con el global
5. Identificar el cliente top de cada ciudad
6. Ventas acumuladas por vendedor
7. Clientes que compraron en el top 20% de ventas más caras

<details>
<summary><b>Ver Soluciones</b></summary>

```sql
-- 1. Clientes con compras > promedio
SELECT
    c.nombre || ' ' || c.apellido AS cliente,
    v.precio_final
FROM clientes c
INNER JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.precio_final > (
    SELECT AVG(precio_final)
    FROM ventas
);

-- 2. Top 5 ventas por mes
WITH ventas_rankeadas AS (
    SELECT
        strftime('%Y-%m', fecha_venta) AS mes,
        precio_final,
        vendedor,
        ROW_NUMBER() OVER (
            PARTITION BY strftime('%Y-%m', fecha_venta)
            ORDER BY precio_final DESC
        ) AS ranking
    FROM ventas
)
SELECT *
FROM ventas_rankeadas
WHERE ranking <= 5;

-- 3. Categorizar préstamos por riesgo
SELECT
    id_prestamo,
    monto_prestamo,
    tasa_interes_anual,
    CASE
        WHEN tasa_interes_anual >= 19 THEN 'Alto Riesgo'
        WHEN tasa_interes_anual >= 17 THEN 'Medio Riesgo'
        ELSE 'Bajo Riesgo'
    END AS categoria_riesgo
FROM prestamos;

-- 4. Ticket promedio por ciudad vs global
WITH promedio_global AS (
    SELECT AVG(precio_final) AS prom_global
    FROM ventas
)
SELECT
    c.ciudad,
    AVG(v.precio_final) AS ticket_promedio,
    pg.prom_global,
    AVG(v.precio_final) - pg.prom_global AS diferencia
FROM clientes c
INNER JOIN ventas v ON c.id_cliente = v.id_cliente
CROSS JOIN promedio_global pg
GROUP BY c.ciudad
ORDER BY ticket_promedio DESC;

-- 5. Cliente top por ciudad
WITH compras_por_cliente AS (
    SELECT
        c.id_cliente,
        c.nombre || ' ' || c.apellido AS cliente,
        c.ciudad,
        SUM(v.precio_final) AS total_comprado,
        ROW_NUMBER() OVER (
            PARTITION BY c.ciudad
            ORDER BY SUM(v.precio_final) DESC
        ) AS ranking
    FROM clientes c
    INNER JOIN ventas v ON c.id_cliente = v.id_cliente
    GROUP BY c.id_cliente, c.ciudad
)
SELECT ciudad, cliente, total_comprado
FROM compras_por_cliente
WHERE ranking = 1;

-- 6. Ventas acumuladas por vendedor
SELECT
    vendedor,
    fecha_venta,
    precio_final,
    SUM(precio_final) OVER (
        PARTITION BY vendedor
        ORDER BY fecha_venta
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS ventas_acumuladas
FROM ventas
ORDER BY vendedor, fecha_venta;

-- 7. Clientes en top 20% ventas
WITH percentil AS (
    SELECT precio_final
    FROM ventas
    ORDER BY precio_final DESC
    LIMIT (SELECT COUNT(*) * 0.2 FROM ventas)
)
SELECT DISTINCT
    c.nombre || ' ' || c.apellido AS cliente,
    v.precio_final
FROM clientes c
INNER JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.precio_final >= (SELECT MIN(precio_final) FROM percentil)
ORDER BY v.precio_final DESC;
```
</details>

---

## 6. PROYECTO FINAL: Análisis Completo

### 📊 Dashboard Ejecutivo - Queries Clave

Estas son las consultas que un analista de datos usaría para crear un dashboard ejecutivo:

#### KPIs Principales

```sql
-- KPIs del negocio
WITH kpis AS (
    SELECT
        (SELECT COUNT(*) FROM ventas) AS total_ventas,
        (SELECT SUM(precio_final) FROM ventas) AS ingresos_totales,
        (SELECT AVG(precio_final) FROM ventas) AS ticket_promedio,
        (SELECT COUNT(*) FROM prestamos) AS prestamos_otorgados,
        (SELECT SUM(monto_prestamo) FROM prestamos) AS monto_financiado,
        (SELECT COUNT(DISTINCT id_cliente) FROM ventas) AS clientes_activos
)
SELECT * FROM kpis;
```

#### Análisis de Tendencias

```sql
-- Tendencia mensual de ventas
SELECT
    strftime('%Y-%m', fecha_venta) AS mes,
    COUNT(*) AS num_ventas,
    SUM(precio_final) AS ingresos,
    AVG(precio_final) AS ticket_promedio,
    SUM(CASE WHEN metodo_pago = 'Financiamiento' THEN 1 ELSE 0 END) AS ventas_financiadas
FROM ventas
GROUP BY mes
ORDER BY mes;
```

#### Análisis de Producto

```sql
-- Performance por categoría de vehículo
SELECT
    ve.tipo,
    COUNT(v.id_venta) AS unidades_vendidas,
    SUM(v.precio_final) AS ingresos,
    AVG(v.precio_final) AS precio_promedio,
    SUM(ve.precio_lista - ve.costo_adquisicion) AS margen_bruto
FROM vehiculos ve
LEFT JOIN ventas v ON ve.id_vehiculo = v.id_vehiculo
GROUP BY ve.tipo
ORDER BY ingresos DESC;
```

#### Análisis de Clientes

```sql
-- Segmentación de clientes
SELECT
    CASE
        WHEN score_crediticio >= 750 THEN 'Premium'
        WHEN score_crediticio >= 700 THEN 'Estandar'
        ELSE 'Basico'
    END AS segmento,
    COUNT(*) AS num_clientes,
    COUNT(v.id_venta) AS total_compras,
    AVG(v.precio_final) AS ticket_promedio,
    SUM(v.precio_final) AS ingresos_segmento
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY segmento;
```

---

## 🎓 Evaluación Final

**Si puedes resolver este ejercicio, tienes nivel INTERMEDIO-AVANZADO en SQL:**

### Ejercicio Integrador

Crea una consulta que muestre:
1. Mes de venta
2. Total de ingresos
3. Número de unidades vendidas
4. Ticket promedio
5. % de ventas financiadas
6. Top 3 marcas más vendidas ese mes
7. Ciudad con más ventas
8. Comparación vs mes anterior (crecimiento %)

<details>
<summary><b>Ver Solución Avanzada</b></summary>

```sql
WITH ventas_mes AS (
    SELECT
        strftime('%Y-%m', v.fecha_venta) AS mes,
        SUM(v.precio_final) AS ingresos,
        COUNT(*) AS unidades,
        AVG(v.precio_final) AS ticket_promedio,
        ROUND(100.0 * SUM(CASE WHEN v.metodo_pago = 'Financiamiento' THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_financiado
    FROM ventas v
    GROUP BY mes
),
marcas_top AS (
    SELECT
        strftime('%Y-%m', v.fecha_venta) AS mes,
        GROUP_CONCAT(ve.marca) AS top_marcas
    FROM (
        SELECT
            strftime('%Y-%m', v.fecha_venta) AS mes,
            ve.marca,
            COUNT(*) AS ventas,
            ROW_NUMBER() OVER (
                PARTITION BY strftime('%Y-%m', v.fecha_venta)
                ORDER BY COUNT(*) DESC
            ) AS ranking
        FROM ventas v
        INNER JOIN vehiculos ve ON v.id_vehiculo = ve.id_vehiculo
        GROUP BY mes, ve.marca
    ) sub
    WHERE ranking <= 3
    GROUP BY mes
),
ciudad_top AS (
    SELECT
        strftime('%Y-%m', v.fecha_venta) AS mes,
        c.ciudad,
        COUNT(*) AS ventas,
        ROW_NUMBER() OVER (
            PARTITION BY strftime('%Y-%m', v.fecha_venta)
            ORDER BY COUNT(*) DESC
        ) AS ranking
    FROM ventas v
    INNER JOIN clientes c ON v.id_cliente = c.id_cliente
    GROUP BY mes, c.ciudad
)
SELECT
    vm.mes,
    vm.ingresos,
    vm.unidades,
    vm.ticket_promedio,
    vm.pct_financiado AS pct_financiado,
    mt.top_marcas,
    ct.ciudad AS ciudad_top
FROM ventas_mes vm
LEFT JOIN marcas_top mt ON vm.mes = mt.mes
LEFT JOIN ciudad_top ct ON vm.mes = ct.mes AND ct.ranking = 1
ORDER BY vm.mes;
```
</details>

---

## ✅ Checklist de Dominio SQL

Marca lo que ya dominas:

**Básico:**
- [ ] SELECT, WHERE, ORDER BY, LIMIT
- [ ] Operadores de comparación (=, >, <, !=)
- [ ] AND, OR, IN, BETWEEN, LIKE
- [ ] COUNT, SUM, AVG, MAX, MIN
- [ ] GROUP BY, HAVING

**Intermedio:**
- [ ] INNER JOIN
- [ ] LEFT JOIN
- [ ] Múltiples JOINs en una consulta
- [ ] Subconsultas en WHERE
- [ ] CASE WHEN
- [ ] Funciones de fecha
- [ ] Alias y concatenación

**Avanzado:**
- [ ] Window Functions (ROW_NUMBER, RANK)
- [ ] PARTITION BY
- [ ] CTEs (WITH)
- [ ] Subconsultas complejas
- [ ] Análisis de cohortes
- [ ] Optimización de consultas

---

## 🚀 Siguientes Pasos

### 1. Practica Diariamente
- Resuelve los 50+ ejercicios de esta guía
- Practica en plataformas:
  - **LeetCode SQL** (gratis)
  - **HackerRank SQL** (gratis)
  - **Mode Analytics SQL Tutorial**
  - **SQLBolt**

### 2. Proyectos Reales
- Analiza esta base de datos automotriz
- Crea dashboards con Python + SQL
- Exporta resultados a Excel/Power BI

### 3. SQL en Entrevistas
Las empresas evalúan SQL en entrevistas. Preguntas típicas:
- JOINs (múltiples tablas)
- Window functions
- Optimización de queries
- Análisis de negocio con SQL

---

## 📚 Recursos Adicionales

**Documentación:**
- SQLite Official Docs: https://www.sqlite.org/docs.html
- W3Schools SQL: https://www.w3schools.com/sql/

**Práctica:**
- LeetCode Database: https://leetcode.com/problemset/database/
- HackerRank SQL: https://www.hackerrank.com/domains/sql
- Mode SQL Tutorial: https://mode.com/sql-tutorial/

**Libros:**
- "SQL for Data Analysis" - Cathy Tanimura
- "Learning SQL" - Alan Beaulieu

---

**💡 RECUERDA:** SQL es LA habilidad más demandada para analistas de datos. Dominar SQL te abre las puertas al 90%+ de trabajos en el mercado.

**🎯 Tu objetivo:** Resolver todos los ejercicios de esta guía y luego practicar en LeetCode SQL hasta que puedas resolver problemas Medium sin ayuda.

---

*Guía creada para el Proyecto de Análisis Automotriz - Portafolio de Datos*
