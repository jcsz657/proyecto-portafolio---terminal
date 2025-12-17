#!/bin/bash

echo "🎨 Artwork AI Verifier - Instalación Rápida"
echo "=========================================="
echo ""

# Verificar Python
echo "1. Verificando Python..."
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 no está instalado. Por favor instálalo primero."
    exit 1
fi
echo "✅ Python encontrado: $(python3 --version)"

# Verificar Tesseract
echo ""
echo "2. Verificando Tesseract OCR..."
if ! command -v tesseract &> /dev/null; then
    echo "⚠️  Tesseract no encontrado. Instalando..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt-get update
        sudo apt-get install -y tesseract-ocr tesseract-ocr-spa poppler-utils
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install tesseract tesseract-lang poppler
    else
        echo "❌ Por favor instala Tesseract manualmente:"
        echo "   https://github.com/tesseract-ocr/tesseract"
        exit 1
    fi
fi
echo "✅ Tesseract encontrado: $(tesseract --version | head -n 1)"

# Crear entorno virtual
echo ""
echo "3. Creando entorno virtual..."
python3 -m venv venv
echo "✅ Entorno virtual creado"

# Activar entorno virtual
echo ""
echo "4. Activando entorno virtual..."
source venv/bin/activate
echo "✅ Entorno activado"

# Instalar dependencias
echo ""
echo "5. Instalando dependencias Python..."
cd backend
pip install --upgrade pip
pip install -r requirements.txt
cd ..
echo "✅ Dependencias instaladas"

# Crear carpetas necesarias
echo ""
echo "6. Creando estructura de carpetas..."
mkdir -p backend/uploads/{master,supplier,results}
mkdir -p tests/sample_artworks
echo "✅ Carpetas creadas"

echo ""
echo "=========================================="
echo "✅ Instalación completada exitosamente!"
echo ""
echo "📝 Próximos pasos:"
echo ""
echo "1. Iniciar el backend:"
echo "   cd backend && python app.py"
echo ""
echo "2. En otra terminal, abrir el frontend:"
echo "   cd frontend && python -m http.server 8000"
echo ""
echo "3. Abrir en el navegador:"
echo "   http://localhost:8000"
echo ""
echo "=========================================="
