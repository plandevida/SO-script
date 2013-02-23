#!/bin/bash

fichero=$1

# Primero se comprueba que hemos pasado el parámetro
if [ $# -ne 1 ] ; then
	echo "Uso: ./$0 fichero_passwords"
	exit 1
fi

if [ -f $fichero ] ; then
	echo ""	
	echo "SCRIPT QUE OBTIENE LA INFORMACIÓN DE UN USUARIO UNIX DE UN FICHERO CON FORMATO passwd"
	echo ""
	echo -n "introduce el nombre del usuario (fin termina): "
	read usuario

	while [ "$usuario" != "fin" ] ; do
		
		# Comprueba que el usuario existe en /etc/passwd
		comando=`grep "^$usuario:" $fichero`
		if [ $? -ne 0 ] ; then
			echo "El usuario $usuario no existe en el fichero: $fichero."
			exit 1
		else
			echo ""

			login=`echo $comando | cut -d : -f 1`
			nombre=`echo $comando | cut -d : -f 5`
			gid=`echo $comando | cut -d : -f 4`
			uid=`echo $comando | cut -d : -f 3`
			home=`echo $comando | cut -d : -f 6`
			shell=`echo $comando | cut -d : -f 7`

			echo "DATOS DEL USUARIO:"
			echo "Login: $login"
			echo "Nombre: $nombre"
			echo "UID: $uid"
			echo "GID: $gid"
			echo "home: $home"
			echo "shell: $shell"
		fi

		echo -n "introduce el nombre del usuario: "
		read usuario
	done
else
	
	echo "El fichero no existe."
fi

exit 0
