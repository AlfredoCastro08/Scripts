#! /bin/bash
#Detener el demonio de firewalld 
systemctl stop firewalld 
#Deshabilitar el demonio 
systemctl disable firewalld
#Enmascarar firewalld 
systemctl mask firewallf
