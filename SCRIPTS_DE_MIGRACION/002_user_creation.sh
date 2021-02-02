#!/bin/bash

# Script para la creación de las cuentas de usuario y darlos de alta en samba
# Las cuentas no son

if [[ ! $1 ]]; then
    echo "[-] Comando incompleto:";
    echo "ejemplo: $0 lista_usuarios.txt";
    exit;
fi;

# Archivo de usuario,grupo para samba
listado_usuarios=$1

# Lectura de lineas del archivo
while IFS= read line
do
    # Tratando las lineas
    usuario=$(echo $line | cut -f1 -d',')
    grupo=$(echo $line | cut -f2 -d',')

    # Creación de usuario en unix
    useradd --no-create-home --shell /usr/sbin/nologin -G $grupo $usuario;

done < $listado_usuarios
