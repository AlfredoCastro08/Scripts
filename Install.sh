#! /bin/bash

#24/06/2019

#Alfredo Castro 

#INSTALAR IPTABLES 
yum install iptables-services -y

#INSTALAR DHCP
yum install dhcp -y

#INSTALLAR SSH
yum instal opnessh-server.x86_64 -y 

#INSTALL NET-TOOLS 
yum instal net-tools -y 

#INSTALAR EPEL
yum install epel -y

#INSTALAR HTOP Y TOP
yum install htop -y 

yum install top -y

#ACTUALIZAR 
yum update -y
