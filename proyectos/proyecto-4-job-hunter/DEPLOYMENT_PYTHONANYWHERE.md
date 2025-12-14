# Deployment en PythonAnywhere

Guía completa para desplegar Job Hunter en PythonAnywhere y tener búsquedas automáticas 24/7.

---

## 📋 Requisitos Previos

- [ ] Tener el proyecto Job Hunter funcionando localmente
- [ ] Bot de Telegram configurado
- [ ] Cuenta de email válida

---

## 🚀 Paso 1: Crear cuenta en PythonAnywhere

1. Ve a: **https://www.pythonanywhere.com**
2. Click en **"Start running Python online in less than a minute!"**
3. Click en **"Create a Beginner account"** (es gratis para siempre)
4. Completa el registro:
   - Username (tu usuario)
   - Email
   - Password
5. Confirma tu email
6. Inicia sesión en PythonAnywhere

---

## 📦 Paso 2: Subir el código a PythonAnywhere

### Opción A: Subir archivos manualmente (Más fácil)

1. En PythonAnywhere, ve a **"Files"** en el menú superior
2. Crea el directorio del proyecto:
   - En "Directories", escribe: `job-hunter`
   - Click en **"New directory"**
3. Entra al directorio `job-hunter`
4. Sube los archivos principales:

   **Archivos a subir:**
   ```
   ├── config/
   │   └── profile.json          ← TU ARCHIVO (con tus datos reales)
   ├── src/
   │   ├── job_search.py
   │   ├── telegram_notifier.py
   │   └── get_chat_id.py
   ├── data/
   │   └── .gitkeep              ← Archivo vacío
   ├── logs/
   │   └── .gitkeep              ← Archivo vacío
   └── requirements.txt
   ```

5. Para subir cada archivo:
   - Click en **"Upload a file"**
   - Selecciona el archivo
   - Asegúrate de estar en la carpeta correcta

### Opción B: Usar Git (Recomendado si sabes Git)

1. En tu computador local, inicializa Git:
   ```bash
   cd ~/job-hunter
   git init
   git add .
   git commit -m "Initial commit"
   ```

2. Crea un repositorio en GitHub (privado recomendado)

3. Sube el código:
   ```bash
   git remote add origin https://github.com/tu-usuario/job-hunter.git
   git push -u origin main
   ```

4. En PythonAnywhere, abre una **Bash console**:
   ```bash
   git clone https://github.com/tu-usuario/job-hunter.git
   cd job-hunter
   ```

---

## 🔧 Paso 3: Instalar dependencias

1. En PythonAnywhere, abre una **Bash console** (menú "Consoles")
2. Navega al directorio:
   ```bash
   cd ~/job-hunter
   ```

3. Instala las dependencias:
   ```bash
   pip3 install --user -r requirements.txt
   ```

4. Verifica la instalación:
   ```bash
   python3 -c "import requests; print('✓ requests instalado')"
   ```

---

## ⚙️ Paso 4: Configurar el archivo profile.json

1. Ve a **"Files"** → `job-hunter/config/profile.json`
2. Edita el archivo y asegúrate de que tenga:
   - ✅ Tu bot_token de Telegram
   - ✅ Tu chat_id de Telegram
   - ✅ Tus keywords
   - ✅ Tus preferencias

3. **MUY IMPORTANTE:** Verifica que el JSON sea válido:
   ```bash
   python3 -m json.tool config/profile.json
   ```

---

## 🧪 Paso 5: Probar que funciona

1. En la Bash console de PythonAnywhere:
   ```bash
   cd ~/job-hunter
   python3 src/job_search.py
   ```

2. Deberías ver:
   - ✅ Búsquedas ejecutándose
   - ✅ Notificaciones en Telegram
   - ✅ Ofertas guardadas

3. Si hay errores, revisa:
   - Rutas de archivos
   - Configuración de Telegram
   - Dependencias instaladas

---

## ⏰ Paso 6: Configurar tarea programada

### ⚠️ IMPORTANTE: Limitaciones del plan gratuito

PythonAnywhere gratuito permite:
- ✅ Solo **1 tarea programada**
- ✅ Se ejecuta **1 vez al día**
- ✅ Puedes elegir la hora (en UTC)

### Configuración de la tarea:

1. En PythonAnywhere, ve a **"Tasks"** en el menú superior

2. En la sección **"Scheduled tasks"**, configura:

   **Hora (UTC):**
   - Para ejecutar a las 9:00 AM Colombia (UTC-5):
     - Hora UTC: **14:00**
   - Para ejecutar a las 6:00 PM Colombia (UTC-5):
     - Hora UTC: **23:00**

   **Comando:**
   ```bash
   cd /home/TU_USERNAME/job-hunter && python3 src/job_search.py
   ```

   ⚠️ Reemplaza `TU_USERNAME` con tu usuario de PythonAnywhere

3. Click en **"Create"**

4. Verifica que aparezca en la lista de tareas

---

## 📊 Paso 7: Verificar que funciona

### Primera ejecución:

La tarea se ejecutará automáticamente a la hora programada, pero puedes probarla manualmente:

```bash
cd ~/job-hunter && python3 src/job_search.py
```

### Ver logs:

1. Ve a **"Files"** → `job-hunter/logs/`
2. Abre `search.log` para ver el historial

### Ver base de datos:

```bash
cd ~/job-hunter
python3 -c "import sqlite3; conn = sqlite3.connect('data/jobs.db'); cursor = conn.cursor(); cursor.execute('SELECT COUNT(*) FROM jobs'); print(f'Total ofertas: {cursor.fetchone()[0]}')"
```

---

## 🔄 Solución de Problemas

### Error: "No module named 'requests'"

```bash
pip3 install --user requests
```

### Error: "Permission denied"

Asegúrate de que los archivos estén en `/home/TU_USERNAME/job-hunter`

### Error: "No such file or directory"

Verifica las rutas en el comando de la tarea programada.

### No recibo notificaciones

1. Verifica el bot_token y chat_id en `config/profile.json`
2. Prueba manualmente:
   ```bash
   python3 src/telegram_notifier.py
   ```

### La tarea no se ejecuta

1. Verifica que la hora esté en UTC
2. Revisa que el comando sea correcto
3. Prueba el comando manualmente en la consola

---

## ⚙️ Configuración Avanzada

### Ejecutar 2 veces al día (Plan Paid)

Si actualizas a un plan de pago ($5/mes), puedes tener múltiples tareas:

**Tarea 1 - Mañana (9 AM Colombia = 14:00 UTC):**
```bash
cd /home/TU_USERNAME/job-hunter && python3 src/job_search.py
```

**Tarea 2 - Tarde (6 PM Colombia = 23:00 UTC):**
```bash
cd /home/TU_USERNAME/job-hunter && python3 src/job_search.py
```

### Limpiar logs automáticamente

Puedes agregar una tarea semanal para limpiar logs viejos:
```bash
cd /home/TU_USERNAME/job-hunter && tail -1000 logs/search.log > logs/search.log.tmp && mv logs/search.log.tmp logs/search.log
```

---

## 📈 Monitoreo

### Ver historial de ejecuciones:

En PythonAnywhere:
1. Ve a **"Tasks"**
2. Mira la columna **"Last run"** y **"Status"**

### Ver últimas ofertas:

```bash
cd ~/job-hunter
python3 -c "import sqlite3; conn = sqlite3.connect('data/jobs.db'); cursor = conn.cursor(); cursor.execute('SELECT titulo, fecha_encontrado FROM jobs ORDER BY fecha_encontrado DESC LIMIT 5'); [print(f'{t} - {f}') for t, f in cursor.fetchall()]"
```

---

## 🔐 Seguridad

### ⚠️ IMPORTANTE:

1. **Nunca subas tu profile.json a GitHub público**
   - Tu bot_token es sensible
   - Usa `.gitignore` para excluirlo

2. **Si usas GitHub, hazlo privado**

3. **Backup de configuración:**
   ```bash
   # En PythonAnywhere
   cp config/profile.json config/profile.backup.json
   ```

---

## 💰 Costos

### Plan Gratuito (Actual):
- ✅ 100% gratis para siempre
- ✅ 1 tarea programada (1 vez/día)
- ✅ 512 MB de espacio
- ✅ Suficiente para este proyecto

### Plan Hacker ($5/mes):
- ✅ Múltiples tareas programadas
- ✅ Más almacenamiento
- ✅ Mayor tiempo de CPU

**Recomendación:** Empieza con el plan gratuito. Si necesitas más búsquedas diarias, actualiza después.

---

## ✅ Checklist Final

Antes de terminar, verifica:

- [ ] Cuenta de PythonAnywhere creada
- [ ] Código subido a PythonAnywhere
- [ ] Dependencias instaladas (`pip3 install -r requirements.txt`)
- [ ] `profile.json` configurado correctamente
- [ ] Prueba manual exitosa (`python3 src/job_search.py`)
- [ ] Tarea programada creada
- [ ] Primera notificación recibida en Telegram
- [ ] Logs siendo generados correctamente

---

## 🎯 Resumen

Una vez completado:
- ✅ Tu sistema correrá 24/7 en la nube
- ✅ Recibirás notificaciones automáticas en Telegram
- ✅ No necesitas tener tu computador encendido
- ✅ Todo es 100% gratuito

---

## 🆘 Soporte

Si tienes problemas:

1. Revisa los logs en `logs/search.log`
2. Prueba el script manualmente
3. Verifica la configuración de Telegram
4. Consulta la documentación de PythonAnywhere: https://help.pythonanywhere.com/

---

## 📚 Próximos Pasos

Después del deployment:

1. Espera a la primera ejecución automática
2. Verifica que recibes notificaciones
3. Monitorea los logs diariamente al inicio
4. Ajusta keywords si es necesario

---

**¡Listo! Tu sistema de búsqueda de empleos ahora corre en la nube 24/7! 🎉**
