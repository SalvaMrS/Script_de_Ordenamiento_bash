#!/bin/bash

# Falta mover carpetas y extensiones extrañas (Otros)
# y agrupar por usuarios y fechas
# Cambiar nombre de la configuración y permitir más configuraciones

ubicacion="/home/Salva/Ordenar"
destino="/home/Salva/Nuevo"
archivo="Extensiones.txt"


mover () {

ls -1 $ubicacion/ | grep ".*$1$" > temp.txt

while IFS= read -r linea || [[ -n "$linea" ]]; do 

	if [[ ! -d $destino/$2 ]]; then
		mkdir $destino/$2
	fi
	
	mv $ubicacion/"$linea" $destino/$2/

done < temp.txt
}

while IFS= read -r li || [[ -n "$li" ]]; do 

	contador=0
	carpeta=""

	for i in $li; do
		if [ $contador == 0 ]; then
			carpeta=$i
		else
			mover "\.$i" $carpeta
		fi

		let contador++

	done
done < $archivo

mover "\..+" "otros"

mover '' "carpetas"
