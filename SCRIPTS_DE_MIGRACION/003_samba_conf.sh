#!/bin/bash

# Creación de archivo de configuración de SAMBA
# Este archivo generará una estructura del archivo
# smb.conf. La salida la encontrarás en: configs/samba.conf

if [[ ! $1 || ! $2 || ! $3 ]]; then
    echo "[-] Comando incompleto:";
    echo "ejemplo: $0 grupodetrabajo /listado/grupos /ruta/archivos/samba/";
    exit;
fi;

# Variables a utilizar:
directorio_samba=configs/
archivo_samba=smb.conf
grupo_de_trabajo=$1
listado_grupos=$2
ruta_archivos_samba=$3

if [ ! -d "$directorio_samba" ];then
    echo "[+] Directorio configs no existe. Creandolo."
    mkdir configs
fi

header="[global]
workgroup = $grupo_de_trabajo
security = user
disable netbios = yes
dns proxy = no
min protocol = SMB2
client min protocol = SMB2
";

echo "$header" > $directorio_samba$archivo_samba;

while IFS= read -r grupo
do
    carpeta="[$grupo]
path = $ruta_archivos_samba$grupo/
valid users = @$grupo  
writable = yes
browsable = yes
guest ok = no
";
    echo "$carpeta" >> $directorio_samba$archivo_samba;
done < $listado_grupos

echo "[+] Archivo de configuración creado";