# 🎓 MI PLAN DE ESTUDIO - SQL DESDE CERO

**Proyecto:** Análisis de Ventas Automotrices
**Rol:** Analista de Datos Junior en Concesionario AutoMax
**Objetivo:** Dominar SQL desde básico hasta intermedio-avanzado en 8 semanas
**Inicio:** 28 de Noviembre, 2024

---

## 🏢 CONTEXTO DEL PROYECTO

**Situación:** Acabas de ser contratado como Analista de Datos Junior en un concesionario de vehículos. Tu jefe (el Gerente General) necesita **reportes diarios** para tomar decisiones de negocio.

**Tu herramienta principal:** SQL Server + Base de datos Concesionario

**Tu misión:** Responder preguntas del negocio usando datos

**Base de datos:**
- 30 vehículos (Toyota, Chevrolet, Mazda, etc.)
- 40 clientes con datos demográficos
- 47 ventas (enero-noviembre 2024)
- 32 préstamos automotrices
- Total en ventas: $4,581,000,000 COP

---

## 📋 PLAN DE ENTRENAMIENTO (8 SEMANAS)

### **SEMANA 1-2: REPORTES BÁSICOS** ✅ **COMPLETADO 100%**
**Habilidad:** SELECT, WHERE, ORDER BY, TOP, DISTINCT

**Escenario real:** *Tu jefe te pide reportes simples todos los días*

**Preguntas que aprendiste a responder:**
- "¿Cuántos vehículos Toyota tenemos en inventario?"
- "Muéstrame solo los vehículos SUV"
- "Dame la lista de vehículos ordenados por precio (de mayor a menor)"
- "¿Qué clientes tienen score crediticio mayor a 700?"
- "Muéstrame las ventas de este mes"

**Finalidad:** Poder extraer datos específicos de la base de datos

**Estado:** ✅ DOMINADO - Evaluación 20/20 (100%)

---

### **SEMANA 3-4: MÉTRICAS DE NEGOCIO** ⬅️ **ESTÁS AQUÍ**
**Habilidad:** COUNT, SUM, AVG, MAX, MIN, GROUP BY

**Escenario real:** *Tu jefe necesita números para presentar al dueño del concesionario*

**Preguntas que aprenderás a responder:**
- "¿Cuántas ventas tuvimos este mes?"
- "¿Cuál es el ingreso total en pesos?"
- "¿Cuál es el ticket promedio por venta?"
- "¿Qué ciudad nos genera más ventas?"
- "¿Cuántos clientes tenemos por ocupación?"
- "¿Qué vendedor tiene más ventas?"

**Finalidad:** Calcular KPIs (indicadores clave de desempeño)

---

### **SEMANA 5-6: ANÁLISIS CRUZADO**
**Habilidad:** INNER JOIN, LEFT JOIN, RIGHT JOIN

**Escenario real:** *Tu jefe necesita relacionar datos de diferentes áreas*

**Preguntas que aprenderás a responder:**
- "¿Qué vehículos se vendieron y a qué clientes?"
- "Muéstrame las ventas con información del vehículo Y del cliente"
- "¿Qué clientes tienen préstamos activos?"
- "¿Cuáles son los vehículos más vendidos por marca?"
- "¿Qué ciudades compran más SUVs vs Sedanes?"

**Finalidad:** Combinar información de múltiples tablas para análisis complejos

---

### **SEMANA 7-8: ANÁLISIS AVANZADO**
**Habilidad:** Subconsultas, CASE WHEN, Window Functions, CTEs

**Escenario real:** *Tu jefe necesita análisis estratégicos para planear el próximo trimestre*

**Preguntas que aprenderás a responder:**
- "¿Cuáles son los TOP 5 clientes que más gastan?"
- "Clasifica a los clientes en 'Alto', 'Medio', 'Bajo' valor según sus compras"
- "¿Cuál es el ranking de vendedores por desempeño?"
- "¿Qué porcentaje de ventas se financia vs contado?"
- "Análisis mes a mes: ¿estamos creciendo o decreciendo?"

**Finalidad:** Generar insights estratégicos para decisiones de negocio

---

## 🎯 METODOLOGÍA DE TRABAJO

### **Cómo funciona cada clase:**

#### **1. Tu jefe te hace una PREGUNTA DE NEGOCIO**
Ejemplo: *"Necesito saber cuántos SUVs tenemos en inventario"*

#### **2. TÚ traduces esa pregunta a SQL**
```sql
SELECT COUNT(*)
FROM vehiculos
WHERE tipo = 'SUV';
```

#### **3. Ejecutas la consulta y ENTREGAS el resultado**
*"Jefe, tenemos 12 SUVs en inventario"*

#### **4. Tu jefe te pide VARIACIONES**
*"¿Y cuántos SUVs Toyota específicamente?"*

---

## 💼 FORMATO DE CADA CLASE

### **PARTE 1: Concepto + Explicación** (5 min)
- Explicación del comando SQL
- Sintaxis básica
- Para qué sirve en el mundo real

### **PARTE 2: Ejemplo Guiado** (10 min)
- Ejemplo práctico
- Ejecución juntos
- Análisis del resultado

### **PARTE 3: PRÁCTICA INDEPENDIENTE** (15 min)
- 3-5 preguntas de negocio
- Escribes las consultas SQL tú solo
- Revisión y corrección

### **PARTE 4: Desafío Real** (10 min)
- Problema más complejo
- Similar a entrevistas técnicas
- Práctica de pensamiento analítico

---

## 📊 TUS ENTREGABLES (Al final de 8 semanas)

1. ✅ 50+ consultas SQL funcionales (portafolio de código)
2. ✅ 10+ reportes de negocio listos para mostrar
3. ✅ Dashboards conceptuales
4. ✅ Proyecto completo en GitHub para tu CV
5. ✅ Habilidad de responder 90% de preguntas en entrevistas SQL

---

## ✅ PROGRESO ACTUAL

### **Configuración Inicial**
- [X] SQL Server instalado
- [X] SQL Server Management Studio (SSMS) funcionando
- [X] Base de datos "Concesionario" creada
- [X] Tablas creadas (vehiculos, clientes, ventas, prestamos)
- [X] Datos de vehículos cargados (30 registros)
- [X] Datos de clientes cargados (40 registros)
- [X] Datos de ventas cargados (5 registros de prueba)
- [X] Datos de préstamos cargados (3 registros de prueba)

### **Semana 1-2: Reportes Básicos** ✅ **100% COMPLETADO**
- [X] SELECT básico - Ver todas las columnas
- [X] SELECT específico - Seleccionar columnas
- [X] WHERE - Filtros simples (operador =)
- [X] WHERE - Operadores de comparación (>, <, >=, <=, !=)
- [X] WHERE - AND / OR
- [X] WHERE - IN, BETWEEN, LIKE
- [X] ORDER BY - Ordenamiento (ASC y DESC)
- [X] LIMIT/TOP - Limitar resultados
- [X] DISTINCT - Valores únicos ✅ **COMPLETADO**
- [X] Evaluación Final - 20/20 (100%) ⭐

### **Semana 3-4: Métricas de Negocio**
- [ ] COUNT - Contar registros
- [ ] SUM - Sumar valores
- [ ] AVG - Promedio
- [ ] MAX / MIN - Valores máximo y mínimo
- [ ] GROUP BY - Agrupar datos
- [ ] HAVING - Filtrar grupos

### **Semana 5-6: Análisis Cruzado**
- [ ] INNER JOIN - Unión interna
- [ ] LEFT JOIN - Unión izquierda
- [ ] RIGHT JOIN - Unión derecha
- [ ] Múltiples JOINs
- [ ] Alias de tablas

### **Semana 7-8: Análisis Avanzado**
- [ ] Subconsultas
- [ ] CASE WHEN
- [ ] Window Functions (ROW_NUMBER, RANK, DENSE_RANK)
- [ ] CTEs (Common Table Expressions)
- [ ] PARTITION BY

---

## 📚 BITÁCORA DE SESIONES

### **SESIÓN 1 - 28 de Noviembre, 2024**

**Duración:** ~1 hora

**Temas cubiertos:**
1. ✅ Configuración de SQL Server Management Studio
2. ✅ Creación de base de datos "Concesionario"
3. ✅ Creación de tablas (vehiculos, clientes, ventas, prestamos)
4. ✅ Carga de datos (vehículos: 30, clientes: 40, ventas: 5, préstamos: 3)
5. ✅ Solución de problemas con carga de datos (error de tipos de fecha)
6. ✅ Primera consulta SQL ejecutada: SELECT * FROM vehiculos

**Problemas encontrados:**
- Error al cargar ventas y préstamos con el script original (conflicto de tipos int/date)
- Solución aplicada: Usar CAST('fecha' AS DATE) en las inserciones

**Ejercicios completados:**
- [X] Ejecutar script 01-crear-base-datos-sqlserver.sql
- [X] Ejecutar script modificado para cargar datos de ventas y préstamos
- [X] Verificar datos con SELECT COUNT(*)
- [X] Primera consulta: SELECT * FROM vehiculos

**Conceptos aprendidos:**
- Qué es SQL y para qué sirve
- Cómo conectarse a SQL Server
- Cómo ejecutar un script SQL en SSMS
- Estructura básica de SELECT
- Uso de GO en SQL Server

**Estado emocional/confianza:**
- Inicialmente confundido por cierre de sesión anterior
- Preocupado por problemas con carga de datos
- Al final: Confiado y listo para aprender

**Próxima sesión:**
- [ ] Misión 1: Mostrar vehículos ordenados por precio
- [ ] Aprender SELECT con columnas específicas
- [ ] Aprender ORDER BY
- [ ] Práctica con 3-5 ejercicios básicos

**Notas importantes:**
- El usuario quiere mantener el aprendizaje lo más realista posible (simulando entorno laboral)
- Prefiere explicaciones paso a paso como principiante
- Quiere asegurarse de que el proyecto tenga aplicación práctica
- Necesita esta bitácora actualizada al final de cada sesión

---

### **SESIÓN 2 - 28 de Noviembre, 2024** (Continuación)

**Duración:** ~1.5 horas

**Temas cubiertos:**
1. ✅ SELECT con columnas específicas (no usar SELECT *)
2. ✅ ORDER BY ASC - Ordenar ascendente (menor a mayor, A→Z)
3. ✅ ORDER BY DESC - Ordenar descendente (mayor a menor, Z→A)
4. ✅ TOP N - Limitar número de resultados
5. ✅ Trabajar con múltiples tablas (vehiculos, clientes, ventas)
6. ✅ Ordenar por diferentes tipos de datos (números, texto, fechas)

**Ejercicios completados (9 ejercicios prácticos):**
1. ✅ Vehículos ordenados por precio (DESC) - Identificar más caro: Toyota Hilux $165M
2. ✅ Vehículos ordenados por año (DESC) - Primero aparece 2023
3. ✅ Vehículos ordenados por precio (ASC) - Identificar más barato: Renault Sandero $48M
4. ✅ Vehículos ordenados por marca alfabéticamente (ASC) - Primera marca: Chevrolet
5. ✅ Clientes ordenados por score crediticio (DESC) - Mejor score: Alejandro Navarro (780)
6. ✅ Ventas ordenadas por fecha (DESC) - Venta más reciente: 2024-02-10 ($140M)
7. ✅ TOP 5 vehículos más caros - Del 1ro al 5to: Toyota Hilux a Mazda CX-5
8. ✅ TOP 3 clientes con peor score (ASC) - Peor score: Daniela Parra de Cartagena (640)
9. ✅ TOP 10 ventas más grandes - Venta más grande: $140M (solo salieron 5 por datos limitados)
10. ✅ TOP 8 vehículos más baratos - Corregir error de ORDER BY marca vs precio_lista

**Conceptos aprendidos:**
- **SELECT columna1, columna2** - Seleccionar columnas específicas vs SELECT *
- **ORDER BY ASC** - Orden ascendente (⬆️)
  - Números: 1, 2, 3... (menor a mayor)
  - Letras: A, B, C... (alfabético)
  - Fechas: 2021, 2022, 2023... (antiguo a reciente)
- **ORDER BY DESC** - Orden descendente (⬇️)
  - Números: 100, 50, 10... (mayor a menor)
  - Letras: Z, Y, X... (reversa alfabética)
  - Fechas: 2024, 2023, 2022... (reciente a antiguo)
- **TOP N** - Limitar resultados a los primeros N registros
- **Importancia de ORDER BY** - La columna que pones en ORDER BY determina CÓMO se ordena
- **GO** - Solo usar después de comandos específicos (USE, CREATE), NO en medio de consultas

**Errores encontrados y corregidos:**
1. ❌ **Error con GO en medio de consulta**
   - Problema: Poner GO entre SELECT y FROM
   - Solución: Quitar GO, mantener consulta unida
   - Aprendizaje: GO corta el script en lotes separados

2. ❌ **Error ordenando por columna incorrecta**
   - Problema: Pedían ordenar por PRECIO pero usó ORDER BY marca
   - Solución: Cambiar a ORDER BY precio_lista
   - Aprendizaje: Leer bien los requisitos, la columna en ORDER BY determina el criterio

**Habilidades desarrolladas:**
- ✅ Escribir consultas SQL desde cero (sin copiar/pegar)
- ✅ Leer y entender requisitos de negocio
- ✅ Traducir requisitos a SQL
- ✅ Ejecutar consultas en SSMS correctamente
- ✅ Interpretar y analizar resultados
- ✅ Identificar y corregir errores de sintaxis
- ✅ Trabajar con 3 tablas diferentes (vehiculos, clientes, ventas)
- ✅ Ordenar por diferentes tipos de columnas (precio, año, marca, fecha, score)
- ✅ Usar TOP para limitar resultados

**Tablas dominadas:**
- ✅ **vehiculos** - marca, modelo, año, precio_lista
- ✅ **clientes** - nombre, apellido, ciudad, score_crediticio
- ✅ **ventas** - fecha_venta, precio_final, metodo_pago

**Consultas SQL escritas (ejemplos):**
```sql
-- Ejercicio 1: Vehículos más caros
SELECT marca, modelo, año, precio_lista
FROM vehiculos
ORDER BY precio_lista DESC;

-- Ejercicio 5: Clientes por score
SELECT nombre, apellido, ciudad, score_crediticio
FROM clientes
ORDER BY score_crediticio DESC;

-- Ejercicio 7: TOP 5 más caros
SELECT TOP 5 marca, modelo, precio_lista
FROM vehiculos
ORDER BY precio_lista DESC;

-- Ejercicio 10: TOP 8 más baratos (corregido)
SELECT TOP 8 marca, modelo, año, precio_lista
FROM vehiculos
ORDER BY precio_lista ASC;
```

**Momentos destacados:**
- 🎉 Primera consulta escrita completamente solo
- 🎉 Entendió la diferencia entre ASC y DESC experimentando
- 🎉 Corrigió errores de sintaxis de forma independiente
- 🎉 Identificó y corrigió error de lógica (ordenar por columna correcta)
- 🎉 Quiso practicar más en lugar de avanzar rápido (actitud excelente)

**Estado emocional/confianza:**
- Inicio: Con ganas de aprender, solicitó ir despacio
- Durante: Concentrado, preguntó cuando tuvo dudas
- Errores: Los tomó bien, aprendió de ellos
- Final: Confiado, domina SELECT y ORDER BY completamente

**Observaciones del instructor:**
- Excelente actitud de aprendizaje
- Prefiere dominar completamente un tema antes de avanzar (muy bueno)
- Aprende mejor escribiendo que copiando (correcto)
- Pide claridad cuando no entiende (señal de madurez)
- Está comprometido con práctica repetida
- Entiende la importancia de los fundamentos

**Próxima sesión:**
- [ ] Aprender WHERE - Filtros básicos
- [ ] WHERE con operadores (=, >, <, >=, <=, !=)
- [ ] WHERE con AND / OR
- [ ] WHERE con IN, BETWEEN, LIKE
- [ ] Combinar WHERE con ORDER BY
- [ ] Práctica: 5-8 ejercicios de filtros

**Logro desbloqueado:**
🏆 **"SELECT Master"** - Dominio completo de SELECT, FROM, ORDER BY y TOP

---

### **SESIÓN 3 - 28 de Noviembre, 2024** (Práctica Intensiva)

**Duración:** ~30 minutos

**Objetivo de la sesión:**
Reforzar conocimientos de SELECT, ORDER BY y TOP antes de avanzar a WHERE

**Tipo de sesión:**
Práctica intensiva - El estudiante solicitó más práctica antes de avanzar (excelente decisión)

**Ejercicios propuestos:** 8 ejercicios de práctica
**Ejercicios completados:** 1 ejercicio

**Ejercicio completado:**
1. ✅ **Inventario completo ordenado por marca y modelo**
   - Consulta escrita:
   ```sql
   SELECT marca, modelo, año, precio_lista
   FROM vehiculos
   ORDER BY marca, modelo;
   ```
   - Resultado: 30 vehículos ordenados correctamente
   - Primera marca: Chevrolet (Cruze, Montana, Onix, Spark, Tracker)
   - Ejecución: ✅ Perfecta
   - Análisis: ✅ Correcto

**Nuevo concepto dominado:**
- ✅ **ORDER BY múltiples columnas** - Ordenar por marca Y luego por modelo
- ✅ Sintaxis: `ORDER BY columna1, columna2`
- ✅ Comprensión: Ordena primero por columna1, luego dentro de cada grupo por columna2

**Habilidades reforzadas:**
- ✅ Escribir consultas SQL sin ayuda
- ✅ Ejecutar consultas en SSMS
- ✅ Interpretar resultados correctamente
- ✅ Ordenamiento por múltiples criterios

**Estado emocional/confianza:**
- Proactivo: Solicitó más práctica (señal de madurez en el aprendizaje)
- Confiado: Escribió la consulta correctamente al primer intento
- Decidido: Prefiere dominar completamente antes de avanzar
- Final: Satisfecho con la práctica, listo para continuar próxima sesión

**Ejercicios pendientes para próxima sesión de práctica:**
- [ ] TOP 3 clientes con mejor crédito
- [ ] Ventas ordenadas de reciente a antigua
- [ ] TOP 5 vehículos más antiguos
- [ ] Clientes ordenados por ciudad y apellido
- [ ] TOP 10 ventas más pequeñas
- [ ] Préstamos ordenados por tasa de interés
- [ ] TOP 7 vehículos más caros

**Observaciones:**
- El estudiante tiene excelente criterio al pedir más práctica
- Prefiere solidificar fundamentos antes de avanzar (estrategia correcta)
- Ejecuta consultas correctamente en SSMS
- Comprende conceptos de ordenamiento multi-columna

**Decisión de la sesión:**
Pausar la sesión después de 1 ejercicio a petición del estudiante

**Próxima sesión:**
**Opción A:** Continuar con los 7 ejercicios de práctica restantes
**Opción B:** Comenzar con WHERE (filtros) como estaba planeado

**Logro desbloqueado:**
🏆 **"Multi-Sort Master"** - Domina ordenamiento por múltiples columnas

---

## 🚀 PRÓXIMA MISIÓN

**Escenario:**
Tu jefe te llama y te dice: *"Ya sé que tienes 30 vehículos, pero solo quiero ver los vehículos de la marca Toyota. Muéstrame marca, modelo, año y precio de SOLO los Toyota."*

**Tu tarea:**
Aprender a usar **WHERE** para filtrar datos.

**Nuevo comando:** WHERE (filtros)

**Ejemplo:**
```sql
SELECT marca, modelo, precio_lista
FROM vehiculos
WHERE marca = 'Toyota';
```

Esto es lo que aprenderás en la próxima sesión.

---

## 📖 RECURSOS

- **Guía SQL Completa:** `guias/GUIA-SQL-COMPLETA.md`
- **Scripts SQL:** Carpeta `sql/`
- **Datos originales:** Carpeta `datos/`
- **Documentación:** `LEER-PRIMERO.md`

---

## 💡 RECORDATORIOS IMPORTANTES

1. **Practica todos los días** (aunque sean 30 minutos)
2. **Escribe las consultas tú mismo** (no solo copiar y pegar)
3. **Experimenta** cambiando las consultas
4. **No te saltes los fundamentos básicos**
5. **SQL es como aprender a manejar:** primero lo básico, luego lo avanzado

---

---

### **SESIÓN 4 - 6 de Diciembre, 2024**

**Duración:** ~45 minutos

**Objetivo de la sesión:**
Aprender WHERE (filtros) - Uno de los comandos más importantes en SQL

**Temas cubiertos:**
1. ✅ WHERE con operador = (igual)
2. ✅ WHERE con operadores de comparación (>, <, >=, <=, !=)
3. ✅ WHERE con AND (todas las condiciones deben cumplirse)
4. ✅ WHERE con OR (al menos una condición debe cumplirse)
5. ✅ WHERE con IN (buscar en lista de valores)
6. ✅ WHERE con BETWEEN (rango de valores)
7. ✅ WHERE con LIKE (buscar patrones de texto con % y _)
8. ✅ Combinar WHERE + ORDER BY

**Ejercicios completados (16 ejercicios):**

**Ejercicios principales (11):**
1. ✅ Filtrar vehículos Toyota → 5 vehículos encontrados
2. ✅ Vehículos con precio > 100M → 11 vehículos, más caro: Toyota Hilux $165M
3. ✅ Vehículos año 2023 → 23 vehículos
4. ✅ SUV < 100M con AND → 4 vehículos
5. ✅ Toyota O Mazda con OR → 9 vehículos
6. ✅ 4 marcas con IN (Toyota, Chevrolet, Mazda, Renault) → 17 vehículos
7. ✅ Precio BETWEEN 70M-100M → 12 vehículos, más barato: Nissan Versa $72M
8. ✅ Modelos que empiezan con 'C' (LIKE) → 6 modelos (Cruze, City, CX-5, CX-30, Corolla×2)
9. ✅ SUV ordenados por precio (WHERE + ORDER BY) → Más barato: Renault Duster $82M, Más caro: Nissan X-Trail $148M
10. ✅ Año 2023 AND > 100M ordenados DESC → 10 vehículos, más caro: Hilux $165M, más barato: VW $105M
11. ✅ Modelos con letra 'a' ordenados → 14 modelos, primero: Corolla

**Ejercicios de práctica extra (5):**
1. ✅ Clientes de Bogotá ordenados por score DESC
2. ✅ Ventas > 80M ordenadas por fecha DESC
3. ✅ Clientes con score BETWEEN 700-750 ordenados ASC
4. ✅ Vehículos Sedán O Hatchback ordenados por marca
5. ✅ Clientes con 'a' en nombre ordenados alfabéticamente

**Conceptos aprendidos:**

**WHERE - Filtros básicos:**
- WHERE es como un filtro que selecciona solo las filas que cumplen condiciones
- WHERE siempre va DESPUÉS de FROM, ANTES de ORDER BY
- Textos van entre comillas simples: `'Toyota'`
- Números sin comillas: `2023`

**Operadores de comparación:**
- `=` igual
- `>` mayor que
- `<` menor que
- `>=` mayor o igual
- `<=` menor o igual
- `!=` o `<>` diferente de

**Lógica con AND/OR:**
- **AND** - TODAS las condiciones deben cumplirse
- **OR** - AL MENOS UNA condición debe cumplirse

**Operadores especiales:**
- **IN (lista)** - Buscar en lista de valores
  - Sintaxis: `WHERE marca IN ('Toyota', 'Mazda', 'Chevrolet')`
  - Cada valor con sus propias comillas, separados por comas
- **BETWEEN valor1 AND valor2** - Rango inclusivo
  - Ejemplo: `WHERE precio BETWEEN 70000000 AND 100000000`
  - Incluye ambos extremos
- **LIKE 'patrón'** - Buscar patrones de texto
  - `%` = cualquier cantidad de caracteres
  - `_` = exactamente 1 carácter
  - Ejemplos:
    - `'C%'` = empieza con C
    - `'%a'` = termina con a
    - `'%az%'` = contiene az
    - `'____'` = exactamente 4 caracteres

**Combinación WHERE + ORDER BY:**
- Orden correcto: SELECT → FROM → WHERE → ORDER BY
- Primero filtra (WHERE), luego ordena (ORDER BY)

**Errores encontrados y corregidos:**
1. ❌ **Error con IN - comillas incorrectas**
   - Problema: `IN ('toyota, chevrolet, mazda')` → Todo junto en una sola comilla
   - Solución: `IN ('Toyota', 'Chevrolet', 'Mazda')` → Cada valor separado
   - Aprendizaje: Cada elemento de la lista debe tener sus propias comillas

**Habilidades desarrolladas:**
- ✅ Filtrar datos con múltiples criterios
- ✅ Combinar condiciones lógicas (AND/OR)
- ✅ Usar operadores especiales (IN, BETWEEN, LIKE)
- ✅ Buscar patrones de texto con comodines
- ✅ Combinar filtros con ordenamiento
- ✅ Escribir consultas complejas sin ayuda
- ✅ Interpretar resultados correctamente
- ✅ Detectar y corregir errores de sintaxis

**Consultas SQL escritas (ejemplos):**
```sql
-- Ejercicio 1: Filtrar por marca
SELECT marca, modelo, año, precio_lista
FROM vehiculos
WHERE marca = 'Toyota';

-- Ejercicio 4: Usar AND
SELECT marca, modelo, tipo, precio_lista
FROM vehiculos
WHERE tipo = 'SUV' AND precio_lista < 100000000;

-- Ejercicio 6: Usar IN
SELECT marca, modelo
FROM vehiculos
WHERE marca IN ('Toyota', 'Chevrolet', 'Mazda', 'Renault');

-- Ejercicio 7: Usar BETWEEN
SELECT marca, modelo, precio_lista
FROM vehiculos
WHERE precio_lista BETWEEN 70000000 AND 100000000;

-- Ejercicio 8: Usar LIKE
SELECT marca, modelo
FROM vehiculos
WHERE modelo LIKE 'C%';

-- Ejercicio 10: WHERE con AND + ORDER BY
SELECT marca, modelo, año, precio_lista
FROM vehiculos
WHERE año = 2023 AND precio_lista > 100000000
ORDER BY precio_lista DESC;
```

**Momentos destacados:**
- 🎉 Completó 16 ejercicios (11 principales + 5 extra) por iniciativa propia
- 🎉 Escribió 5 ejercicios de práctica extra sin ayuda
- 🎉 Detectó y corrigió error de sintaxis con IN
- 🎉 Todas las consultas funcionaron correctamente
- 🎉 Demostró dominio completo de WHERE

**Estado emocional/confianza:**
- Inicio: Motivado para continuar aprendiendo
- Durante: Concentrado, ejecutó todos los ejercicios correctamente
- Error: Lo identificó y corrigió rápidamente (comillas en IN)
- Final: Muy confiado, pidió práctica extra y la completó exitosamente

**Observaciones del instructor:**
- Excelente progreso - completó TODO el tema de WHERE en una sola sesión
- Tomó iniciativa de hacer práctica extra (5 ejercicios adicionales)
- Escribe consultas SQL limpias y ordenadas
- Usa comentarios en su código (-- EJERCICIO 1)
- Comprende la lógica detrás de cada comando
- Ya no necesita ayuda para ejercicios básicos-intermedios
- Listo para avanzar a temas más complejos

**Próxima sesión:**
- [ ] DISTINCT - Valores únicos (último tema Semana 1-2)
- [ ] Luego: Comenzar Semana 3-4 (Métricas de Negocio)
  - COUNT, SUM, AVG, MAX, MIN
  - GROUP BY
  - HAVING

**Logros desbloqueados:**
🏆 **"WHERE Master"** - Dominio completo de filtros
🏆 **"Logic Master"** - Uso correcto de AND/OR
🏆 **"Pattern Finder"** - Búsqueda con LIKE
🏆 **"Range Expert"** - Dominio de BETWEEN e IN
🏆 **"SQL Independent"** - Escribe consultas sin ayuda
🏆 **"Practice Champion"** - Completó práctica extra por iniciativa propia

---

### **SESIÓN 5 - 7 de Diciembre, 2024**

**Duración:** ~1.5 horas

**Objetivo de la sesión:**
Completar DISTINCT y realizar evaluación final del Módulo 1 (Semana 1-2)

**Temas cubiertos:**
1. ✅ DISTINCT - Valores únicos
2. ✅ DISTINCT con múltiples columnas
3. ✅ DISTINCT + ORDER BY
4. ✅ Evaluación completa del Módulo 1 (20 preguntas)

**Ejercicios completados (28 ejercicios):**

**DISTINCT - Práctica (8 ejercicios):**
1. ✅ Marcas únicas → 11 marcas (Chevrolet, Ford, Honda, Hyundai, Kia, Mazda, Nissan, Renault, Suzuki, Toyota, Volkswagen)
2. ✅ Ciudades únicas → 7 ciudades (Barranquilla, Bogota, Bucaramanga, Cali, Cartagena, Medellin, Pereira)
3. ✅ Tipos de vehículos → 4 tipos (Hatchback, Pickup, Sedan, SUV)
4. ✅ Años únicos → 3 años (2023, 2022, 2021)
5. ✅ Métodos de pago → 2 métodos (Contado, Financiamiento)
6. ✅ Combinaciones marca + tipo → 23 combinaciones únicas
7. ✅ Vendedores únicos → 4 vendedores (Ana Martinez, Carlos Lopez, Juan Perez, Maria Silva)
8. ✅ Ocupaciones únicas → 22 ocupaciones diferentes

**Evaluación Final Módulo 1 (20 preguntas):**
- ✅ Bloque 1: SELECT & DISTINCT (4/4) - Perfecto
- ✅ Bloque 2: WHERE Básico (4/4) - Perfecto
- ✅ Bloque 3: Operadores de comparación (4/4) - Perfecto
- ✅ Bloque 4: AND & OR (3/3) - Perfecto
- ✅ Bloque 5: IN, BETWEEN, LIKE (3/3) - Perfecto
- ✅ Bloque 6: TOP & Combinaciones (2/2) - Perfecto

**Calificación:** 20/20 (100%) ⭐⭐⭐⭐⭐

**Conceptos aprendidos:**

**DISTINCT - Valores únicos:**
- DISTINCT elimina duplicados y muestra solo valores únicos
- Sintaxis: `SELECT DISTINCT columna FROM tabla`
- Se puede usar con múltiples columnas: `SELECT DISTINCT col1, col2`
- Combinable con ORDER BY
- Útil para ver categorías, tipos, opciones disponibles

**Habilidades desarrolladas:**
- ✅ Uso de DISTINCT para eliminar duplicados
- ✅ Identificar valores únicos en tablas
- ✅ Combinar DISTINCT con ORDER BY
- ✅ Analizar combinaciones únicas de múltiples columnas
- ✅ Resolución de problemas complejos de negocio
- ✅ Integración de todos los comandos aprendidos
- ✅ Código limpio y bien comentado

**Consultas SQL escritas (ejemplos):**
```sql
-- DISTINCT básico
SELECT DISTINCT marca
FROM vehiculos
ORDER BY marca ASC;

-- DISTINCT con múltiples columnas
SELECT DISTINCT marca, tipo
FROM vehiculos
ORDER BY marca, tipo;

-- Evaluación - Ejercicio 13 (AND + IN)
SELECT tipo, marca, precio_lista
FROM vehiculos
WHERE tipo = 'SUV' AND marca IN ('Toyota', 'Mazda')
ORDER BY marca ASC, precio_lista DESC;

-- Evaluación - Ejercicio 18 (LIKE)
SELECT modelo, marca
FROM vehiculos
WHERE modelo LIKE '%a%'
ORDER BY modelo ASC;

-- Evaluación - Ejercicio 20 (TOP + IN)
SELECT TOP 10 ciudad, score_crediticio, nombre
FROM clientes
WHERE ciudad IN ('Bogota', 'Medellin', 'Cali')
ORDER BY score_crediticio DESC;
```

**Momentos destacados:**
- 🎉 Completó DISTINCT en una sola sesión (8 ejercicios)
- 🎉 Evaluación final 20/20 - CALIFICACIÓN PERFECTA
- 🎉 Todas las consultas funcionaron correctamente
- 🎉 Código limpio, comentado y bien estructurado
- 🎉 Resolvió duda del ejercicio 13 de forma proactiva
- 🎉 Completó 100% del Módulo 1 (Semana 1-2)

**Estado emocional/confianza:**
- Inicio: Motivado para terminar el módulo
- Durante DISTINCT: Ejecutó todos los ejercicios sin errores
- Almuerzo: Organizó bien su tiempo
- Durante evaluación: Concentrado, completó las 20 preguntas
- Final: Muy confiado, orgulloso de su logro 100%

**Observaciones del instructor:**
- EXCELENTE desempeño - Calificación perfecta
- Dominio completo de SQL básico
- Capacidad de traducir requisitos de negocio a SQL
- Código de alta calidad (comentarios, indentación, claridad)
- Listo para avanzar a temas intermedios
- Muestra disciplina y compromiso con el aprendizaje
- Actitud proactiva: pregunta cuando tiene dudas

**Logros desbloqueados:**
🏆 **"DISTINCT Master"** - Dominio de valores únicos
🏆 **"WHERE Expert"** - Todos los operadores dominados
🏆 **"Logic Wizard"** - AND/OR/IN/BETWEEN/LIKE perfectos
🏆 **"Sort Master"** - ORDER BY múltiples columnas
🏆 **"TOP Performer"** - Uso correcto de TOP
🏆 **"SQL Junior Analyst"** - Nivel básico COMPLETADO
🏆 **"Perfect Score"** - 20/20 en evaluación
🏆 **"Code Quality"** - Código limpio y comentado
🏆 **"Module 1 Champion"** - 100% Semana 1-2 completada

**Próxima sesión:**
- [ ] Comenzar MÓDULO 2: Métricas de Negocio (Semana 3-4)
  - COUNT - Contar registros
  - SUM - Sumar valores
  - AVG - Promedio
  - MAX/MIN - Valores máximos y mínimos
  - GROUP BY - Agrupar datos
  - HAVING - Filtrar grupos

### **SESIÓN 6 - 7 de Diciembre, 2024** (Tarde)

**Duración:** ~15 minutos

**Objetivo de la sesión:**
Comenzar Módulo 2 - Aprender SUM (Sumar valores)

**Temas cubiertos:**
1. ✅ SUM - Concepto y sintaxis básica
2. ✅ Diferencia entre COUNT y SUM
3. ✅ SUM con filtros (WHERE)

**Ejercicios completados (2 de 10):**
1. ✅ Total de dinero generado por todas las ventas
   ```sql
   SELECT SUM(precio_final) AS total_dinero_ventas
   FROM ventas;
   ```

2. ✅ Total de dinero dado en descuentos
   ```sql
   SELECT SUM(descuento) AS total_dinero_descuentos
   FROM ventas;
   ```

**Conceptos aprendidos:**
- **SUM** - Suma todos los valores de una columna numérica
- **Diferencia COUNT vs SUM:**
  - COUNT → Cuenta cuántas filas (cantidad)
  - SUM → Suma valores numéricos (totales en dinero)
- **SUM con WHERE** - Sumar solo filas que cumplan condiciones
- **Alias descriptivos** - Usar nombres claros (total_dinero_ventas vs suma1)

**Ejercicios pendientes para próxima sesión (8 restantes):**
- [ ] Ejercicio 13: Valor total del inventario de vehículos
- [ ] Ejercicio 14: Total financiado a través de préstamos
- [ ] Ejercicio 15: Ventas pagadas en CONTADO
- [ ] Ejercicio 16: Ventas pagadas con FINANCIAMIENTO
- [ ] Ejercicio 17: Valor total de vehículos TOYOTA
- [ ] Ejercicio 18: Valor total de vehículos tipo SUV
- [ ] Ejercicio 19: Total de cuotas mensuales de préstamos
- [ ] Ejercicio 20: Préstamos a 60 meses

**Estado emocional/confianza:**
- Inicio: Motivado para continuar con Módulo 2
- Durante: Ejecutó 2 ejercicios correctamente
- Final: Cansado, decidió pausar (decisión inteligente)

**Observaciones:**
- Ejecutó correctamente los primeros 2 ejercicios de SUM
- Usa alias descriptivos (excelente práctica profesional)
- Reconoció su cansancio y pausó (madurez en el aprendizaje)
- Sintaxis correcta con espacios: `SUM (columna)`

**Próxima sesión:**
- [ ] Completar ejercicios 13-20 de SUM (8 ejercicios restantes)
- [ ] Luego avanzar a AVG, MAX, MIN

**Logro desbloqueado:**
🏆 **"SUM Initiated"** - Primeros pasos con funciones de agregación

### **SESIÓN 7 - 8 de Diciembre, 2024**

**Duración:** ~45 minutos

**Objetivo de la sesión:**
Completar SUM y AVG - Funciones de agregación fundamentales

**Temas cubiertos:**
1. ✅ SUM - Completado (ejercicios 13-20)
2. ✅ AVG - Promedio (ejercicios 21-30)
3. ✅ Corrección de error común: confusión entre columnas `modelo` vs `año`

**Ejercicios completados (18 ejercicios):**

**SUM - Ejercicios 13-20 (8 ejercicios):**
13. ✅ Valor total del inventario de vehículos → $3,056,000,000 COP
14. ✅ Total financiado a través de préstamos → Total de dinero prestado
15. ✅ Ventas pagadas en CONTADO → Total ventas de contado
16. ✅ Ventas pagadas con FINANCIAMIENTO → Total ventas con financiamiento
17. ✅ Valor total de vehículos TOYOTA → Valor inventario Toyota
18. ✅ Valor total de vehículos tipo SUV → Valor inventario SUV
19. ✅ Total de cuotas mensuales de préstamos → Ingreso mensual por préstamos
20. ✅ Préstamos a 60 meses → Total prestado a 60 meses

**AVG - Ejercicios 21-30 (10 ejercicios):**
21. ✅ Promedio del precio final de ventas → Ticket promedio de ventas
22. ✅ Promedio del score crediticio de clientes → Score promedio general
23. ✅ Precio promedio del inventario de vehículos → Precio promedio inventario
24. ✅ Descuento promedio en ventas → Descuento promedio aplicado
25. ✅ Precio promedio de vehículos SUV → Precio promedio SUV
26. ✅ Score crediticio promedio de clientes en Bogotá → Score promedio Bogotá
27. ✅ Promedio de cuota mensual de préstamos → Pago mensual promedio
28. ✅ Precio promedio de vehículos Sedan → Precio promedio Sedan
29. ✅ Promedio de préstamos a 48 meses → Monto promedio préstamos 48m
30. ✅ Precio promedio de Toyota año 2023 → Precio promedio Toyota 2023

**Conceptos aprendidos:**

**SUM - Completado:**
- ✅ SUM suma TODOS los valores de una columna numérica
- ✅ SUM con WHERE permite sumar solo valores que cumplen condiciones
- ✅ Uso en casos reales: ingresos totales, inventarios, descuentos, financiamiento
- ✅ Alias descriptivos para resultados claros

**AVG - Promedio:**
- ✅ AVG calcula el PROMEDIO (suma total ÷ cantidad de registros)
- ✅ Sintaxis: `SELECT AVG(columna) AS alias FROM tabla`
- ✅ AVG con WHERE para promedios de subgrupos específicos
- ✅ Útil para: ticket promedio, score promedio, precios promedio
- ✅ Diferencia entre AVG general vs AVG con filtros

**Errores encontrados y corregidos:**
1. ❌ **Error en ejercicio 30 - Confusión modelo vs año**
   - Problema inicial: `WHERE marca = 'TOYOTA' AND modelo = 2023`
   - Diagnóstico: La columna `modelo` almacena TEXTO (Corolla, Camry), la columna `año` almacena el AÑO
   - Solución: `WHERE marca = 'TOYOTA' AND año = 2023`
   - Aprendizaje: Revisar estructura de tabla antes de escribir consultas

2. ✅ **Observación - mayúsculas/minúsculas**
   - Nota: SQL Server no diferencia mayúsculas en valores de texto
   - `'Contado'` = `'CONTADO'` = `'contado'`
   - Ejercicio 15: funcionó igual con mayúscula o minúscula

**Consultas SQL escritas (ejemplos):**
```sql
-- SUM básico
SELECT SUM(precio_lista) AS valor_inventario
FROM vehiculos;

-- SUM con WHERE
SELECT SUM(precio_final) AS ventas_de_contado
FROM ventas
WHERE metodo_pago = 'Contado';

-- AVG básico
SELECT AVG(precio_final) AS ticket_promedio_ventas
FROM ventas;

-- AVG con WHERE
SELECT AVG(precio_lista) AS precio_avg_SUV
FROM vehiculos
WHERE tipo = 'SUV';

-- AVG con múltiples condiciones (AND)
SELECT AVG(precio_lista) AS avg_precio_toyota
FROM vehiculos
WHERE marca = 'TOYOTA' AND año = 2023;
```

**Habilidades desarrolladas:**
- ✅ Uso de SUM para calcular totales financieros
- ✅ Uso de AVG para calcular promedios
- ✅ Filtrar sumas y promedios con WHERE
- ✅ Combinar múltiples condiciones (AND)
- ✅ Identificar diferencias entre columnas similares (modelo vs año)
- ✅ Usar alias descriptivos profesionales
- ✅ Resolver problemas de sintaxis de forma independiente

**Momentos destacados:**
- 🎉 Completó 18 ejercicios (8 SUM + 10 AVG)
- 🎉 Todas las consultas funcionaron correctamente
- 🎉 Identificó y corrigió error del ejercicio 30
- 🎉 Auto-corrección en ejercicio 27 (análisis de pregunta)
- 🎉 Completó SUM y AVG en una sola sesión
- 🎉 Código limpio con comentarios descriptivos

**Estado emocional/confianza:**
- Inicio: Recuperando sesión perdida, organizado
- Durante: Ejecutó todos los ejercicios sin problemas
- Error ejercicio 30: Buscó ayuda para resolverlo
- Final: Satisfecho, completó SUM y AVG exitosamente

**Observaciones del instructor:**
- Excelente organización: guardó ejercicios para actualizar bitácora
- Dominio de funciones de agregación SUM y AVG
- Buena práctica: comentarios en código (-- EJERCICIO 13)
- Capacidad de auto-corrección (ejercicio 27)
- Listo para continuar con MAX, MIN y GROUP BY

**Logros desbloqueados:**
🏆 **"SUM Master"** - Dominio completo de suma de valores
🏆 **"AVG Expert"** - Dominio de cálculo de promedios
🏆 **"Aggregation Pro"** - Funciones de agregación dominadas
🏆 **"Business Metrics"** - Cálculo de KPIs financieros
🏆 **"Problem Solver"** - Identificó y corrigió error modelo vs año

**Próxima sesión:**
- [ ] MAX - Valor máximo
- [ ] MIN - Valor mínimo
- [ ] Ejercicios combinando COUNT, SUM, AVG, MAX, MIN
- [ ] Luego: GROUP BY (agrupar datos por categorías)

---

**Última actualización:** 8 de Diciembre, 2024
**Tiempo total invertido:** ~6.5 horas (Sesiones previas: 5.75h + Sesión 7: 0.75h)
**Sesiones completadas:** 7 sesiones
**Nivel actual:** Módulo 2 - Funciones de Agregación (COUNT ✅, SUM ✅, AVG ✅)
**Próximo objetivo:** MAX, MIN, y luego GROUP BY
**Comandos dominados:** SELECT, FROM, WHERE (todos los operadores), ORDER BY, TOP, DISTINCT, COUNT, SUM, AVG
