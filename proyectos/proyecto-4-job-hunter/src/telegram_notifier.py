#!/usr/bin/env python3
"""
Telegram Notifier - Envía notificaciones de nuevas ofertas de empleo
"""

import requests
import logging

logger = logging.getLogger(__name__)


class TelegramNotifier:
    """Clase para enviar notificaciones por Telegram"""

    def __init__(self, bot_token=None, chat_id=None):
        """
        Inicializa el notificador de Telegram

        Args:
            bot_token: Token del bot de Telegram
            chat_id: ID del chat donde enviar mensajes
        """
        self.bot_token = bot_token or "YOUR_BOT_TOKEN_HERE"
        self.chat_id = chat_id or "YOUR_CHAT_ID_HERE"
        self.api_url = f"https://api.telegram.org/bot{self.bot_token}/sendMessage"
        self.activo = bot_token and chat_id and bot_token != "YOUR_BOT_TOKEN_HERE"

    def formatear_mensaje(self, job):
        """
        Formatea un trabajo como mensaje de Telegram

        Args:
            job: Diccionario con información del trabajo

        Returns:
            Mensaje formateado en Markdown
        """
        # Emoji según la modalidad
        emoji_modalidad = {
            'remota': '🏠',
            'híbrida': '🏢',
            'presencial': '🏛️'
        }

        emoji = emoji_modalidad.get(job.get('modalidad', '').lower(), '💼')

        mensaje = f"🎯 *Nueva Oferta de Empleo*\n\n"
        mensaje += f"*{job['titulo']}*\n"
        mensaje += f"🏢 *Empresa:* {job['empresa']}\n"
        mensaje += f"{emoji} *Modalidad:* {job['modalidad'].capitalize()}\n"

        if job.get('ubicacion'):
            mensaje += f"📍 *Ubicación:* {job['ubicacion']}\n"

        if job.get('salario') and job['salario'] != 'No especificado':
            mensaje += f"💰 *Salario:* {job['salario']}\n"

        if job.get('categoria'):
            mensaje += f"📂 *Categoría:* {job['categoria']}\n"

        mensaje += f"🔍 *Fuente:* {job['fuente']}\n"
        mensaje += f"\n🔗 [Aplicar aquí]({job['url']})"

        return mensaje

    def enviar_oferta(self, job):
        """
        Envía una notificación de una oferta individual

        Args:
            job: Diccionario con información del trabajo

        Returns:
            bool: True si se envió correctamente, False en caso contrario
        """
        if not self.activo:
            logger.debug("Telegram no configurado, saltando notificación")
            return False

        try:
            mensaje = self.formatear_mensaje(job)

            payload = {
                'chat_id': self.chat_id,
                'text': mensaje,
                'parse_mode': 'Markdown',
                'disable_web_page_preview': False
            }

            response = requests.post(self.api_url, json=payload, timeout=10)

            if response.status_code == 200:
                logger.info(f"✓ Notificación enviada: {job['titulo']}")
                return True
            else:
                logger.error(f"Error enviando a Telegram: {response.status_code} - {response.text}")
                return False

        except Exception as e:
            logger.error(f"Error enviando notificación de Telegram: {e}")
            return False

    def enviar_resumen(self, total_nuevas, fuentes):
        """
        Envía un resumen de la búsqueda

        Args:
            total_nuevas: Número total de ofertas nuevas encontradas
            fuentes: Diccionario con el conteo por fuente

        Returns:
            bool: True si se envió correctamente, False en caso contrario
        """
        if not self.activo or total_nuevas == 0:
            return False

        try:
            mensaje = "📊 *Resumen de Búsqueda*\n\n"
            mensaje += f"Se encontraron *{total_nuevas}* nuevas ofertas:\n\n"

            for fuente, count in fuentes.items():
                if count > 0:
                    mensaje += f"• {fuente}: {count}\n"

            payload = {
                'chat_id': self.chat_id,
                'text': mensaje,
                'parse_mode': 'Markdown'
            }

            response = requests.post(self.api_url, json=payload, timeout=10)

            if response.status_code == 200:
                logger.info("✓ Resumen enviado a Telegram")
                return True
            else:
                logger.error(f"Error enviando resumen: {response.status_code}")
                return False

        except Exception as e:
            logger.error(f"Error enviando resumen: {e}")
            return False

    def enviar_inicio(self):
        """
        Envía un mensaje de inicio de búsqueda

        Returns:
            bool: True si se envió correctamente, False en caso contrario
        """
        if not self.activo:
            return False

        try:
            mensaje = "🔍 *Iniciando búsqueda de empleos...*\n\n"
            mensaje += "Te notificaré cuando encuentre nuevas ofertas que coincidan con tu perfil."

            payload = {
                'chat_id': self.chat_id,
                'text': mensaje,
                'parse_mode': 'Markdown'
            }

            response = requests.post(self.api_url, json=payload, timeout=10)
            return response.status_code == 200

        except Exception as e:
            logger.error(f"Error enviando mensaje de inicio: {e}")
            return False

    def test_conexion(self):
        """
        Prueba la conexión con Telegram

        Returns:
            bool: True si la conexión es exitosa, False en caso contrario
        """
        if not self.activo:
            print("❌ Telegram no está configurado")
            print(f"   Bot Token: {self.bot_token}")
            print(f"   Chat ID: {self.chat_id}")
            return False

        try:
            mensaje = "✅ *Test de conexión exitoso*\n\nEl bot de Job Hunter está funcionando correctamente."

            payload = {
                'chat_id': self.chat_id,
                'text': mensaje,
                'parse_mode': 'Markdown'
            }

            response = requests.post(self.api_url, json=payload, timeout=10)

            if response.status_code == 200:
                print("✅ Conexión exitosa con Telegram")
                return True
            else:
                print(f"❌ Error: {response.status_code} - {response.text}")
                return False

        except Exception as e:
            print(f"❌ Error de conexión: {e}")
            return False


# Script de prueba
if __name__ == "__main__":
    print("=== Test de Telegram Notifier ===\n")

    # Crear notificador con valores de prueba
    notifier = TelegramNotifier()

    # Probar conexión
    notifier.test_conexion()

    # Ejemplo de oferta
    job_ejemplo = {
        'id': 'test_123',
        'titulo': 'Data Analyst Senior',
        'empresa': 'Tech Company Inc.',
        'modalidad': 'remota',
        'ubicacion': 'Colombia, Remote',
        'salario': '$3,000 - $4,500 USD',
        'categoria': 'Data Science / Analytics',
        'fuente': 'Get on Board',
        'url': 'https://www.getonbrd.com/jobs/test-123'
    }

    print("\nFormato de mensaje:")
    print("-" * 50)
    print(notifier.formatear_mensaje(job_ejemplo))
