#!/bin/bash

# Este guion encuentra los ficheros creados/actualizados hoy
# Utiliza el guion recursivo.sh
#
# Uso: fut.sh <directorio>

ruta=$(dirname $0)
diractual=$PWD
cd $ruta; rutaA=$PWD; cd $diractual
PATH=$rutaA:$PATH

hoy=$(date +%Y-%m-%d)
directorio=$1
if [ -z $directorio ]; then
	directorio=.
fi

recursivo.sh "$directorio" $hoy


