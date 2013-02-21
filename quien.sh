#!/bin/bash

fichero=$1

# Primero se comprueba que hemos pasado el parámetro
if [ $# -ne 1 ] ; then
	echo "Uso: ./$0 fichero_passwords"
	exit 1
fi

if [ -f $fichero ] ; then
	
	echo -n "introduce el nombre del usuario (fin termina): "
	read usuario

	while [ "$usuario" != "fin" ] ; do
		
		# Comprueba que el usuario existe en /etc/passwd
		comando=`grep "^$usuario:" $fichero`
		if [ $? -ne 0 ] ; then
			echo "El usuario $usuario no existe en el fichero: $fichero."
			exit 1
		else
			echo -n "TODO: rutina de tratamiento de la cadena: "
			echo $comando
			echo ""
			login=""
			nombre=""
			gid=""
			uid=""
			home=""
			shell=""

			while [ $comando != "" ] ; do
				
			done
		fi

		echo -n "introduce el nombre del usuario: "
		read usuario
	done
else
	
	echo "El fichero no existe."
fi

exit 0
