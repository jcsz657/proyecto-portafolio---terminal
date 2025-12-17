"""
Artwork AI Verifier - API Flask
Prototipo para verificación automática de artes/etiquetas
"""
from flask import Flask, request, jsonify, send_file
from flask_cors import CORS
from werkzeug.utils import secure_filename
import os
import json
from datetime import datetime
import numpy as np

from services.pdf_processor import PDFProcessor
from services.image_comparator import ImageComparator
from services.ocr_engine import OCREngine

app = Flask(__name__)
CORS(app)  # Permitir requests desde frontend

# Configuración
UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'pdf', 'png', 'jpg', 'jpeg'}
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 50 * 1024 * 1024  # 50MB max

# Inicializar servicios
pdf_processor = PDFProcessor(dpi=300)
image_comparator = ImageComparator(similarity_threshold=0.95)
ocr_engine = OCREngine(lang='eng+spa')

# Crear carpetas necesarias
os.makedirs(f"{UPLOAD_FOLDER}/master", exist_ok=True)
os.makedirs(f"{UPLOAD_FOLDER}/supplier", exist_ok=True)
os.makedirs(f"{UPLOAD_FOLDER}/results", exist_ok=True)


def allowed_file(filename):
    """Verifica si el archivo es permitido"""
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


def convert_to_json_safe(obj):
    """
    Convierte objetos numpy y otros tipos no serializables a tipos nativos de Python
    """
    if isinstance(obj, np.integer):
        return int(obj)
    elif isinstance(obj, np.floating):
        return float(obj)
    elif isinstance(obj, np.bool_):
        return bool(obj)
    elif isinstance(obj, np.ndarray):
        return obj.tolist()
    elif isinstance(obj, dict):
        return {key: convert_to_json_safe(value) for key, value in obj.items()}
    elif isinstance(obj, list):
        return [convert_to_json_safe(item) for item in obj]
    elif isinstance(obj, tuple):
        return tuple(convert_to_json_safe(item) for item in obj)
    else:
        return obj


@app.route('/')
def index():
    """Endpoint de bienvenida"""
    return jsonify({
        'name': 'Artwork AI Verifier',
        'version': '1.0.0',
        'status': 'running',
        'endpoints': {
            '/health': 'Health check',
            '/api/compare': 'POST - Comparar dos artes',
            '/api/results/<id>': 'GET - Obtener resultado'
        }
    })


@app.route('/health')
def health():
    """Health check endpoint"""
    return jsonify({'status': 'healthy', 'timestamp': datetime.now().isoformat()})


@app.route('/api/compare', methods=['POST'])
def compare_artworks():
    """
    Endpoint principal: Compara dos artes (master vs supplier)

    Expected form data:
        - master: Archivo PDF/imagen del arte aprobado
        - supplier: Archivo PDF/imagen del proveedor
    """
    import sys
    try:
        print("🔍 Recibiendo request de comparación...", file=sys.stderr, flush=True)
        # Validar que se enviaron ambos archivos
        if 'master' not in request.files or 'supplier' not in request.files:
            return jsonify({'error': 'Se requieren ambos archivos: master y supplier'}), 400

        master_file = request.files['master']
        supplier_file = request.files['supplier']

        # Validar nombres de archivo
        if master_file.filename == '' or supplier_file.filename == '':
            return jsonify({'error': 'Archivos vacíos'}), 400

        # Validar extensiones
        if not allowed_file(master_file.filename) or not allowed_file(supplier_file.filename):
            return jsonify({'error': f'Extensiones permitidas: {ALLOWED_EXTENSIONS}'}), 400

        # Generar ID único para esta comparación
        comparison_id = datetime.now().strftime('%Y%m%d_%H%M%S')

        # Guardar archivos
        master_filename = secure_filename(f"master_{comparison_id}_{master_file.filename}")
        supplier_filename = secure_filename(f"supplier_{comparison_id}_{supplier_file.filename}")

        master_path = os.path.join(app.config['UPLOAD_FOLDER'], 'master', master_filename)
        supplier_path = os.path.join(app.config['UPLOAD_FOLDER'], 'supplier', supplier_filename)

        master_file.save(master_path)
        supplier_file.save(supplier_path)

        # Procesar archivos
        results = process_comparison(master_path, supplier_path, comparison_id)

        # Convertir resultados a JSON-safe
        results_safe = convert_to_json_safe(results)

        # Guardar resultados
        results_file = os.path.join(app.config['UPLOAD_FOLDER'], 'results', f'{comparison_id}_results.json')
        with open(results_file, 'w') as f:
            json.dump(results_safe, f, indent=2)

        return jsonify({
            'success': True,
            'comparison_id': comparison_id,
            'results': results_safe
        })

    except Exception as e:
        import sys
        import traceback
        error_details = traceback.format_exc()
        print(f"❌ Error en /api/compare:", file=sys.stderr, flush=True)
        print(error_details, file=sys.stderr, flush=True)
        return jsonify({'error': str(e)}), 500


def process_comparison(master_path, supplier_path, comparison_id):
    """
    Procesa la comparación completa entre dos artes

    Args:
        master_path: Ruta al arte master
        supplier_path: Ruta al arte del proveedor
        comparison_id: ID único de la comparación

    Returns:
        Diccionario con resultados completos
    """
    results = {
        'comparison_id': comparison_id,
        'timestamp': datetime.now().isoformat(),
        'master_file': os.path.basename(master_path),
        'supplier_file': os.path.basename(supplier_path),
        'visual_comparison': None,
        'text_comparison': None,
        'overall_status': 'PENDING'
    }

    try:
        # 1. Convertir PDFs a imágenes si es necesario
        master_image = master_path
        supplier_image = supplier_path

        if pdf_processor.is_pdf(master_path):
            print(f"📄 Convirtiendo PDF master...")
            master_images = pdf_processor.pdf_to_images(
                master_path,
                f"{app.config['UPLOAD_FOLDER']}/master"
            )
            master_image = master_images[0]  # Usar primera página

        if pdf_processor.is_pdf(supplier_path):
            print(f"📄 Convirtiendo PDF supplier...")
            supplier_images = pdf_processor.pdf_to_images(
                supplier_path,
                f"{app.config['UPLOAD_FOLDER']}/supplier"
            )
            supplier_image = supplier_images[0]  # Usar primera página

        # 2. Comparación visual
        print(f"🔍 Realizando comparación visual...")
        comparison_output = f"{app.config['UPLOAD_FOLDER']}/results/{comparison_id}_comparison.png"

        visual_result = image_comparator.create_comparison_report(
            master_image,
            supplier_image,
            comparison_output
        )

        results['visual_comparison'] = visual_result

        # 3. Extracción y comparación de texto (OCR)
        print(f"📝 Extrayendo texto con OCR...")

        master_text_data = ocr_engine.extract_text_with_confidence(master_image)
        supplier_text_data = ocr_engine.extract_text_with_confidence(supplier_image)

        text_comparison = ocr_engine.compare_text(
            master_text_data['text'],
            supplier_text_data['text']
        )

        # Extraer información clave
        master_key_info = ocr_engine.extract_key_info(master_text_data['text'])
        supplier_key_info = ocr_engine.extract_key_info(supplier_text_data['text'])

        results['text_comparison'] = {
            'master': {
                'text': master_text_data['text'],
                'confidence': master_text_data['confidence'],
                'word_count': master_text_data['word_count'],
                'key_info': master_key_info
            },
            'supplier': {
                'text': supplier_text_data['text'],
                'confidence': supplier_text_data['confidence'],
                'word_count': supplier_text_data['word_count'],
                'key_info': supplier_key_info
            },
            'comparison': text_comparison
        }

        # 4. Determinar estado general
        visual_ok = visual_result['status'] == 'APPROVED'
        text_ok = text_comparison['status'] == 'MATCH'

        if visual_ok and text_ok:
            results['overall_status'] = 'APPROVED'
            results['overall_message'] = '✅ Arte aprobado - Sin diferencias significativas'
        elif not visual_ok and not text_ok:
            results['overall_status'] = 'REJECTED'
            results['overall_message'] = '❌ Arte rechazado - Diferencias visuales y de texto detectadas'
        else:
            results['overall_status'] = 'REVIEW_REQUIRED'
            if not visual_ok:
                results['overall_message'] = '⚠️ Requiere revisión - Diferencias visuales detectadas'
            else:
                results['overall_message'] = '⚠️ Requiere revisión - Diferencias de texto detectadas'

        # 5. Generar resumen ejecutivo
        results['summary'] = generate_executive_summary(results)

        print(f"✅ Comparación completada: {results['overall_status']}")
        return results

    except Exception as e:
        results['overall_status'] = 'ERROR'
        results['overall_message'] = f'Error al procesar: {str(e)}'
        print(f"❌ Error: {str(e)}")
        return results


def generate_executive_summary(results):
    """Genera un resumen ejecutivo de la comparación"""
    summary = {
        'status': results['overall_status'],
        'total_issues': 0,
        'critical_issues': 0,
        'issues_by_category': {}
    }

    # Contar diferencias visuales
    if results['visual_comparison']:
        visual_diffs = results['visual_comparison']['total_differences_found']
        summary['issues_by_category']['visual'] = visual_diffs
        summary['total_issues'] += visual_diffs

    # Contar diferencias de texto
    if results['text_comparison']:
        text_diffs = results['text_comparison']['comparison']['total_differences']
        summary['issues_by_category']['text'] = text_diffs
        summary['total_issues'] += text_diffs

        # Contar errores críticos
        common_errors = results['text_comparison']['comparison'].get('common_errors', [])
        critical = [e for e in common_errors if e['severity'] == 'CRITICAL']
        summary['critical_issues'] = len(critical)

    return summary


@app.route('/api/results/<comparison_id>')
def get_results(comparison_id):
    """Obtiene los resultados de una comparación específica"""
    try:
        results_file = os.path.join(app.config['UPLOAD_FOLDER'], 'results', f'{comparison_id}_results.json')

        if not os.path.exists(results_file):
            return jsonify({'error': 'Comparación no encontrada'}), 404

        with open(results_file, 'r') as f:
            results = json.load(f)

        return jsonify(results)

    except Exception as e:
        return jsonify({'error': str(e)}), 500


@app.route('/api/results/<comparison_id>/image')
def get_comparison_image(comparison_id):
    """Descarga la imagen comparativa"""
    try:
        image_path = os.path.join(app.config['UPLOAD_FOLDER'], 'results', f'{comparison_id}_comparison.png')

        if not os.path.exists(image_path):
            return jsonify({'error': 'Imagen no encontrada'}), 404

        return send_file(image_path, mimetype='image/png')

    except Exception as e:
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    print("🚀 Iniciando Artwork AI Verifier API...")
    print(f"📁 Carpeta de uploads: {app.config['UPLOAD_FOLDER']}")
    print(f"🔧 Extensiones permitidas: {ALLOWED_EXTENSIONS}")
    print(f"📊 DPI de procesamiento: {pdf_processor.dpi}")
    print(f"🎯 Umbral de similitud: {image_comparator.similarity_threshold}")
    print(f"🌐 Idiomas OCR: {ocr_engine.lang}")
    print("\n✅ API lista en http://localhost:5000\n")

    app.run(debug=True, host='0.0.0.0', port=5000)
