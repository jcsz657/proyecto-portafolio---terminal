# Automatización de Búsquedas de Empleo

Este documento explica cómo funcionan las búsquedas automáticas programadas.

## ⏰ Horario Configurado

Las búsquedas se ejecutan automáticamente **dos veces al día**:
- **9:00 AM** - Búsqueda matutina
- **6:00 PM** - Búsqueda vespertina

## 📱 Notificaciones

Cuando se encuentren **ofertas nuevas**, recibirás notificaciones por Telegram con:
- Título del puesto
- Empresa
- Modalidad (remota/híbrida)
- Ubicación
- Salario (si está disponible)
- Link para aplicar

## 📁 Archivos de la Automatización

```
job-hunter/
├── run_job_search.sh          # Script que ejecuta cron
├── crontab_config.txt         # Configuración de horarios
└── logs/
    └── cron.log               # Log de ejecuciones automáticas
```

## 🔧 Comandos Útiles

### Ver el crontab actual
```bash
crontab -l
```

### Ver el log de ejecuciones automáticas
```bash
tail -f ~/job-hunter/logs/cron.log
```

### Ver últimas 50 líneas del log
```bash
tail -50 ~/job-hunter/logs/cron.log
```

### Ejecutar búsqueda manual
```bash
cd ~/job-hunter
python3 src/job_search.py
```

### Probar el script de cron manualmente
```bash
~/job-hunter/run_job_search.sh
```

## ⚙️ Modificar Horarios

Para cambiar los horarios de ejecución:

1. Edita el archivo crontab:
```bash
crontab -e
```

2. Modifica las líneas con los nuevos horarios. Formato:
```
minuto hora * * * comando
```

Ejemplos:
```bash
# 8:00 AM
0 8 * * * /home/juliocesar/job-hunter/run_job_search.sh

# 12:00 PM (mediodía)
0 12 * * * /home/juliocesar/job-hunter/run_job_search.sh

# 10:00 PM
0 22 * * * /home/juliocesar/job-hunter/run_job_search.sh

# Cada 6 horas
0 */6 * * * /home/juliocesar/job-hunter/run_job_search.sh
```

3. Guarda y cierra el editor

## 🛑 Desactivar Búsquedas Automáticas

Para desactivar temporalmente:

```bash
crontab -r  # Elimina todo el crontab
```

O comenta las líneas en el crontab:
```bash
crontab -e
# Agrega # al inicio de las líneas que quieres desactivar
```

## ✅ Verificar que Cron Está Funcionando

### Método 1: Ver el log
```bash
# Espera hasta el próximo horario (9 AM o 6 PM)
tail -f ~/job-hunter/logs/cron.log
```

### Método 2: Ver ejecuciones del sistema
```bash
grep CRON /var/log/syslog | grep job-hunter | tail -10
```

### Método 3: Verificar el servicio cron
```bash
sudo service cron status
```

## 🐛 Solución de Problemas

### El cron no se ejecuta

1. **Verificar que el servicio cron esté activo:**
```bash
sudo service cron status
# Si no está activo:
sudo service cron start
```

2. **Verificar permisos del script:**
```bash
ls -l ~/job-hunter/run_job_search.sh
# Debe mostrar: -rwxr-xr-x (ejecutable)
# Si no:
chmod +x ~/job-hunter/run_job_search.sh
```

3. **Verificar rutas absolutas:**
El crontab debe usar rutas absolutas completas.

### No recibo notificaciones

1. **Verificar configuración de Telegram:**
```bash
cat ~/job-hunter/config/profile.json | grep -A 5 telegram
```

2. **Verificar que haya ofertas nuevas:**
Las notificaciones solo se envían cuando se encuentran ofertas que no están en la base de datos.

3. **Ver el log de cron:**
```bash
tail -50 ~/job-hunter/logs/cron.log
```

## 📊 Monitoreo

### Ver estadísticas de búsquedas
```bash
sqlite3 ~/job-hunter/data/jobs.db "
SELECT
    DATE(fecha_encontrado) as fecha,
    COUNT(*) as ofertas
FROM jobs
GROUP BY fecha
ORDER BY fecha DESC
LIMIT 7;
"
```

### Ver ofertas por fuente
```bash
sqlite3 ~/job-hunter/data/jobs.db "
SELECT fuente, COUNT(*) as total
FROM jobs
GROUP BY fuente;
"
```

## 🔄 Restablecer Búsqueda Completa

Si quieres que vuelva a notificarte todas las ofertas:

```bash
# CUIDADO: Esto borra todas las ofertas guardadas
rm ~/job-hunter/data/jobs.db
python3 ~/job-hunter/src/job_search.py
```

## 📝 Notas Importantes

1. **Límites de APIs:**
   - Remotive recomienda máximo 4 consultas por día (ya configurado)
   - Get on Board no tiene límite especificado

2. **WSL (Windows Subsystem for Linux):**
   - Si usas WSL, asegúrate de que WSL esté corriendo cuando se ejecute el cron
   - Considera usar Programador de Tareas de Windows en su lugar

3. **Conexión a Internet:**
   - El sistema requiere conexión a internet para funcionar
   - Si no hay conexión, se registrará un error en el log

4. **Base de Datos:**
   - La BD crece con el tiempo
   - Considera limpiar ofertas viejas periódicamente

## 🎯 Mejoras Futuras

Ideas para mejorar la automatización:

- [ ] Notificación diaria de resumen aunque no haya ofertas nuevas
- [ ] Limpiar ofertas antiguas (>30 días) automáticamente
- [ ] Estadísticas semanales por email
- [ ] Integración con Google Calendar para entrevistas
- [ ] Dashboard web para visualizar ofertas

---

**¿Necesitas ayuda?** Revisa el `README.md` o los logs en `logs/`.
