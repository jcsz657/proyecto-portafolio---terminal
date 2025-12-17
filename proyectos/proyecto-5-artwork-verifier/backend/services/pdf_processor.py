"""
PDF Processor - Convierte PDFs a imágenes para procesamiento
"""
from pdf2image import convert_from_path
from PIL import Image
import os
from typing import List, Optional


class PDFProcessor:
    """Procesa archivos PDF y los convierte a imágenes"""

    def __init__(self, dpi: int = 300):
        """
        Inicializa el procesador de PDFs

        Args:
            dpi: Resolución de conversión (300 DPI es estándar para impresión)
        """
        self.dpi = dpi

    def pdf_to_images(self, pdf_path: str, output_folder: str) -> List[str]:
        """
        Convierte un PDF a imágenes PNG

        Args:
            pdf_path: Ruta al archivo PDF
            output_folder: Carpeta donde guardar las imágenes

        Returns:
            Lista de rutas a las imágenes generadas
        """
        try:
            # Verificar que el archivo existe
            if not os.path.exists(pdf_path):
                raise FileNotFoundError(f"PDF no encontrado: {pdf_path}")

            # Crear carpeta de salida si no existe
            os.makedirs(output_folder, exist_ok=True)

            # Convertir PDF a imágenes
            images = convert_from_path(pdf_path, dpi=self.dpi)

            image_paths = []
            base_name = os.path.splitext(os.path.basename(pdf_path))[0]

            # Guardar cada página como PNG
            for i, image in enumerate(images):
                output_path = os.path.join(output_folder, f"{base_name}_page_{i+1}.png")
                image.save(output_path, 'PNG')
                image_paths.append(output_path)
                print(f"✅ Página {i+1} convertida: {output_path}")

            return image_paths

        except Exception as e:
            raise Exception(f"Error al convertir PDF: {str(e)}")

    def is_pdf(self, file_path: str) -> bool:
        """Verifica si un archivo es PDF"""
        return file_path.lower().endswith('.pdf')

    def get_page_count(self, pdf_path: str) -> int:
        """Obtiene el número de páginas de un PDF"""
        try:
            images = convert_from_path(pdf_path, dpi=72)  # Baja resolución solo para contar
            return len(images)
        except Exception as e:
            raise Exception(f"Error al leer PDF: {str(e)}")


if __name__ == "__main__":
    # Test del procesador
    processor = PDFProcessor(dpi=300)
    print("PDF Processor inicializado correctamente")
    print(f"DPI configurado: {processor.dpi}")
