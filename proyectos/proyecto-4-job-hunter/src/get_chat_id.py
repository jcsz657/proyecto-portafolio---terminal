#!/usr/bin/env python3
"""
Script para obtener el chat_id de Telegram
Primero envía un mensaje a tu bot en Telegram, luego ejecuta este script
"""

import json
import requests
from pathlib import Path

# Cargar configuración
BASE_DIR = Path(__file__).parent.parent
CONFIG_PATH = BASE_DIR / "config" / "profile.json"

with open(CONFIG_PATH, 'r', encoding='utf-8') as f:
    config = json.load(f)

BOT_TOKEN = config['telegram']['bot_token']

print("=" * 60)
print("OBTENER CHAT_ID DE TELEGRAM")
print("=" * 60)
print()

# Verificar que el token no sea el placeholder
if BOT_TOKEN == "YOUR_BOT_TOKEN_HERE":
    print("❌ Error: Debes configurar tu bot_token primero en config/profile.json")
    exit(1)

print("Bot Token configurado: ✓")
print()
print("📱 INSTRUCCIONES:")
print("1. Abre Telegram en tu teléfono o PC")
print("2. Busca tu bot (el que creaste con @BotFather)")
print("3. Envíale un mensaje (cualquier mensaje, por ejemplo: /start)")
print("4. Luego presiona ENTER aquí para obtener tu chat_id")
print()
input("Presiona ENTER cuando hayas enviado un mensaje al bot...")

# Obtener actualizaciones del bot
url = f"https://api.telegram.org/bot{BOT_TOKEN}/getUpdates"

try:
    response = requests.get(url, timeout=10)

    if response.status_code != 200:
        print(f"\n❌ Error al conectar con Telegram: {response.status_code}")
        print(f"Respuesta: {response.text}")
        exit(1)

    data = response.json()

    if not data.get('ok'):
        print(f"\n❌ Error: {data.get('description', 'Error desconocido')}")
        exit(1)

    updates = data.get('result', [])

    if not updates:
        print("\n⚠️  No se encontraron mensajes recientes.")
        print("Asegúrate de haber enviado un mensaje al bot primero.")
        exit(1)

    # Mostrar todos los chats encontrados
    chats_encontrados = set()

    print("\n" + "=" * 60)
    print("CHATS ENCONTRADOS:")
    print("=" * 60)

    for update in updates:
        if 'message' in update:
            message = update['message']
            chat = message.get('chat', {})
            from_user = message.get('from', {})

            chat_id = chat.get('id')
            chat_type = chat.get('type')
            username = from_user.get('username', 'Sin username')
            first_name = from_user.get('first_name', '')
            last_name = from_user.get('last_name', '')
            full_name = f"{first_name} {last_name}".strip()

            if chat_id and chat_id not in chats_encontrados:
                chats_encontrados.add(chat_id)
                print(f"\n📱 Chat ID: {chat_id}")
                print(f"   Tipo: {chat_type}")
                print(f"   Usuario: @{username}")
                print(f"   Nombre: {full_name}")

                # Si es un chat privado, mostrar el último mensaje
                if chat_type == 'private':
                    last_message = message.get('text', '')
                    print(f"   Último mensaje: {last_message[:50]}...")

    print("\n" + "=" * 60)

    if chats_encontrados:
        # Obtener el chat_id más reciente
        ultimo_chat_id = None
        for update in reversed(updates):
            if 'message' in update:
                ultimo_chat_id = update['message']['chat']['id']
                break

        print(f"\n✅ Tu CHAT_ID es: {ultimo_chat_id}")
        print("\n📝 Para configurarlo:")
        print("   1. Copia el CHAT_ID de arriba")
        print("   2. Edita el archivo: config/profile.json")
        print(f"   3. Reemplaza 'YOUR_CHAT_ID_HERE' por: {ultimo_chat_id}")
        print("\nO ejecuta este comando:")
        print(f'   sed -i \'s/"YOUR_CHAT_ID_HERE"/"{ultimo_chat_id}"/g\' config/profile.json')

        # Preguntar si quiere actualizar automáticamente
        print("\n¿Quieres actualizar el archivo automáticamente? (s/n): ", end='')
        respuesta = input().strip().lower()

        if respuesta in ['s', 'si', 'yes', 'y']:
            config['telegram']['chat_id'] = str(ultimo_chat_id)

            with open(CONFIG_PATH, 'w', encoding='utf-8') as f:
                json.dump(config, f, indent=2, ensure_ascii=False)

            print("\n✅ Configuración actualizada correctamente!")
            print("   Ya puedes ejecutar: python src/job_search.py")
        else:
            print("\nOK, actualiza manualmente el archivo config/profile.json")

    print()

except requests.exceptions.RequestException as e:
    print(f"\n❌ Error de conexión: {e}")
    exit(1)
except Exception as e:
    print(f"\n❌ Error inesperado: {e}")
    exit(1)
