#! /bin/bash

#24/06/2019

#Alfredo Castro 

#INSTALAR IPTABLES 
yum install iptables-services -y

#INSTALAR DHCP
yum install dhcp -y

#INSTALLAR SSH
yum install opnessh-server.x86_64 -y 

#INSTALAR APACHE
yum install httpd

#INSTALL NET-TOOLS 
yum instal net-tools -y 

#INSTALAR EPEL
yum install epel -y

#INSTALAR HTOP Y TOP
yum install htop -y 

yum install top -y

#INSTALAR VSFTPD
yum install vsftpd.x86_64 -y

#INSTALAR CRON 
yum install cron -y

#INATALAR SSL
yum install openssl.x86_64 -y 

#INSTALAR SAMBA
yum install samba.x86_64 -y

#ACTUALIZAR 
yum update -y

#NOTA:La primera vez que usemos cron se debe poner el comando crontab -e
