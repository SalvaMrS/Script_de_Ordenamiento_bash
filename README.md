# Ordenador de Archivos en Bash

Este script organiza archivos en un sistema Linux moviéndolos desde una carpeta de origen a una carpeta de destino, clasificándolos según su extensión, propietario, y tipo de archivo.

## Características

- **Clasificación por tipo de archivo**: Los archivos se agrupan en carpetas según las extensiones definidas en el archivo `Extensiones.txt`.
- **Clasificación por propietario**: Dentro de cada tipo, los archivos se organizan en carpetas nombradas según el usuario propietario del archivo.
- **Soporte para extensiones no especificadas**: Los archivos con extensiones no incluidas en `Extensiones.txt` se mueven a una carpeta `otros`.
- **Gestión de directorios**: Los directorios de la carpeta de origen se mueven a una carpeta `carpetas`.

## Requisitos

- Linux con Bash.
- Permisos adecuados para mover archivos y acceder a la carpeta de origen.
- Archivo `Extensiones.txt` con las extensiones de archivo a clasificar.

## Uso

### Preparación

1. Coloca el script en un archivo ejecutable, por ejemplo, `ordenar_archivos.sh`.
2. Asegúrate de que el archivo `Extensiones.txt` está en el mismo directorio que el script.
3. Edita las variables del script para especificar las rutas:
   - `ubicacion`: Directorio de origen.
   - `destino`: Directorio de destino.

### Ejecución

1. Da permisos de ejecución al script:

   ```bash
   chmod +x ordenar_archivos.sh
   ```

2. Ejecuta el script:

   ```bash
   ./ordenar_archivos.sh
   ```

### Configuración del Archivo `Extensiones.txt`

El archivo `Extensiones.txt` contiene líneas donde cada línea define un tipo de archivo y sus extensiones, separados por espacios. Ejemplo:

```txt
documentos pdf doc
comprimidos iso rar zip
videos mp4
audios mp3
ejecutables exe
imagenes jpeg jpg png
```

## Notas

- Asegúrate de que las carpetas de origen y destino sean accesibles y tengan permisos adecuados.
- El script mueve los archivos, no los copia. Asegúrate de respaldar tus datos importantes antes de usarlo.
