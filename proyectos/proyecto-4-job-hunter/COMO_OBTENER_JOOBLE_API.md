# Cómo Obtener el API Key de Jooble

Jooble es un agregador de ofertas de empleo que consolida trabajos de múltiples fuentes incluyendo:
- **elempleo.com**
- **Computrabajo**
- **LinkedIn**
- **Indeed**
- Y muchas más

## 🔑 Paso a Paso para Obtener tu API Key

### 1. Ir a la página de registro

Visita: **https://jooble.org/api/about**

### 2. Completar el formulario de registro

Te pedirán:
- **Nombre completo**
- **Email**
- **Nombre del sitio web** (puedes poner tu email o "Uso personal")
- **Descripción del uso** (ejemplo: "Búsqueda automática de empleos para uso personal")

### 3. Acepta los términos y condiciones

Lee y acepta los términos de uso de la API

### 4. Recibirás el API Key por email

Jooble te enviará un email con:
- Tu API key único
- Instrucciones básicas de uso
- Límites de uso (si aplican)

### 5. Configurar en Job Hunter

Una vez que tengas tu API key:

#### Opción A: Editar manualmente

1. Abre el archivo de configuración:
   ```bash
   nano ~/job-hunter/config/profile.json
   ```

2. Busca la sección de Jooble:
   ```json
   "jooble": {
     "endpoint": "https://jooble.org/api",
     "api_key": "YOUR_JOOBLE_API_KEY_HERE",  ← Reemplaza esto
     "activa": false,                        ← Cambia a true
     "location": "Colombia",
     "radius": 0,
     "results_per_page": 20
   }
   ```

3. Reemplaza `"YOUR_JOOBLE_API_KEY_HERE"` con tu API key real

4. Cambia `"activa": false` a `"activa": true`

5. Guarda el archivo (Ctrl+O, Enter, Ctrl+X)

#### Opción B: Usar comando

```bash
cd ~/job-hunter

# Reemplazar API key
sed -i 's/"YOUR_JOOBLE_API_KEY_HERE"/"TU_API_KEY_REAL"/g' config/profile.json

# Activar Jooble
sed -i 's/"activa": false/"activa": true/g' config/profile.json
```

Reemplaza `TU_API_KEY_REAL` con tu API key real.

### 6. Probar la configuración

```bash
python3 src/job_search.py
```

Deberías ver en los logs:
```
--- Buscando en Jooble ---
Jooble - 'junior data analyst': X ofertas encontradas
```

---

## ⚠️ Notas Importantes

### Límites de la API

Jooble tiene límites de uso razonables:
- **Gratuito** para uso personal
- Máximo de peticiones por día (varía según el plan)
- Si excedes el límite, recibirás un error 403

### Fuentes incluidas en Jooble

Jooble agrega ofertas de:
- **Portales colombianos**: elempleo, Computrabajo, Magneto
- **Portales internacionales**: LinkedIn, Indeed, Glassdoor
- **Bolsas de universidades**
- **Sitios corporativos**

### Ventajas de usar Jooble

✅ **Más ofertas**: Consolida múltiples fuentes
✅ **Ofertas locales**: Incluye elempleo y Computrabajo
✅ **Filtros**: Por ubicación (Colombia), salario, etc.
✅ **Actualizado**: Ofertas recientes de múltiples fuentes
✅ **Gratis**: No requiere pago para uso personal

---

## 🐛 Solución de Problemas

### "Jooble API key no configurado, saltando búsqueda"

Tu API key sigue siendo el placeholder. Verifica:
1. Que reemplazaste `YOUR_JOOBLE_API_KEY_HERE` con tu API key real
2. Que guardaste el archivo profile.json
3. Que el API key no tiene espacios extra

### "Jooble: API key inválido (403)"

Tu API key es incorrecto. Verifica:
1. Que copiaste el API key completo del email
2. Que no hay espacios al inicio o al final
3. Que el email de Jooble no fue a spam

### "No se encuentran ofertas en Jooble"

Posibles causas:
1. Las keywords son muy específicas
2. No hay ofertas Junior con esos términos en Colombia
3. Los filtros son muy restrictivos

Solución: Revisa los logs para ver cuántas ofertas se encontraron antes de filtrar.

---

## 📊 Comparación de Fuentes

| Fuente | Ofertas | Región | Tipo |
|--------|---------|--------|------|
| **Get on Board** | Tech startups Latam | Latam | Directa |
| **Remotive** | Trabajos remotos globales | Global | Directa |
| **Jooble** | Agregador múltiple | Colombia | Agregador |

**Recomendación**: Usa las 3 fuentes para máxima cobertura.

---

## ✅ Checklist de Configuración

- [ ] Registrado en https://jooble.org/api/about
- [ ] API key recibido por email
- [ ] API key configurado en profile.json
- [ ] Jooble activado (`"activa": true`)
- [ ] Prueba ejecutada exitosamente
- [ ] Notificaciones de Telegram recibidas

---

## 🆘 Soporte

Si tienes problemas:
1. Verifica que el API key esté correcto
2. Revisa los logs en `logs/search.log`
3. Contacta al soporte de Jooble: https://help.jooble.org/

---

**¡Con Jooble tendrás acceso a miles de ofertas de empleo en Colombia!** 🎯
