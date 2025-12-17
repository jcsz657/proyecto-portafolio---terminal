"""
OCR Engine - Extrae texto de imágenes y compara contenido
"""
import pytesseract
from PIL import Image
import difflib
from typing import List, Dict, Tuple
import re


class OCREngine:
    """Extrae y compara texto de imágenes usando Tesseract OCR"""

    def __init__(self, lang: str = 'eng+spa'):
        """
        Inicializa el motor OCR

        Args:
            lang: Idiomas a reconocer (ej: 'eng', 'spa', 'eng+spa')
        """
        self.lang = lang

    def extract_text(self, image_path: str) -> str:
        """
        Extrae todo el texto de una imagen

        Args:
            image_path: Ruta a la imagen

        Returns:
            Texto extraído
        """
        try:
            image = Image.open(image_path)
            text = pytesseract.image_to_string(image, lang=self.lang)
            return text.strip()
        except Exception as e:
            raise Exception(f"Error al extraer texto: {str(e)}")

    def extract_text_with_confidence(self, image_path: str) -> Dict:
        """
        Extrae texto con información de confianza

        Args:
            image_path: Ruta a la imagen

        Returns:
            Diccionario con texto y confianza promedio
        """
        try:
            image = Image.open(image_path)
            data = pytesseract.image_to_data(image, lang=self.lang, output_type=pytesseract.Output.DICT)

            # Calcular confianza promedio (excluir -1 que indica sin texto)
            confidences = [int(conf) for conf in data['conf'] if int(conf) != -1]
            avg_confidence = sum(confidences) / len(confidences) if confidences else 0

            text = pytesseract.image_to_string(image, lang=self.lang)

            return {
                'text': text.strip(),
                'confidence': avg_confidence,
                'word_count': len([w for w in data['text'] if w.strip()])
            }
        except Exception as e:
            raise Exception(f"Error al extraer texto con confianza: {str(e)}")

    def compare_text(self, text1: str, text2: str) -> Dict:
        """
        Compara dos textos y encuentra diferencias

        Args:
            text1: Texto master (aprobado)
            text2: Texto del proveedor

        Returns:
            Diccionario con análisis de diferencias
        """
        # Normalizar textos (quitar espacios extra, etc.)
        text1_clean = ' '.join(text1.split())
        text2_clean = ' '.join(text2.split())

        # Calcular similitud
        similarity = difflib.SequenceMatcher(None, text1_clean, text2_clean).ratio()

        # Encontrar diferencias línea por línea
        lines1 = text1.split('\n')
        lines2 = text2.split('\n')

        diff = list(difflib.unified_diff(lines1, lines2, lineterm=''))

        # Clasificar diferencias
        additions = [line[1:] for line in diff if line.startswith('+') and not line.startswith('+++')]
        deletions = [line[1:] for line in diff if line.startswith('-') and not line.startswith('---')]

        # Buscar errores específicos comunes
        errors = self._detect_common_errors(text1_clean, text2_clean)

        result = {
            'similarity': similarity,
            'is_identical': similarity >= 0.98,
            'total_differences': len(additions) + len(deletions),
            'additions': additions,
            'deletions': deletions,
            'common_errors': errors,
            'status': 'MATCH' if similarity >= 0.98 else 'MISMATCH',
            'message': self._get_text_status_message(similarity, len(additions), len(deletions))
        }

        return result

    def _detect_common_errors(self, text1: str, text2: str) -> List[Dict]:
        """Detecta errores comunes en etiquetado"""
        errors = []

        # Error 1: Puntos decimales desplazados
        decimal_pattern = r'\d+\.\d+'
        decimals1 = re.findall(decimal_pattern, text1)
        decimals2 = re.findall(decimal_pattern, text2)

        if decimals1 != decimals2:
            errors.append({
                'type': 'DECIMAL_MISMATCH',
                'severity': 'HIGH',
                'message': f'Diferencia en números decimales: {decimals1} vs {decimals2}'
            })

        # Error 2: Duplicación de palabras (ej: "Do not not")
        duplicate_pattern = r'\b(\w+)\s+\1\b'
        duplicates2 = re.findall(duplicate_pattern, text2, re.IGNORECASE)

        if duplicates2:
            errors.append({
                'type': 'WORD_DUPLICATION',
                'severity': 'MEDIUM',
                'message': f'Palabras duplicadas encontradas: {duplicates2}'
            })

        # Error 3: Fechas de vencimiento
        date_pattern = r'\d{2}/\d{2}/\d{4}|\d{4}-\d{2}-\d{2}'
        dates1 = re.findall(date_pattern, text1)
        dates2 = re.findall(date_pattern, text2)

        if dates1 != dates2:
            errors.append({
                'type': 'DATE_MISMATCH',
                'severity': 'CRITICAL',
                'message': f'Fechas diferentes: {dates1} vs {dates2}'
            })

        # Error 4: Alérgenos comunes
        allergens = ['milk', 'egg', 'peanut', 'tree nut', 'soy', 'wheat', 'fish', 'shellfish',
                     'leche', 'huevo', 'maní', 'nuez', 'soya', 'trigo', 'pescado', 'marisco']

        text1_lower = text1.lower()
        text2_lower = text2.lower()

        allergens1 = [a for a in allergens if a in text1_lower]
        allergens2 = [a for a in allergens if a in text2_lower]

        if set(allergens1) != set(allergens2):
            errors.append({
                'type': 'ALLERGEN_MISMATCH',
                'severity': 'CRITICAL',
                'message': f'Diferencia en declaración de alérgenos: {allergens1} vs {allergens2}'
            })

        return errors

    def _get_text_status_message(self, similarity: float, additions: int, deletions: int) -> str:
        """Genera mensaje descriptivo del resultado textual"""
        if similarity >= 0.99:
            return "✅ Texto idéntico"
        elif similarity >= 0.98:
            return "✅ Texto coincide (diferencias mínimas de formato)"
        elif similarity >= 0.90:
            return f"⚠️ Revisar - {additions} líneas agregadas, {deletions} líneas eliminadas"
        else:
            return f"❌ Rechazado - Diferencias significativas de texto detectadas"

    def extract_key_info(self, text: str) -> Dict:
        """
        Extrae información clave de la etiqueta

        Args:
            text: Texto extraído

        Returns:
            Diccionario con información estructurada
        """
        info = {
            'dates': re.findall(r'\d{2}/\d{2}/\d{4}|\d{4}-\d{2}-\d{2}', text),
            'batch_numbers': re.findall(r'Lote:?\s*([A-Z0-9\-]+)', text, re.IGNORECASE),
            'expiry_dates': re.findall(r'Exp:?\s*(\d{2}/\d{2}/\d{4})', text, re.IGNORECASE),
            'barcodes': re.findall(r'\d{12,13}', text),  # EAN/UPC
            'percentages': re.findall(r'\d+\.?\d*%', text),
            'weights': re.findall(r'\d+\.?\d*\s*(g|kg|mg|ml|l|oz|lb)', text, re.IGNORECASE)
        }

        return info


if __name__ == "__main__":
    # Test del OCR Engine
    ocr = OCREngine(lang='eng+spa')
    print("OCR Engine inicializado correctamente")
    print(f"Idiomas configurados: {ocr.lang}")
