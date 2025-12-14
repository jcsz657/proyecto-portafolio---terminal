"""
Script para crear la base de datos SQLite y cargar los datos CSV
Autor: Proyecto Portafolio de Datos
"""

import sqlite3
import csv
import os

# Ruta de la base de datos
DB_PATH = '../sql/concesionario.db'
DATOS_PATH = '../datos/'

def crear_base_datos():
    """Crea la base de datos y las tablas"""
    print("📊 Creando base de datos SQLite...")

    # Conectar a la base de datos (se crea si no existe)
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    # Leer y ejecutar el script SQL
    with open('crear_base_datos.sql', 'r', encoding='utf-8') as f:
        sql_script = f.read()

    cursor.executescript(sql_script)
    conn.commit()
    print("✅ Base de datos creada exitosamente")

    return conn

def cargar_datos(conn):
    """Carga los datos desde los archivos CSV a la base de datos"""
    print("\n📥 Cargando datos desde archivos CSV...")

    cursor = conn.cursor()

    # Diccionario con los archivos CSV y sus tablas correspondientes
    tablas = {
        'vehiculos': 'vehiculos.csv',
        'clientes': 'clientes.csv',
        'ventas': 'ventas.csv',
        'prestamos': 'prestamos.csv'
    }

    for tabla, archivo in tablas.items():
        ruta_archivo = os.path.join(DATOS_PATH, archivo)

        # Leer CSV
        with open(ruta_archivo, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            rows = list(reader)

            if rows:
                # Obtener columnas
                columnas = rows[0].keys()
                placeholders = ','.join(['?' for _ in columnas])
                columnas_str = ','.join(columnas)

                # Insertar datos
                for row in rows:
                    valores = [row[col] for col in columnas]
                    cursor.execute(f"INSERT INTO {tabla} ({columnas_str}) VALUES ({placeholders})", valores)

                print(f"  ✅ {tabla}: {len(rows)} registros cargados")

    conn.commit()
    print("\n✅ Todos los datos cargados exitosamente")

def verificar_datos(conn):
    """Verifica que los datos se hayan cargado correctamente"""
    print("\n🔍 Verificando datos...")

    cursor = conn.cursor()

    # Consultas de verificación
    consultas = [
        ("Total de vehículos", "SELECT COUNT(*) FROM vehiculos"),
        ("Total de clientes", "SELECT COUNT(*) FROM clientes"),
        ("Total de ventas", "SELECT COUNT(*) FROM ventas"),
        ("Total de préstamos", "SELECT COUNT(*) FROM prestamos"),
        ("Ventas totales (COP)", "SELECT SUM(precio_final) FROM ventas")
    ]

    for descripcion, consulta in consultas:
        cursor.execute(consulta)
        resultado = cursor.fetchone()[0]

        if 'COP' in descripcion:
            print(f"  {descripcion}: ${resultado:,.0f}")
        else:
            print(f"  {descripcion}: {resultado}")

def main():
    """Función principal"""
    print("="*60)
    print("🚗 PROYECTO: ANÁLISIS DE VENTAS AUTOMOTRICES")
    print("Configuración de Base de Datos SQLite")
    print("="*60)

    try:
        # Crear base de datos
        conn = crear_base_datos()

        # Cargar datos
        cargar_datos(conn)

        # Verificar
        verificar_datos(conn)

        print("\n"+"="*60)
        print("✅ Base de datos lista para usar")
        print(f"📁 Ubicación: {os.path.abspath(DB_PATH)}")
        print("="*60)

        conn.close()

    except Exception as e:
        print(f"\n❌ Error: {e}")

if __name__ == "__main__":
    main()