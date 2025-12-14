#!/bin/bash
#
# Job Hunter - Script para ejecutar búsqueda automática
# Este script está diseñado para ejecutarse desde cron
#

# Directorio del proyecto
PROJECT_DIR="/home/juliocesar/job-hunter"
cd "$PROJECT_DIR" || exit 1

# Timestamp para el log
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$TIMESTAMP] Iniciando búsqueda automática de empleos..." >> logs/cron.log

# Ejecutar el buscador
python3 src/job_search.py >> logs/cron.log 2>&1

# Verificar si se ejecutó correctamente
if [ $? -eq 0 ]; then
    echo "[$TIMESTAMP] Búsqueda completada exitosamente" >> logs/cron.log
else
    echo "[$TIMESTAMP] ERROR: La búsqueda falló" >> logs/cron.log
fi

echo "" >> logs/cron.log
