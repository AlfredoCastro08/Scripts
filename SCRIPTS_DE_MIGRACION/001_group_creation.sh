#!/bin/bash

# Script para la creación de grupos de unix a mapear en samba y darlos de alta en samba
# Las cuentas no son

if [[ ! $1 || ! $2 || ! $3 ]]; then
    echo "[-] Comando incompleto:";
    echo "ejemplo: $0 /lista/grupos.txt /ruta/de/samba/ id_grupo_inicial";
    exit;
fi;

# Archivo de grupos a crear en samba
listado_grupos=$1
samba_folder=$2
gid=$3

# Creación de carpeta principal de samba
mkdir -p $samba_folder

# Lectura de lineas del archivo
while IFS= read line
do
    gid=$(expr $gid + 1)
    groupadd -g $gid $line
    mkdir -p $samba_folder$line
    chown -R root:$line $samba_folder$line
    chmod 770 $samba_folder$line
done < $listado_grupos