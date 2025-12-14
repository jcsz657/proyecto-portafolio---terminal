# 🎯 Guía Paso a Paso: Importar Proyecto a SQL Server

**Objetivo:** Configurar la base de datos del concesionario en SQL Server Management Studio (SSMS)

**Tiempo estimado:** 10-15 minutos

---

## 📋 REQUISITOS PREVIOS

Antes de comenzar, asegúrate de tener:

- ✅ SQL Server instalado (Express, Developer o Enterprise)
- ✅ SQL Server Management Studio (SSMS) instalado
- ✅ SQL Server corriendo (servicio activo)

---

## 🚀 PASO 1: Abrir SQL Server Management Studio

1. Busca **"SQL Server Management Studio"** en el menú de inicio de Windows
2. Abre la aplicación
3. Conecta al servidor:
   - **Tipo de servidor:** Motor de base de datos
   - **Nombre del servidor:** `localhost` o `(local)` o `.\SQLEXPRESS`
   - **Autenticación:** Windows Authentication (recomendado)
   - Click en **"Conectar"**

---

## 🗄️ PASO 2: Crear la Base de Datos y Tablas

### Opción A: Usando el Explorador de Objetos (GUI)

1. En SSMS, haz click en **"Nueva consulta"** (botón en la barra superior)
2. Navega a la carpeta del proyecto en tu sistema:
   ```
   /mnt/c/Users/TU_USUARIO/Desktop/mi-portafolio-datos/proyectos/proyecto-1-ventas/sql/
   ```
   (Ajusta la ruta según tu configuración de WSL)

3. Abre el archivo: `01-crear-base-datos-sqlserver.sql`
4. **Copia TODO el contenido** del archivo
5. **Pega** en la ventana de consulta de SSMS
6. Click en **"Ejecutar"** (botón ▶️ o presiona F5)

**Resultado esperado:**
```
✅ Base de datos Concesionario creada exitosamente
✅ Tabla vehiculos creada
✅ Tabla clientes creada
✅ Tabla ventas creada
✅ Tabla prestamos creada
✅ Índices creados
```

### Opción B: Abrir archivo directamente en SSMS

1. En SSMS: **Archivo → Abrir → Archivo**
2. Navega a:
   - Windows: `C:\Users\TU_USUARIO\Desktop\mi-portafolio-datos\proyectos\proyecto-1-ventas\sql\`
   - WSL: `/mnt/c/Users/TU_USUARIO/Desktop/...`
3. Selecciona: `01-crear-base-datos-sqlserver.sql`
4. Click en **"Ejecutar"** (F5)

---

## 📥 PASO 3: Cargar los Datos

Ahora vamos a insertar todos los datos (vehículos, clientes, ventas, préstamos):

1. En SSMS, abre una **nueva consulta** (Ctrl + N)
2. Abre el archivo: `02-cargar-datos-sqlserver.sql`
3. **Copia TODO el contenido** y pégalo en la consulta
4. Click en **"Ejecutar"** (F5)

**Este proceso insertará:**
- 30 vehículos
- 40 clientes
- 47 ventas
- 32 préstamos

**Tiempo de ejecución:** ~5 segundos

**Resultado esperado:**
```
✅ Datos de vehiculos cargados: 30 registros
✅ Datos de clientes cargados: 40 registros
✅ Datos de ventas cargados: 47 registros
✅ Datos de prestamos cargados: 32 registros
```

---

## ✅ PASO 4: Verificar que Todo Funcionó

1. Abre el archivo: `03-verificar-datos-sqlserver.sql`
2. **Ejecuta** el script (F5)

**Deberías ver:**
```
📊 Conteo de registros por tabla:
  Vehículos:  30
  Clientes:   40
  Ventas:     47
  Préstamos:  32

💰 Resumen financiero:
  Total Ventas (COP): $4,581,000,000
  Ticket Promedio: $97,468,085
  Total Préstamos: $2,357,000,000
```

---

## 🎓 PASO 5: Empezar a Practicar SQL

### Método 1: Consultas Directas en SSMS

1. En SSMS, haz click en **"Nueva consulta"**
2. Asegúrate de que estés usando la base de datos correcta:
   ```sql
   USE Concesionario;
   GO
   ```
3. Escribe tu primera consulta:
   ```sql
   -- Ver todos los vehículos
   SELECT * FROM vehiculos;
   ```
4. Ejecuta (F5)

### Método 2: Usando la Guía SQL

1. Abre el archivo (en tu editor de texto favorito):
   ```
   proyectos/proyecto-1-ventas/guias/GUIA-SQL-COMPLETA.md
   ```

2. Lee la guía paso a paso (tiene 50+ ejercicios)

3. Practica cada ejercicio copiando las consultas en SSMS

---

## 📂 EXPLORAR LA BASE DE DATOS EN SSMS

En el panel izquierdo de SSMS (Explorador de objetos):

1. Expande **"Bases de datos"**
2. Busca **"Concesionario"**
3. Expande **"Tablas"**
4. Verás 4 tablas:
   - `dbo.vehiculos`
   - `dbo.clientes`
   - `dbo.ventas`
   - `dbo.prestamos`

**Para ver datos de una tabla:**
- Click derecho en la tabla → **"Select Top 1000 Rows"**

---

## 🏋️ EJERCICIOS PARA EMPEZAR

Copia y ejecuta estos ejercicios en SSMS:

### Ejercicio 1: Tu Primera Consulta
```sql
USE Concesionario;
GO

-- Ver todos los vehículos Toyota
SELECT marca, modelo, precio_lista
FROM vehiculos
WHERE marca = 'Toyota';
```

### Ejercicio 2: Top 5 Más Caros
```sql
-- Top 5 vehículos más caros
SELECT TOP 5 marca, modelo, precio_lista
FROM vehiculos
ORDER BY precio_lista DESC;
```

### Ejercicio 3: Ventas Totales
```sql
-- Total de ventas en COP
SELECT
    COUNT(*) AS total_ventas,
    SUM(precio_final) AS ingresos_totales,
    AVG(precio_final) AS ticket_promedio
FROM ventas;
```

### Ejercicio 4: Clientes por Ciudad
```sql
-- ¿Cuántos clientes hay en cada ciudad?
SELECT
    ciudad,
    COUNT(*) AS total_clientes,
    AVG(ingreso_mensual) AS ingreso_promedio
FROM clientes
GROUP BY ciudad
ORDER BY total_clientes DESC;
```

### Ejercicio 5: JOIN - Ventas con Cliente
```sql
-- Ver ventas con información del cliente
SELECT TOP 10
    v.id_venta,
    v.fecha_venta,
    c.nombre + ' ' + c.apellido AS cliente,
    c.ciudad,
    v.precio_final
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
ORDER BY v.fecha_venta DESC;
```

---

## 🎯 TU PLAN DE APRENDIZAJE

### Semana 1-2: SQL Básico
- [ ] SELECT, WHERE, ORDER BY
- [ ] Operadores (=, >, <, LIKE, IN, BETWEEN)
- [ ] Resolver ejercicios 1-8 de la guía
- [ ] Practica: 30 min diarios en SSMS

### Semana 3-4: Agregaciones
- [ ] COUNT, SUM, AVG, MAX, MIN
- [ ] GROUP BY, HAVING
- [ ] Resolver ejercicios 9-16 de la guía
- [ ] Practica: 45 min diarios

### Semana 5-6: JOINs
- [ ] INNER JOIN
- [ ] LEFT JOIN, RIGHT JOIN
- [ ] Múltiples JOINs
- [ ] Resolver ejercicios 17-24 de la guía
- [ ] Practica: 1 hora diaria

### Semana 7-8: SQL Avanzado
- [ ] Subconsultas
- [ ] CASE WHEN
- [ ] Window Functions (ROW_NUMBER, RANK)
- [ ] CTEs (WITH)
- [ ] Resolver ejercicios 25-32 de la guía

---

## 🛠️ TROUBLESHOOTING (Solución de Problemas)

### ❌ Error: "Cannot open database 'Concesionario'"
**Solución:** Ejecuta primero el script `01-crear-base-datos-sqlserver.sql`

### ❌ Error: "Invalid object name 'vehiculos'"
**Solución:** Asegúrate de estar usando la base de datos correcta:
```sql
USE Concesionario;
GO
```

### ❌ Error: "Violation of PRIMARY KEY constraint"
**Solución:** Ya cargaste los datos antes. Para empezar limpio:
```sql
-- Eliminar todos los datos
DELETE FROM prestamos;
DELETE FROM ventas;
DELETE FROM clientes;
DELETE FROM vehiculos;
GO

-- Luego ejecuta de nuevo: 02-cargar-datos-sqlserver.sql
```

### ❌ No puedo encontrar los archivos .sql
**Solución (WSL):**
1. Los archivos están en Linux (WSL)
2. Para acceder desde Windows:
   - Abre el explorador de archivos de Windows
   - En la barra de dirección escribe: `\\wsl$\`
   - Navega a tu carpeta del proyecto

**Solución alternativa:**
Copia los archivos a una carpeta de Windows:
```bash
# Desde WSL
cp -r /home/juliocesar/Desktop/mi-portafolio-datos /mnt/c/Users/TU_USUARIO/Desktop/
```

---

## 📚 RECURSOS ADICIONALES

**Documentación en el proyecto:**
- `guias/GUIA-SQL-COMPLETA.md` - 70+ páginas con ejercicios
- `sql/01-crear-base-datos-sqlserver.sql` - Script de creación
- `sql/02-cargar-datos-sqlserver.sql` - Script de datos
- `sql/03-verificar-datos-sqlserver.sql` - Script de verificación

**Práctica adicional:**
- **LeetCode SQL:** https://leetcode.com/problemset/database/
- **HackerRank SQL:** https://www.hackerrank.com/domains/sql
- **Mode SQL Tutorial:** https://mode.com/sql-tutorial/

**Documentación oficial:**
- **SQL Server T-SQL Reference:** https://docs.microsoft.com/en-us/sql/t-sql/
- **SSMS Documentation:** https://docs.microsoft.com/en-us/sql/ssms/

---

## ✅ CHECKLIST FINAL

Marca lo que ya completaste:

- [ ] SQL Server instalado y funcionando
- [ ] SSMS instalado y conectado
- [ ] Script `01-crear-base-datos-sqlserver.sql` ejecutado exitosamente
- [ ] Script `02-cargar-datos-sqlserver.sql` ejecutado exitosamente
- [ ] Script `03-verificar-datos-sqlserver.sql` muestra 30/40/47/32 registros
- [ ] Primera consulta SELECT ejecutada correctamente
- [ ] Guía SQL descargada y lista para estudiar

---

## 🎓 SIGUIENTE PASO

Una vez que hayas completado el checklist:

1. **Abre la guía:** `GUIA-SQL-COMPLETA.md`
2. **Comienza por el Nivel 1:** SQL Básico
3. **Practica TODOS los ejercicios** en SSMS
4. **Meta:** Resolver los 50+ ejercicios en 4-6 semanas

**¡Éxito en tu aprendizaje!** 🚀

---

*💡 Recuerda: SQL es la habilidad #1 más demandada para analistas de datos (90%+ de ofertas)*