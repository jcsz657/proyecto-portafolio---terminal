"""
Image Comparator - Compara dos imágenes y detecta diferencias visuales
"""
import cv2
import numpy as np
from skimage.metrics import structural_similarity as ssim
from PIL import Image
from typing import Tuple, Dict, Optional


class ImageComparator:
    """Compara dos imágenes y detecta diferencias visuales"""

    def __init__(self, similarity_threshold: float = 0.95):
        """
        Inicializa el comparador de imágenes

        Args:
            similarity_threshold: Umbral de similitud (0-1).
                                 1.0 = idénticas, 0.0 = completamente diferentes
        """
        self.similarity_threshold = similarity_threshold

    def compare_images(self, image1_path: str, image2_path: str) -> Dict:
        """
        Compara dos imágenes y devuelve un reporte detallado

        Args:
            image1_path: Ruta a la imagen master (aprobada)
            image2_path: Ruta a la imagen del proveedor

        Returns:
            Diccionario con resultados de la comparación
        """
        try:
            # Cargar imágenes
            img1 = cv2.imread(image1_path)
            img2 = cv2.imread(image2_path)

            if img1 is None or img2 is None:
                raise ValueError("No se pudieron cargar las imágenes")

            # Convertir a escala de grises para SSIM
            gray1 = cv2.cvtColor(img1, cv2.COLOR_BGR2GRAY)
            gray2 = cv2.cvtColor(img2, cv2.COLOR_BGR2GRAY)

            # Asegurar que ambas imágenes tengan el mismo tamaño
            if gray1.shape != gray2.shape:
                gray2 = cv2.resize(gray2, (gray1.shape[1], gray1.shape[0]))
                img2 = cv2.resize(img2, (img1.shape[1], img1.shape[0]))

            # Calcular SSIM (Structural Similarity Index)
            similarity_score, diff_image = ssim(gray1, gray2, full=True)
            diff_image = (diff_image * 255).astype("uint8")

            # Calcular diferencia pixel-by-pixel
            diff_pixels = cv2.absdiff(img1, img2)

            # Encontrar contornos de las diferencias
            thresh = cv2.threshold(diff_image, 0, 255, cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
            contours, _ = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

            # Crear imagen con diferencias marcadas
            marked_image = img2.copy()
            difference_areas = []

            for contour in contours:
                area = cv2.contourArea(contour)
                if area > 40:  # Filtrar diferencias muy pequeñas (ruido)
                    x, y, w, h = cv2.boundingRect(contour)
                    cv2.rectangle(marked_image, (x, y), (x + w, y + h), (0, 0, 255), 2)
                    difference_areas.append({
                        'x': int(x),
                        'y': int(y),
                        'width': int(w),
                        'height': int(h),
                        'area': int(area)
                    })

            # Calcular estadísticas
            total_pixels = gray1.shape[0] * gray1.shape[1]
            different_pixels = np.count_nonzero(diff_pixels)
            difference_percentage = (different_pixels / total_pixels) * 100

            result = {
                'similarity_score': float(similarity_score),
                'is_identical': similarity_score >= self.similarity_threshold,
                'difference_percentage': float(difference_percentage),
                'total_differences_found': len(difference_areas),
                'difference_areas': difference_areas,
                'status': 'APPROVED' if similarity_score >= self.similarity_threshold else 'REJECTED',
                'message': self._get_status_message(similarity_score, len(difference_areas))
            }

            return result, marked_image, diff_image

        except Exception as e:
            raise Exception(f"Error al comparar imágenes: {str(e)}")

    def _get_status_message(self, similarity: float, diff_count: int) -> str:
        """Genera mensaje descriptivo del resultado"""
        if similarity >= 0.99:
            return "✅ Imágenes prácticamente idénticas"
        elif similarity >= self.similarity_threshold:
            return f"✅ Aprobado - Similitud aceptable ({diff_count} diferencias menores detectadas)"
        elif similarity >= 0.90:
            return f"⚠️ Revisar - {diff_count} diferencias detectadas"
        else:
            return f"❌ Rechazado - {diff_count} diferencias significativas encontradas"

    def create_comparison_report(self, master_path: str, supplier_path: str,
                                 output_path: str) -> Dict:
        """
        Crea un reporte visual comparando las imágenes lado a lado

        Args:
            master_path: Imagen master
            supplier_path: Imagen del proveedor
            output_path: Donde guardar el reporte visual

        Returns:
            Diccionario con resultados
        """
        result, marked_image, diff_image = self.compare_images(master_path, supplier_path)

        # Cargar imágenes originales
        master = cv2.imread(master_path)
        supplier = cv2.imread(supplier_path)

        # Redimensionar si es necesario
        if supplier.shape != master.shape:
            supplier = cv2.resize(supplier, (master.shape[1], master.shape[0]))
            marked_image = cv2.resize(marked_image, (master.shape[1], master.shape[0]))

        # Crear imagen comparativa (lado a lado)
        h, w = master.shape[:2]
        comparison = np.zeros((h, w * 3, 3), dtype=np.uint8)

        comparison[:, 0:w] = master
        comparison[:, w:w*2] = supplier
        comparison[:, w*2:w*3] = marked_image

        # Agregar etiquetas
        font = cv2.FONT_HERSHEY_SIMPLEX
        cv2.putText(comparison, 'MASTER', (10, 30), font, 1, (0, 255, 0), 2)
        cv2.putText(comparison, 'SUPPLIER', (w + 10, 30), font, 1, (255, 255, 0), 2)
        cv2.putText(comparison, 'DIFFERENCES', (w*2 + 10, 30), font, 1, (0, 0, 255), 2)

        # Guardar imagen comparativa
        cv2.imwrite(output_path, comparison)
        result['comparison_image_path'] = output_path

        return result


if __name__ == "__main__":
    # Test del comparador
    comparator = ImageComparator(similarity_threshold=0.95)
    print("Image Comparator inicializado correctamente")
    print(f"Umbral de similitud: {comparator.similarity_threshold}")
