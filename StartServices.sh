#! /bin/bash

#AC 10/07/2019

#INICAR IPTABLES
systemctl start iptables
echo "INICIANDO IPTABLES"

#INICAR DCHP
systemctl start dhcpd 
echo "INICIANDO DCHP"

#INICAR SSH
systemctl start sshd 
echo "INICIANDO SSH"

#INICAR APACHE 
systemctl start httpd 
echo "INICIANDO APACHE"

#INICAR FTP
systemctl start vsftpd
echo "INICIANDO FTP"

#INICAR SAMBA
systemctl start smb

systemctl start nmb
echo "INICIANDO SAMBA "
