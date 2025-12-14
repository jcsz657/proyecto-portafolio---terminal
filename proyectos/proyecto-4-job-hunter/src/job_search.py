#!/usr/bin/env python3
"""
Job Hunter - Buscador automático de empleos
Busca ofertas de trabajo en Get on Board y Remotive según tu perfil
"""

import json
import sqlite3
import logging
import requests
from datetime import datetime
from pathlib import Path
from telegram_notifier import TelegramNotifier

# Configuración de rutas
BASE_DIR = Path(__file__).parent.parent
CONFIG_DIR = BASE_DIR / "config"
DATA_DIR = BASE_DIR / "data"
LOG_DIR = BASE_DIR / "logs"

# Configuración de logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler(LOG_DIR / "search.log"),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)


class JobHunter:
    """Buscador de empleos en múltiples plataformas"""

    def __init__(self):
        """Inicializa el buscador con la configuración del perfil"""
        self.config = self.cargar_configuracion()
        self.db_path = DATA_DIR / "jobs.db"
        self.inicializar_base_datos()

        # Inicializar notificador de Telegram
        telegram_config = self.config.get('telegram', {})
        if telegram_config.get('activo', False):
            self.telegram = TelegramNotifier(
                bot_token=telegram_config.get('bot_token'),
                chat_id=telegram_config.get('chat_id')
            )
        else:
            self.telegram = None

        # Contador de ofertas nuevas
        self.ofertas_nuevas = {
            'Get on Board': 0,
            'Remotive': 0,
            'Jooble': 0
        }

    def cargar_configuracion(self):
        """Carga el perfil y preferencias desde profile.json"""
        config_path = CONFIG_DIR / "profile.json"
        with open(config_path, 'r', encoding='utf-8') as f:
            return json.load(f)

    def inicializar_base_datos(self):
        """Crea la base de datos SQLite si no existe"""
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()

        cursor.execute('''
            CREATE TABLE IF NOT EXISTS jobs (
                id TEXT PRIMARY KEY,
                titulo TEXT NOT NULL,
                empresa TEXT,
                url TEXT,
                fuente TEXT,
                categoria TEXT,
                modalidad TEXT,
                ubicacion TEXT,
                salario TEXT,
                descripcion TEXT,
                fecha_publicacion TEXT,
                fecha_encontrado TEXT,
                keywords_match TEXT
            )
        ''')

        conn.commit()
        conn.close()
        logger.info("Base de datos inicializada correctamente")

    def job_existe(self, job_id):
        """Verifica si un trabajo ya está en la base de datos"""
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()
        cursor.execute('SELECT id FROM jobs WHERE id = ?', (job_id,))
        existe = cursor.fetchone() is not None
        conn.close()
        return existe

    def buscar_en_getonboard(self):
        """Busca empleos en Get on Board"""
        endpoint = self.config['apis']['get_on_board']['endpoint']
        keywords = self.config['perfil']['keywords']

        jobs_encontrados = 0
        jobs_guardados = 0

        # Buscar con cada keyword
        for keyword in keywords[:3]:  # Limitamos a las 3 primeras keywords para no saturar
            try:
                params = {
                    'query': keyword,
                    'per_page': 20
                }

                response = requests.get(endpoint, params=params, timeout=10)

                if response.status_code == 200:
                    data = response.json()
                    jobs = data.get('data', [])

                    logger.info(f"Get on Board - '{keyword}': {len(jobs)} ofertas encontradas")

                    for job_data in jobs:
                        jobs_encontrados += 1
                        job = self.parsear_getonboard(job_data, keyword)

                        if self.filtrar_por_perfil(job):
                            if not self.job_existe(job['id']):
                                self.guardar_en_bd(job)
                                jobs_guardados += 1
                                self.ofertas_nuevas['Get on Board'] += 1
                                logger.info(f"✓ Nueva oferta: {job['titulo']} - {job['empresa']}")

                                # Enviar notificación por Telegram
                                if self.telegram and self.config['telegram'].get('notificar_por_oferta', True):
                                    self.telegram.enviar_oferta(job)
                else:
                    logger.warning(f"Error en Get on Board: {response.status_code}")

            except Exception as e:
                logger.error(f"Error buscando '{keyword}' en Get on Board: {e}")

        logger.info(f"Get on Board: {jobs_encontrados} encontrados, {jobs_guardados} guardados")

    def parsear_getonboard(self, job_data, keyword):
        """Parsea los datos de un trabajo de Get on Board"""
        attrs = job_data.get('attributes', {})

        # Determinar modalidad
        if attrs.get('remote'):
            if attrs.get('remote_modality') == 'fully_remote':
                modalidad = 'remota'
            else:
                modalidad = 'híbrida'
        else:
            modalidad = 'presencial'

        # Ubicación
        countries = attrs.get('countries', [])
        ubicacion = ', '.join(countries) if countries else 'No especificado'

        # Salario
        min_sal = attrs.get('min_salary')
        max_sal = attrs.get('max_salary')
        if min_sal and max_sal:
            salario = f"${min_sal} - ${max_sal}"
        elif min_sal:
            salario = f"Desde ${min_sal}"
        else:
            salario = "No especificado"

        return {
            'id': f"gob_{job_data.get('id')}",
            'titulo': attrs.get('title', 'Sin título'),
            'empresa': 'Ver en Get on Board',  # Requiere parsear el objeto company
            'url': f"https://www.getonbrd.com/jobs/{job_data.get('id')}",
            'fuente': 'Get on Board',
            'categoria': attrs.get('category_name', 'Sin categoría'),
            'modalidad': modalidad,
            'ubicacion': ubicacion,
            'salario': salario,
            'descripcion': attrs.get('description_headline', '')[:500],
            'fecha_publicacion': str(attrs.get('published_at', '')),
            'keywords_match': keyword
        }

    def buscar_en_remotive(self):
        """Busca empleos en Remotive"""
        endpoint = self.config['apis']['remotive']['endpoint']

        jobs_encontrados = 0
        jobs_guardados = 0

        try:
            # Remotive recomienda no hacer muchas búsquedas específicas
            # Obtenemos todos y filtramos localmente
            params = {'limit': 50}

            response = requests.get(endpoint, params=params, timeout=10)

            if response.status_code == 200:
                data = response.json()
                jobs = data.get('jobs', [])

                logger.info(f"Remotive: {len(jobs)} ofertas obtenidas")

                for job_data in jobs:
                    jobs_encontrados += 1

                    # Verificar si el título o descripción contiene alguna keyword
                    titulo = job_data.get('title', '').lower()
                    descripcion = job_data.get('description', '').lower()

                    keyword_match = None
                    for keyword in self.config['perfil']['keywords']:
                        if keyword.lower() in titulo or keyword.lower() in descripcion:
                            keyword_match = keyword
                            break

                    if keyword_match:
                        job = self.parsear_remotive(job_data, keyword_match)

                        if self.filtrar_por_perfil(job):
                            if not self.job_existe(job['id']):
                                self.guardar_en_bd(job)
                                jobs_guardados += 1
                                self.ofertas_nuevas['Remotive'] += 1
                                logger.info(f"✓ Nueva oferta: {job['titulo']} - {job['empresa']}")

                                # Enviar notificación por Telegram
                                if self.telegram and self.config['telegram'].get('notificar_por_oferta', True):
                                    self.telegram.enviar_oferta(job)
            else:
                logger.warning(f"Error en Remotive: {response.status_code}")

        except Exception as e:
            logger.error(f"Error buscando en Remotive: {e}")

        logger.info(f"Remotive: {jobs_encontrados} encontrados, {jobs_guardados} guardados")

    def parsear_remotive(self, job_data, keyword):
        """Parsea los datos de un trabajo de Remotive"""
        return {
            'id': f"rem_{job_data.get('id')}",
            'titulo': job_data.get('title', 'Sin título'),
            'empresa': job_data.get('company_name', 'No especificado'),
            'url': job_data.get('url', ''),
            'fuente': 'Remotive',
            'categoria': job_data.get('category', 'Sin categoría'),
            'modalidad': 'remota',  # Remotive es solo trabajos remotos
            'ubicacion': job_data.get('candidate_required_location', 'Worldwide'),
            'salario': job_data.get('salary', 'No especificado'),
            'descripcion': job_data.get('description', '')[:500],
            'fecha_publicacion': job_data.get('publication_date', ''),
            'keywords_match': keyword
        }

    def buscar_en_jooble(self):
        """Busca empleos en Jooble (elempleo, Computrabajo, etc.)"""
        jooble_config = self.config['apis']['jooble']
        endpoint = jooble_config['endpoint']
        api_key = jooble_config.get('api_key')

        if api_key == "YOUR_JOOBLE_API_KEY_HERE":
            logger.warning("Jooble API key no configurado, saltando búsqueda")
            return

        jobs_encontrados = 0
        jobs_guardados = 0

        # Buscar con las primeras 3 keywords junior
        keywords = self.config['perfil']['keywords'][:3]

        for keyword in keywords:
            try:
                # Preparar la petición
                url = f"{endpoint}/{api_key}"
                payload = {
                    'keywords': keyword,
                    'location': jooble_config['location'],
                    'page': '1',
                    'ResultOnPage': str(jooble_config.get('results_per_page', 20))
                }

                response = requests.post(url, json=payload, timeout=10)

                if response.status_code == 200:
                    data = response.json()
                    jobs = data.get('jobs', [])
                    total = data.get('totalCount', 0)

                    logger.info(f"Jooble - '{keyword}': {len(jobs)} ofertas encontradas (total: {total})")

                    for job_data in jobs:
                        jobs_encontrados += 1
                        job = self.parsear_jooble(job_data, keyword)

                        if self.filtrar_por_perfil(job):
                            if not self.job_existe(job['id']):
                                self.guardar_en_bd(job)
                                jobs_guardados += 1
                                self.ofertas_nuevas['Jooble'] += 1
                                logger.info(f"✓ Nueva oferta: {job['titulo']} - {job['empresa']}")

                                # Enviar notificación por Telegram
                                if self.telegram and self.config['telegram'].get('notificar_por_oferta', True):
                                    self.telegram.enviar_oferta(job)
                elif response.status_code == 403:
                    logger.error("Jooble: API key inválido (403)")
                    break
                else:
                    logger.warning(f"Error en Jooble: {response.status_code}")

            except Exception as e:
                logger.error(f"Error buscando '{keyword}' en Jooble: {e}")

        logger.info(f"Jooble: {jobs_encontrados} encontrados, {jobs_guardados} guardados")

    def parsear_jooble(self, job_data, keyword):
        """Parsea los datos de un trabajo de Jooble"""
        # Determinar modalidad basada en el título o descripción
        titulo_lower = job_data.get('title', '').lower()
        snippet_lower = job_data.get('snippet', '').lower()
        texto = f"{titulo_lower} {snippet_lower}"

        if any(word in texto for word in ['remote', 'remoto', 'teletrabajo', 'home office', 'work from home']):
            modalidad = 'remota'
        elif any(word in texto for word in ['híbrido', 'hybrid', 'hibrido']):
            modalidad = 'híbrida'
        else:
            modalidad = 'presencial'

        return {
            'id': f"job_{job_data.get('id', hash(job_data.get('link', '')))}",
            'titulo': job_data.get('title', 'Sin título'),
            'empresa': job_data.get('company', 'No especificado'),
            'url': job_data.get('link', ''),
            'fuente': f"Jooble ({job_data.get('source', 'Agregador')})",
            'categoria': job_data.get('type', 'Sin categoría'),
            'modalidad': modalidad,
            'ubicacion': job_data.get('location', 'Colombia'),
            'salario': job_data.get('salary', 'No especificado'),
            'descripcion': job_data.get('snippet', '')[:500],
            'fecha_publicacion': job_data.get('updated', ''),
            'keywords_match': keyword
        }

    def filtrar_por_perfil(self, job):
        """Filtra un trabajo según las preferencias del perfil"""
        preferencias = self.config['preferencias']
        perfil = self.config['perfil']

        # Filtro 0: EXCLUSIÓN - Títulos senior/lead/etc. (Para posiciones Junior)
        if 'excluir_titulos' in perfil:
            titulo_lower = job['titulo'].lower()
            for palabra_excluir in perfil['excluir_titulos']:
                # Buscar la palabra con espacios alrededor o al final
                palabra_lower = palabra_excluir.lower()
                if (f' {palabra_lower} ' in f' {titulo_lower} ' or
                    titulo_lower.startswith(palabra_lower + ' ') or
                    titulo_lower.endswith(' ' + palabra_lower) or
                    titulo_lower == palabra_lower):
                    logger.debug(f"Excluido por título '{palabra_excluir}': {job['titulo']}")
                    return False

        # Filtro 0b: EXCLUSIÓN - Años de experiencia (Para posiciones Junior)
        if 'experiencia_maxima_anos' in perfil:
            descripcion_lower = job.get('descripcion', '').lower()
            titulo_lower = job['titulo'].lower()
            texto_completo = f"{titulo_lower} {descripcion_lower}"

            # Buscar patrones de años de experiencia
            import re
            # Patrones: "3+ años", "3 años", "3-5 años", "más de 3 años", etc.
            patrones = [
                r'(\d+)\+?\s*(?:años|years|ano)',  # 3+ años, 3 años
                r'más\s+de\s+(\d+)\s+(?:años|years)',  # más de 3 años
                r'more\s+than\s+(\d+)\s+years',  # more than 3 years
                r'(\d+)\s*-\s*\d+\s+(?:años|years)',  # 3-5 años (toma el mínimo)
                r'mínimo\s+(\d+)\s+(?:años|years)',  # mínimo 3 años
                r'minimum\s+(\d+)\s+years',  # minimum 3 years
            ]

            max_experiencia = perfil['experiencia_maxima_anos']
            for patron in patrones:
                matches = re.findall(patron, texto_completo)
                for match in matches:
                    anos_requeridos = int(match)
                    if anos_requeridos > max_experiencia:
                        logger.debug(f"Excluido por experiencia ({anos_requeridos} años > {max_experiencia}): {job['titulo']}")
                        return False

        # Filtro 1: Modalidad (remota o híbrida)
        modalidad_ok = False
        for mod_pref in preferencias['modalidad']:
            if mod_pref.lower() in job['modalidad'].lower():
                modalidad_ok = True
                break

        if not modalidad_ok:
            return False

        # Filtro 2: Ubicación
        ubicacion_ok = False
        ubicacion_lower = job['ubicacion'].lower()
        for ubi_pref in preferencias['ubicaciones']:
            if ubi_pref.lower() in ubicacion_lower or ubicacion_lower in ubi_pref.lower():
                ubicacion_ok = True
                break

        if not ubicacion_ok:
            return False

        # Filtro 3: Idioma (solo para Get on Board, Remotive es mayormente inglés)
        # Este filtro es más complejo y requeriría NLP, por ahora lo omitimos
        # ya que Get on Board tiene muchas ofertas en español

        # Filtro 4: Salario mínimo (cuando esté especificado)
        # Este filtro es complejo porque los salarios vienen en diferentes formatos
        # Lo implementaremos de forma básica

        return True  # Pasa todos los filtros

    def guardar_en_bd(self, job):
        """Guarda un trabajo en la base de datos"""
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()

        cursor.execute('''
            INSERT INTO jobs (
                id, titulo, empresa, url, fuente, categoria, modalidad,
                ubicacion, salario, descripcion, fecha_publicacion,
                fecha_encontrado, keywords_match
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', (
            job['id'],
            job['titulo'],
            job['empresa'],
            job['url'],
            job['fuente'],
            job['categoria'],
            job['modalidad'],
            job['ubicacion'],
            job['salario'],
            job['descripcion'],
            job['fecha_publicacion'],
            datetime.now().isoformat(),
            job['keywords_match']
        ))

        conn.commit()
        conn.close()

    def mostrar_resumen(self):
        """Muestra un resumen de los trabajos guardados"""
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()

        # Total de trabajos
        cursor.execute('SELECT COUNT(*) FROM jobs')
        total = cursor.fetchone()[0]

        # Por fuente
        cursor.execute('SELECT fuente, COUNT(*) FROM jobs GROUP BY fuente')
        por_fuente = cursor.fetchall()

        # Últimos 5 trabajos
        cursor.execute('''
            SELECT titulo, empresa, fuente, modalidad, url
            FROM jobs
            ORDER BY fecha_encontrado DESC
            LIMIT 5
        ''')
        ultimos = cursor.fetchall()

        conn.close()

        logger.info("\n" + "="*60)
        logger.info("RESUMEN DE BÚSQUEDA")
        logger.info("="*60)
        logger.info(f"Total de ofertas guardadas: {total}")
        logger.info("\nPor fuente:")
        for fuente, count in por_fuente:
            logger.info(f"  - {fuente}: {count}")

        if ultimos:
            logger.info("\nÚltimas ofertas encontradas:")
            for i, (titulo, empresa, fuente, modalidad, url) in enumerate(ultimos, 1):
                logger.info(f"\n{i}. {titulo}")
                logger.info(f"   Empresa: {empresa}")
                logger.info(f"   Fuente: {fuente} | Modalidad: {modalidad}")
                logger.info(f"   URL: {url}")

        logger.info("\n" + "="*60)

    def ejecutar_busqueda(self):
        """Ejecuta la búsqueda completa en todas las APIs"""
        logger.info("=== Iniciando búsqueda de empleos ===")
        logger.info(f"Perfil: {self.config['perfil']['profesion_objetivo']}")
        logger.info(f"Keywords: {', '.join(self.config['perfil']['keywords'][:5])}")

        # Notificar inicio por Telegram
        if self.telegram:
            self.telegram.enviar_inicio()

        try:
            # Buscar en Get on Board
            if self.config['apis']['get_on_board']['activa']:
                logger.info("\n--- Buscando en Get on Board ---")
                self.buscar_en_getonboard()

            # Buscar en Remotive
            if self.config['apis']['remotive']['activa']:
                logger.info("\n--- Buscando en Remotive ---")
                self.buscar_en_remotive()

            # Buscar en Jooble
            if self.config['apis']['jooble']['activa']:
                logger.info("\n--- Buscando en Jooble ---")
                self.buscar_en_jooble()

            # Mostrar resumen
            self.mostrar_resumen()

            # Enviar resumen por Telegram
            if self.telegram and self.config['telegram'].get('notificar_resumen', True):
                total_nuevas = sum(self.ofertas_nuevas.values())
                if total_nuevas > 0:
                    self.telegram.enviar_resumen(total_nuevas, self.ofertas_nuevas)

        except Exception as e:
            logger.error(f"Error durante la búsqueda: {e}")


def main():
    """Función principal"""
    hunter = JobHunter()
    hunter.ejecutar_busqueda()


if __name__ == "__main__":
    main()
