#!/bin/bash

# Este guion encuentra los ficheros creados/actualizados en cierta fecha
# Es utilizado por el guion fut.sh
#
# Uso: recursivo.sh <directorio> <fecha>

#echo $0
#echo "Directorio: $1"
#echo "Fecha: $2"
#echo $PATH

cd "$1"

for fichero in *; do
	if [ -d "$fichero" ]; then
		#echo "NUEVODIR=$PWD/$fichero"
		recursivo.sh "$fichero" $2
	fi
	if [ -f "$fichero" ] ;then
		fichero_largo=$(ls -l --time-style="+%Y-%m-%d" "$fichero")
		chequeo=$(echo $fichero_largo | grep $2)
		if [ -n "$chequeo" ]; then
			echo $PWD/$fichero
		fi
	fi
done

#if [ $1 != . ]; then
#	cd ..
#fi

