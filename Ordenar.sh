#!/bin/bash

# ubicación del directorio origen
ubicacion="/home/Salva/Ordenar"

# ubicación del directorio destino
destino="/home/Salva/Nuevo"

# archivo de extensiones
archivo="Extensiones.txt"

# función para mover los archivos según la extensión especificada a la carpeta correspondiente en el directorio del usuario
mover () {
  # busca los archivos con la extensión especificada en el directorio origen y los guarda en un archivo temporal
  ls -1 "$ubicacion"/ | grep ".*$1$" > temp.txt

  # itera sobre cada línea del archivo temporal
  while read -r linea; do
    # verifica si la carpeta para el usuario en el directorio destino ya existe
    usuario=$(stat -c "%U" "$ubicacion/$linea")

    mkdir -p "$destino/$usuario"
    
    mkdir -p "$destino/$usuario/$2"

    # mueve el archivo al directorio del usuario en el directorio destino
    mv "$ubicacion/$linea" "$destino/$usuario/$2/"

  done < temp.txt
}

# itera sobre cada línea del archivo de extensiones
while read -r li; do
  # contador para recorrer los elementos de la línea
  contador=0
  # nombre de la carpeta para el tipo de archivo
  carpeta=""

  # recorre cada elemento de la línea
  for i in $li; do
    # si es el primer elemento de la línea, se trata del nombre de la carpeta para el tipo de archivo
    if [ $contador == 0 ]; then
      carpeta=$i
    # si no es el primer elemento, se trata de una extensión y se mueven los archivos correspondientes
    else
      mover "\.$i" "$carpeta"
    fi

    # aumenta el contador
    let contador++
  done
done < "$archivo"

# mueve los archivos con extensiones no especificadas en el archivo de extensiones a la carpeta "otros"
mover "\..*" "otros"

# mueve los directorios a la carpeta "carpetas"
mover '' "carpetas"

