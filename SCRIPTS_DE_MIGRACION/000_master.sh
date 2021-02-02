#!/bin/bash

# Script para la creación de grupos de unix a mapear en samba y darlos de alta en samba
# Las cuentas no son

if [[ ! $1 || ! $2 || ! $3 || ! $4 ]]; then
    echo "[*] Parámetros incompletos:";
    echo "Opciones: $0 nombre_grupo_trabajo /listado/usuarios.txt /listado/grupos.txt /ruta/de/samba/ id_grupo_inicial";
    echo "ejemplo: $0 ethergroup /listas/usuarios.txt /listas/grupos.txt /var/samba/ 3000";
    exit;
fi;

# Opciones a variables
grupo_de_trabajo=$1
lista_usuarios=$2
lista_grupos=$3
ruta_samba=$4
gid=$5

# Ejecución de scripts
/bin/bash 001_group_creation.sh $lista_grupos $ruta_samba $gid;
/bin/bash 002_user_creation.sh $lista_usuarios;
/bin/bash 003_samba_conf.sh $grupo_de_trabajo $lista_grupos $ruta_samba $gid;