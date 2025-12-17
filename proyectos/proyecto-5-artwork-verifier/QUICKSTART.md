# 🚀 Quick Start Guide

## Instalación en 3 pasos

### 1. Ejecutar script de instalación

```bash
cd artwork-ai-verifier
./INSTALL.sh
```

### 2. Iniciar el backend

```bash
cd backend
source ../venv/bin/activate  # En Windows: ..\venv\Scripts\activate
python app.py
```

Deberías ver:
```
🚀 Iniciando Artwork AI Verifier API...
📁 Carpeta de uploads: uploads
🔧 Extensiones permitidas: {'pdf', 'png', 'jpg', 'jpeg'}
📊 DPI de procesamiento: 300
🎯 Umbral de similitud: 0.95
🌐 Idiomas OCR: eng+spa

✅ API lista en http://localhost:5000
```

### 3. Abrir el frontend

**Opción A - Nueva terminal:**
```bash
cd frontend
python -m http.server 8000
```

Luego abrir: http://localhost:8000

**Opción B - Directamente:**
```bash
open frontend/index.html  # macOS
xdg-open frontend/index.html  # Linux
```

---

## 🧪 Prueba Rápida

### Crear archivos de prueba

1. **Crear un PDF simple** o usar cualquier etiqueta/arte que tengas

2. **Hacer una copia modificada** (cambia algo de texto, color, etc.)

3. **Comparar:**
   - Subir original como "Master"
   - Subir modificado como "Supplier"
   - Click en "Comparar"

### Lo que verás:

✅ **Si son idénticos:**
```
Status: APPROVED ✅
Similitud Visual: 99.8%
Similitud Texto: 100%
Diferencias: 0
```

⚠️ **Si hay diferencias pequeñas:**
```
Status: REVIEW_REQUIRED ⚠️
Similitud Visual: 94.2%
Similitud Texto: 98.5%
Diferencias: 5 visuales, 2 textuales
```

❌ **Si hay diferencias grandes:**
```
Status: REJECTED ❌
Similitud Visual: 78.3%
Similitud Texto: 85.1%
Errores Críticos: 3
- Fecha de vencimiento incorrecta
- Alérgeno "Soy" faltante
```

---

## 🐛 Troubleshooting

### Error: "Tesseract not found"
```bash
# Ubuntu/Debian
sudo apt-get install tesseract-ocr tesseract-ocr-spa

# macOS
brew install tesseract tesseract-lang
```

### Error: "pdf2image requires poppler"
```bash
# Ubuntu/Debian
sudo apt-get install poppler-utils

# macOS
brew install poppler
```

### Error: "Module not found"
```bash
# Asegúrate de estar en el entorno virtual
source venv/bin/activate
pip install -r backend/requirements.txt
```

### Puerto 5000 ya en uso
```bash
# Cambiar puerto en backend/app.py última línea:
app.run(debug=True, host='0.0.0.0', port=5001)

# Y en frontend/app.js primera línea:
const API_URL = 'http://localhost:5001';
```

---

## 📊 Testing con curl

```bash
# Health check
curl http://localhost:5000/health

# Comparar con curl
curl -X POST http://localhost:5000/api/compare \
  -F "master=@path/to/master.pdf" \
  -F "supplier=@path/to/supplier.pdf"
```

---

## 🎯 Próximos Pasos

1. ✅ Prueba con tus propias etiquetas/artes
2. ✅ Ajusta el threshold de similitud si es necesario
3. ✅ Experimenta con diferentes tipos de errores
4. ✅ Revisa el código para entender cómo funciona
5. ✅ Piensa en features adicionales que necesites

---

## 💡 Tips

- **DPI óptimo**: 300 DPI para mejor OCR
- **Tamaño de archivo**: Máximo 50MB
- **Formatos soportados**: PDF, PNG, JPG
- **Multi-página**: Solo se compara la primera página (por ahora)
- **Idiomas**: Inglés + Español (configurable)

---

¿Listo para empezar? 🚀

```bash
./INSTALL.sh
```
