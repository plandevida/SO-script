#!/bin/bash

# Este guión informa del número de sesiones que tiene abiertas un usuario

# Primero se comprueba que hemos pasado el parámetro del nombre de usuario
if [ $# -ne 1 ] ; then
	echo "Uso: $0 nombre_de_usuario"
	exit 1
fi

# Ahora comprueba que el usuario existe en /etc/passwd
grep "^$1:" /etc/passwd >/dev/null
if [ $? -ne 0 ] ; then
	echo "El usuario $1 no existe en el sistema."
	exit 1
fi

# Informa de cuántas sesiones tiene abiertas el usuario
oldnum=$(who | grep "^$1 " |wc -l)
echo "El usuario $1 tiene abiertas $oldnum sesiones"

# Bucle infinito. Se acaba con ^C
while [ 1 ] ; do
	# número de sesiones actual
	num=$(who | grep "^$1 " |wc -l)
	if [ $num -lt $oldnum ] ; then 
		# el número actual es menor que el antiguo, luego se han cerrado sesiones
		date
		echo "El usuario $1 ha cerrado $(($oldnum-$num)) sesiones ($num actualmente)"
		# Se actualiza en número de sesiones
		oldnum=$num
	elif [ $num -gt $oldnum ] ; then
		# el usuario ha abierto sesiones
		date
		echo "El usuario $1 ha abierto $(($num-$oldnum)) sesiones ($num actualmente)"
		# Se actualiza en número de sesiones
		oldnum=$num
	fi

	# Esperamos unos segundos entre actualizaciones
	sleep 2
done
