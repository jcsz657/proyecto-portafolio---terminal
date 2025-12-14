# 🎯 Job Hunter

**Buscador automático de empleos Junior** para Data Analyst, BI Analyst y roles relacionados.

Sistema automatizado que busca ofertas de empleo en múltiples plataformas, filtra por criterios específicos (nivel Junior, modalidad remota, etc.) y envía notificaciones instantáneas por Telegram.

---

## 📋 ¿Qué hace este proyecto?

Job Hunter es un bot que:

1. **Busca automáticamente** ofertas de empleo 2 veces al día
2. **Filtra solo ofertas Junior** (0-2 años de experiencia)
3. **Excluye roles no deseados** (developers, engineers, QA, etc.)
4. **Envía notificaciones** a Telegram cuando encuentra ofertas nuevas
5. **Evita duplicados** usando una base de datos SQLite
6. **Guarda logs** de todas las búsquedas

---

## 🚀 Características

✅ **3 fuentes de empleo**:
- Get on Board (Latam, startups tech)
- Remotive (trabajos remotos globales)
- Jooble (agregador: elempleo, Computrabajo, LinkedIn, Indeed)

✅ **Filtros inteligentes**:
- Solo ofertas Junior (máximo 2 años experiencia)
- Excluye >40 términos (senior, developer, engineer, QA, etc.)
- Filtra por modalidad (remota/híbrida)
- Filtra por ubicación (Colombia, Latam, Remote)

✅ **Notificaciones automáticas**:
- Alerta por cada oferta nueva
- Resumen al final de cada búsqueda
- Enviadas directamente a Telegram

✅ **Búsquedas programadas**:
- 9:00 AM y 6:00 PM (configurable)
- Completamente automático con cron
- Funciona mientras el PC esté encendido

---

## 🛠️ Tecnologías y Herramientas

| Herramienta | ¿Qué hace? | ¿Por qué se usa? |
|-------------|-----------|------------------|
| **Python 3** | Lenguaje de programación | Fácil de usar, ideal para scripts y APIs |
| **requests** | Librería para peticiones HTTP | Consulta las APIs de empleo |
| **SQLite** | Base de datos local | Guarda ofertas y evita duplicados (sin instalar nada) |
| **Telegram Bot API** | API de mensajería | Envía notificaciones instantáneas al celular |
| **Cron** | Programador de tareas (Linux/Mac) | Ejecuta búsquedas automáticas 2 veces al día |
| **Get on Board API** | API de empleos Latam | Fuente principal de ofertas tech en Latinoamérica |
| **Remotive API** | API de empleos remotos | Fuente de trabajos remotos globales |
| **Jooble API** | Agregador de empleos | Consolida elempleo, Computrabajo, LinkedIn, Indeed |

---

## 📁 Estructura del Proyecto

```
job-hunter/
├── config/
│   ├── profile.json.example     ← Plantilla de configuración
│   └── profile.json             ← TU configuración (NO se sube a GitHub)
├── src/
│   ├── job_search.py            ← Script principal de búsqueda
│   ├── telegram_notifier.py     ← Envía notificaciones a Telegram
│   └── get_chat_id.py           ← Obtiene tu Telegram Chat ID
├── data/
│   ├── .gitkeep
│   └── jobs.db                  ← Base de datos SQLite (se crea automáticamente)
├── logs/
│   ├── .gitkeep
│   ├── search.log               ← Log de búsquedas (se crea automáticamente)
│   └── cron.log                 ← Log de ejecuciones de cron
├── run_job_search.sh            ← Wrapper para ejecutar con cron
├── setup_pythonanywhere.sh      ← Script de instalación para la nube
├── requirements.txt             ← Dependencias de Python
├── .gitignore                   ← Archivos que NO se suben a GitHub
├── README.md                    ← Este archivo
├── AUTOMATIZACION.md            ← Guía de configuración de cron
├── DEPLOYMENT_PYTHONANYWHERE.md ← Guía para desplegar en la nube
├── CHECKLIST_PYTHONANYWHERE.txt ← Checklist paso a paso para la nube
├── COMO_OBTENER_JOOBLE_API.md   ← Guía para obtener Jooble API key
└── COMANDOS_UTILES.txt          ← Comandos de referencia
```

---

## ⚙️ Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/TU_USUARIO/job-hunter.git
cd job-hunter
```

### 2. Instalar dependencias

```bash
pip3 install -r requirements.txt
```

### 3. Configurar tu perfil

```bash
# Copiar el archivo de ejemplo
cp config/profile.json.example config/profile.json

# Editar con tus datos
nano config/profile.json
```

Configura:
- **Telegram Bot Token**: Obtén uno con [@BotFather](https://t.me/BotFather)
- **Telegram Chat ID**: Ejecuta `python3 src/get_chat_id.py` después de enviar un mensaje a tu bot
- **Jooble API Key** (opcional): Sigue la guía `COMO_OBTENER_JOOBLE_API.md`
- **Keywords**: Términos de búsqueda personalizados
- **Preferencias**: Modalidad, ubicación, salario

### 4. Probar el sistema

```bash
python3 src/job_search.py
```

Deberías recibir notificaciones en Telegram con las ofertas encontradas.

---

## 🤖 ¿Cómo funciona cada componente?

### **job_search.py** - El cerebro del sistema
- Consulta las APIs de Get on Board, Remotive y Jooble
- Busca con las keywords configuradas
- Filtra ofertas por nivel Junior y criterios
- Guarda ofertas nuevas en la base de datos
- Llama al notificador de Telegram

### **telegram_notifier.py** - El mensajero
- Recibe ofertas del script principal
- Formatea mensajes bonitos con emojis
- Envía notificaciones individuales por oferta
- Envía resumen al final

### **jobs.db** - La memoria
- Base de datos SQLite (archivo local)
- Guarda todas las ofertas encontradas
- Evita enviar duplicados
- Tabla: `jobs` con campos (id, titulo, empresa, url, fuente, fecha, etc.)

### **Cron** - El reloj automático
- Programa de Linux/Mac que ejecuta tareas
- Configurado para correr 2 veces al día (9 AM y 6 PM)
- Ejecuta `run_job_search.sh` automáticamente

### **run_job_search.sh** - El wrapper
- Script bash simple
- Cambia al directorio correcto
- Ejecuta `job_search.py`
- Guarda logs de ejecución

---

## 📊 APIs Utilizadas

### Get on Board API
- **URL**: https://www.getonbrd.com/api/v0/search/jobs
- **Uso**: Búsqueda de empleos tech en Latam
- **Límite**: Sin límite conocido
- **Parámetros**: `query` (keyword), `per_page`, `page`

### Remotive API
- **URL**: https://remotive.com/api/remote-jobs
- **Uso**: Trabajos remotos globales
- **Límite**: Máximo 4 peticiones/día (recomendado)
- **Método**: Descarga todos los empleos y filtra localmente

### Jooble API
- **URL**: https://jooble.org/api/{API_KEY}
- **Uso**: Agregador (elempleo, Computrabajo, LinkedIn, Indeed)
- **Límite**: Gratuito para uso personal (límite razonable)
- **Parámetros**: `keywords`, `location`, `page`
- **Requiere**: API key (gratis, obtenible en su sitio)

---

## 🔧 Configuración de Búsquedas Automáticas

### Linux/Mac (Cron)

```bash
# Editar crontab
crontab -e

# Agregar estas líneas (ajusta la ruta):
0 9 * * * cd /ruta/a/job-hunter && bash run_job_search.sh
0 18 * * * cd /ruta/a/job-hunter && bash run_job_search.sh
```

Ver guía completa: `AUTOMATIZACION.md`

### Nube (PythonAnywhere - Gratis)

Ver guía paso a paso: `DEPLOYMENT_PYTHONANYWHERE.md`

---

## 📱 Configurar Telegram

### 1. Crear un bot

1. Habla con [@BotFather](https://t.me/BotFather) en Telegram
2. Envía `/newbot`
3. Sigue las instrucciones
4. Copia el **Bot Token**

### 2. Obtener tu Chat ID

```bash
# Primero, envía un mensaje a tu bot en Telegram
# Luego ejecuta:
python3 src/get_chat_id.py
```

Copia el **Chat ID** que aparece.

### 3. Configurar en profile.json

```json
"telegram": {
  "activo": true,
  "bot_token": "8459412326:AAFUqCiaAGDC...",  ← Tu bot token
  "chat_id": "8000773630",                    ← Tu chat ID
  "notificar_por_oferta": true,
  "notificar_resumen": true
}
```

---

## 🎯 Filtros Configurados

### ✅ Keywords que SÍ busca (primeras 3 usadas):
- `data analyst`
- `analista de datos`
- `business intelligence analyst`
- `analista bi`
- Y 11 más específicas...

### ❌ Términos excluidos (49 total):
- **Niveles senior**: senior, sr, lead, manager, director, head, principal, staff, chief, architect
- **Roles técnicos**: developer, desarrollador, engineer, ingeniero, scientist, programmer
- **Especialidades**: qa, devops, sysadmin, network, full-stack, frontend, backend
- **Años específicos**: "3 años", "4+ years", "5 años", etc.
- **Otros**: crypto, trader, sales, marketing, coordinator, etc.

### 📏 Criterios adicionales:
- **Experiencia máxima**: 2 años
- **Modalidad**: Remota o Híbrida
- **Ubicación**: Colombia, Latam, Remote, Worldwide
- **Salario mínimo**: $2,500,000 COP (~$600 USD)

---

## 📈 Resultados Esperados

Con los filtros actuales, de cada 50 ofertas encontradas:
- **46 se filtran** (no cumplen criterios)
- **3-4 pasan** (100% relevantes para Data Analyst Junior)

### Ejemplo de ofertas que PASAN ✅:
- Data Analyst: Constructor
- Business Intelligence Analyst
- Analista Business Intelligence

### Ejemplo de ofertas FILTRADAS ❌:
- Senior Data Analyst (tiene "senior")
- Full-Stack Developer (tiene "developer" y "full-stack")
- QA Analyst (tiene "qa")
- Data Engineer (tiene "engineer")

---

## 🚀 Próximos Pasos (Opcional)

- [ ] Activar Jooble API para más fuentes colombianas
- [ ] Desplegar en PythonAnywhere para ejecución 24/7
- [ ] Agregar más keywords personalizadas
- [ ] Ajustar filtros según resultados

---

## 📝 Licencia

MIT License - Libre para uso personal y modificación.

---

## 👤 Autor

**Julio César**
Ingeniero Industrial en transición a Data Analyst

**Stack técnico usado**:
- Excel, Power BI, SQL Server
- Python (requests, sqlite3)
- APIs REST
- Automatización con Cron
- Telegram Bot API

---

## 🆘 Soporte

Para dudas o problemas:
1. Revisa los archivos de documentación (`.md` y `.txt`)
2. Verifica los logs en `logs/search.log`
3. Comprueba la configuración en `config/profile.json`

---

**¡Buena suerte en tu búsqueda de empleo!** 🎯📊
