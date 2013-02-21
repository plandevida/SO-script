#! /bin/bash

# Guion que cuenta el numero de parametros y los muestra uno a uno

echo "Numero de parametros: $#"
echo "Mi nombre es: $0"
while [ $# -gt 0 ] ; do
    echo "Numero de parametros restantes: $#"
    echo "Parametro : $1"
    shift
done
exit 0