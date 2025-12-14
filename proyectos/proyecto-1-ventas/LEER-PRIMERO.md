# 🚀 PROYECTO: Análisis de Ventas Automotrices

**Estado:** ✅ Listo para practicar SQL en Microsoft SQL Server Management Studio

---

## 📁 UBICACIÓN DE LOS ARCHIVOS

Estás en WSL (Linux), pero necesitas acceder a estos archivos desde Windows para usar SQL Server Management Studio.

### Opción 1: Acceder desde Windows Explorer

1. Abre el **Explorador de Archivos** de Windows
2. En la barra de dirección escribe: `\\wsl$`
3. Navega a: `Ubuntu\home\juliocesar\Desktop\mi-portafolio-datos\proyectos\proyecto-1-ventas\sql`

### Opción 2: Copiar a Windows

Desde WSL, ejecuta:
```bash
cp -r ~/Desktop/mi-portafolio-datos /mnt/c/Users/TU_USUARIO/Desktop/
```

Reemplaza `TU_USUARIO` con tu nombre de usuario de Windows.

---

## 🎯 ARCHIVOS QUE DEBES USAR EN SQL SERVER

### 📂 Carpeta: `sql/`

**Ejecuta estos scripts EN ORDEN en SQL Server Management Studio:**

1. **`01-crear-base-datos-sqlserver.sql`** (4KB)
   - Crea la base de datos "Concesionario"
   - Crea las 4 tablas: vehiculos, clientes, ventas, prestamos
   - ⏱️ Tiempo: ~5 segundos

2. **`02-cargar-datos-sqlserver.sql`** (36KB)
   - Inserta 30 vehículos
   - Inserta 40 clientes
   - Inserta 47 ventas
   - Inserta 32 préstamos
   - ⏱️ Tiempo: ~10 segundos

3. **`03-verificar-datos-sqlserver.sql`** (2.3KB)
   - Verifica que todo se haya cargado correctamente
   - Muestra resumen de datos
   - ⏱️ Tiempo: ~2 segundos

---

## 📚 GUÍAS DE ESTUDIO

### 📂 Carpeta: `sql/`

**`GUIA-IMPORTAR-SQL-SERVER.md`**
- 📖 Guía paso a paso para configurar SQL Server
- 🔧 Solución de problemas comunes
- ✅ Checklist de configuración
- **👉 LEE ESTA PRIMERO**

### 📂 Carpeta: `guias/`

**`GUIA-SQL-COMPLETA.md`** (70+ páginas)
- 🎓 De SQL básico a avanzado
- 📝 50+ ejercicios prácticos con soluciones
- 💡 Ejemplos usando tus datos del concesionario
- 🎯 Todo lo que el mercado demanda en SQL
- **👉 ESTUDIA ESTO DESPUÉS DE CONFIGURAR**

---

## 📊 DATOS DEL PROYECTO

### 📂 Carpeta: `datos/`

Archivos CSV con datos reales simulados:

- **`vehiculos.csv`** - 30 vehículos (Toyota, Chevrolet, Mazda, etc.)
- **`clientes.csv`** - 40 clientes con datos demográficos
- **`ventas.csv`** - 47 transacciones (enero-noviembre 2024)
- **`prestamos.csv`** - 32 préstamos automotrices

**💰 Total del negocio:** $4,581,000,000 COP en ventas

---

## 🗺️ PLAN DE ACCIÓN (PASO A PASO)

### PASO 1: Configurar SQL Server (HOY - 15 minutos)

1. ✅ Abre **SQL Server Management Studio** en Windows
2. ✅ Lee la guía: `sql/GUIA-IMPORTAR-SQL-SERVER.md`
3. ✅ Ejecuta los 3 scripts SQL en orden
4. ✅ Verifica que todo funcionó

### PASO 2: Aprender SQL Básico (Semanas 1-2)

1. 📖 Lee la guía: `guias/GUIA-SQL-COMPLETA.md` - Nivel 1
2. 🏋️ Practica SELECT, WHERE, ORDER BY
3. ✅ Resuelve ejercicios 1-8
4. ⏱️ Practica 30-45 min diarios en SSMS

### PASO 3: Agregaciones (Semanas 3-4)

1. 📖 Lee Nivel 2 de la guía
2. 🏋️ Practica COUNT, SUM, AVG, GROUP BY
3. ✅ Resuelve ejercicios 9-16
4. ⏱️ Practica 45 min diarios

### PASO 4: JOINs (Semanas 5-6)

1. 📖 Lee Nivel 3 de la guía
2. 🏋️ Practica INNER JOIN, LEFT JOIN
3. ✅ Resuelve ejercicios 17-24
4. ⏱️ Practica 1 hora diaria

### PASO 5: SQL Avanzado (Semanas 7-8)

1. 📖 Lee Nivel 4 de la guía
2. 🏋️ Practica subconsultas, CASE WHEN, Window Functions
3. ✅ Resuelve ejercicios 25-32
4. ⏱️ Practica 1 hora diaria

**Meta:** Dominar SQL básico-intermedio en 8 semanas

---

## 📂 ESTRUCTURA COMPLETA DEL PROYECTO

```
proyecto-1-ventas/
│
├── LEER-PRIMERO.md                    ⬅️ ESTÁS AQUÍ
│
├── datos/                              📊 Datos del negocio
│   ├── vehiculos.csv                   (30 registros)
│   ├── clientes.csv                    (40 registros)
│   ├── ventas.csv                      (47 registros)
│   └── prestamos.csv                   (32 registros)
│
├── sql/                                🗄️ Scripts SQL Server
│   ├── GUIA-IMPORTAR-SQL-SERVER.md     ⬅️ LEE PRIMERO
│   ├── 01-crear-base-datos-sqlserver.sql
│   ├── 02-cargar-datos-sqlserver.sql
│   ├── 03-verificar-datos-sqlserver.sql
│   ├── concesionario.db                (SQLite - alternativa)
│   └── cargar_datos.py                 (script auxiliar)
│
├── guias/                              📚 Material de estudio
│   └── GUIA-SQL-COMPLETA.md            ⬅️ 70+ páginas, 50+ ejercicios
│
├── notebooks/                          🐍 Python (próximamente)
│   └── analisis-ventas.ipynb           (pendiente)
│
├── visualizaciones/                    📈 Dashboards (próximamente)
│   └── (pendiente)
│
└── resultados/                         📊 Análisis finales
    └── (pendiente)
```

---

## ✅ CHECKLIST DE INICIO

Marca lo que ya completaste:

**Configuración:**
- [ ] SQL Server instalado y funcionando
- [ ] SQL Server Management Studio (SSMS) instalado
- [ ] Archivos del proyecto accesibles desde Windows
- [ ] Guía de importación leída

**Ejecución:**
- [ ] Script 1 ejecutado: Base de datos creada
- [ ] Script 2 ejecutado: Datos cargados (30/40/47/32 registros)
- [ ] Script 3 ejecutado: Verificación exitosa

**Aprendizaje:**
- [ ] Guía SQL descargada y lista
- [ ] Primera consulta SELECT ejecutada
- [ ] Ejercicios de Nivel 1 iniciados

---

## 🎯 TU OBJETIVO FINAL

Al completar este proyecto, serás capaz de:

✅ Escribir consultas SQL desde básico hasta intermedio-avanzado
✅ Usar JOINs para combinar múltiples tablas
✅ Crear análisis de negocio con SQL
✅ Responder preguntas de negocio con datos
✅ Prepararte para entrevistas técnicas de SQL
✅ Tener un proyecto real para tu portafolio

**Habilidad SQL = 90%+ de ofertas laborales para analistas de datos**

---

## 🆘 ¿NECESITAS AYUDA?

### Problemas con SQL Server
- Lee la sección "Troubleshooting" en `sql/GUIA-IMPORTAR-SQL-SERVER.md`
- Verifica que el servicio de SQL Server esté corriendo

### Problemas con los archivos
- Usa `\\wsl$` desde Windows para acceder a archivos de WSL
- O copia el proyecto completo a una carpeta de Windows

### Dudas sobre SQL
- Consulta la guía completa en `guias/GUIA-SQL-COMPLETA.md`
- Todos los ejercicios tienen soluciones incluidas

---

## 📚 RECURSOS ADICIONALES

**Práctica online:**
- LeetCode SQL: https://leetcode.com/problemset/database/
- HackerRank SQL: https://www.hackerrank.com/domains/sql
- Mode SQL Tutorial: https://mode.com/sql-tutorial/

**Documentación:**
- SQL Server T-SQL: https://docs.microsoft.com/en-us/sql/t-sql/
- SSMS Docs: https://docs.microsoft.com/en-us/sql/ssms/

---

## 🚀 PRÓXIMOS PASOS

Una vez que domines SQL (4-8 semanas):

1. **Python + Pandas** - Análisis de datos con Python
2. **Visualización** - Power BI o Matplotlib/Seaborn
3. **Documentación** - README profesional para GitHub
4. **Portafolio completo** - Proyecto listo para mostrar a reclutadores

**Por ahora: ENFÓCATE EN SQL** 🎯

---

## 💡 CONSEJOS FINALES

**Para aprender SQL efectivamente:**

1. ✅ Practica TODOS LOS DÍAS (aunque sean 30 minutos)
2. ✅ Escribe las consultas TÚ MISMO (no solo leer)
3. ✅ Resuelve TODOS los ejercicios de la guía
4. ✅ Experimenta cambiando las consultas
5. ✅ Practica en LeetCode SQL después de la guía
6. ✅ NO te saltes los fundamentos básicos

**SQL es como aprender a manejar:**
- Primero lo básico (SELECT, WHERE)
- Luego lo intermedio (JOINs, GROUP BY)
- Finalmente lo avanzado (Window Functions, CTEs)

**¡No te apures! La práctica constante es mejor que estudiar todo de golpe.**

---

## 🎓 EMPIEZA AQUÍ

1. **Abre:** `sql/GUIA-IMPORTAR-SQL-SERVER.md`
2. **Sigue los pasos** para configurar SQL Server
3. **Ejecuta los 3 scripts** en SSMS
4. **Verifica** que todo funcionó
5. **Comienza** a estudiar la guía SQL completa

**¡Éxito en tu aprendizaje!** 🚀

---

*💡 Recuerda: Este proyecto está diseñado específicamente para que practiques las habilidades MÁS demandadas por el mercado laboral de 2025.*

*🎯 Tu meta: Conseguir tu primer empleo como Analista de Datos*

---

**Fecha de creación:** Noviembre 2024
**Autor:** Proyecto Portafolio de Datos
**Ubicación:** Bogotá, Colombia
