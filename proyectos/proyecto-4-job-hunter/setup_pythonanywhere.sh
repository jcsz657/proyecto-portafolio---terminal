#!/bin/bash
#
# Script de instalación para PythonAnywhere
# Ejecuta este script en la Bash console de PythonAnywhere
#

echo "═══════════════════════════════════════════════════════════════════════"
echo "  JOB HUNTER - Instalación en PythonAnywhere"
echo "═══════════════════════════════════════════════════════════════════════"
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -f "src/job_search.py" ]; then
    echo "❌ Error: No se encuentra src/job_search.py"
    echo "   Por favor ejecuta este script desde el directorio job-hunter"
    echo ""
    echo "   Usa: cd ~/job-hunter && bash setup_pythonanywhere.sh"
    exit 1
fi

echo "✓ Directorio correcto encontrado"
echo ""

# Instalar dependencias
echo "📦 Instalando dependencias..."
pip3 install --user -r requirements.txt

if [ $? -eq 0 ]; then
    echo "✓ Dependencias instaladas correctamente"
else
    echo "❌ Error instalando dependencias"
    exit 1
fi
echo ""

# Verificar instalación
echo "🔍 Verificando instalación..."
python3 -c "import requests" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✓ requests instalado correctamente"
else
    echo "❌ Error: requests no se instaló correctamente"
    exit 1
fi
echo ""

# Crear directorios si no existen
echo "📁 Creando directorios..."
mkdir -p data logs

echo "✓ Directorios creados"
echo ""

# Verificar configuración
echo "⚙️  Verificando configuración..."

if [ ! -f "config/profile.json" ]; then
    echo "❌ Error: config/profile.json no encontrado"
    echo "   Por favor crea este archivo con tu configuración"
    exit 1
fi

# Verificar que el JSON sea válido
python3 -m json.tool config/profile.json > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "✓ profile.json es válido"
else
    echo "❌ Error: profile.json tiene errores de sintaxis"
    exit 1
fi
echo ""

# Verificar Telegram
BOT_TOKEN=$(python3 -c "import json; f=open('config/profile.json'); c=json.load(f); print(c['telegram']['bot_token'])" 2>/dev/null)
CHAT_ID=$(python3 -c "import json; f=open('config/profile.json'); c=json.load(f); print(c['telegram']['chat_id'])" 2>/dev/null)

if [ "$BOT_TOKEN" = "YOUR_BOT_TOKEN_HERE" ]; then
    echo "⚠️  Advertencia: bot_token no configurado"
    echo "   Edita config/profile.json y configura tu bot_token"
    TELEGRAM_OK=false
else
    echo "✓ bot_token configurado"
    TELEGRAM_OK=true
fi

if [ "$CHAT_ID" = "YOUR_CHAT_ID_HERE" ]; then
    echo "⚠️  Advertencia: chat_id no configurado"
    echo "   Edita config/profile.json y configura tu chat_id"
    TELEGRAM_OK=false
else
    echo "✓ chat_id configurado"
fi
echo ""

# Prueba del sistema
echo "🧪 Ejecutando prueba del sistema..."
echo ""

python3 src/job_search.py

if [ $? -eq 0 ]; then
    echo ""
    echo "✓ Prueba completada exitosamente"
else
    echo ""
    echo "❌ La prueba falló - revisa los errores arriba"
    exit 1
fi
echo ""

echo "═══════════════════════════════════════════════════════════════════════"
echo "✅ INSTALACIÓN COMPLETADA"
echo "═══════════════════════════════════════════════════════════════════════"
echo ""
echo "📋 Próximos pasos:"
echo ""
echo "1. Verifica que recibiste notificaciones en Telegram"
echo "2. Ve a la pestaña 'Tasks' en PythonAnywhere"
echo "3. Crea una tarea programada con este comando:"
echo ""
echo "   cd /home/$(whoami)/job-hunter && python3 src/job_search.py"
echo ""
echo "4. Configura la hora en UTC:"
echo "   • Para 9 AM Colombia: 14:00 UTC"
echo "   • Para 6 PM Colombia: 23:00 UTC"
echo ""
echo "📚 Documentación completa: DEPLOYMENT_PYTHONANYWHERE.md"
echo ""
echo "═══════════════════════════════════════════════════════════════════════"
