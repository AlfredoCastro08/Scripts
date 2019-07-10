#! /bin/bash

#AC 10/07/19

#INICAR IPTABLES
systemctl disable iptables
echo "DESHABILITANDO IPTABLES"

#INICAR DCHP
systemctl disable dhcpd 
echo "DESHABILITANDO DCHP"

#INICAR SSH
systemctl disable sshd 
echo "DESHABILITANDO SSH"

#INICAR APACHE 
systemctl disable httpd 
echo "DESHABILITANDO APACHE"

#INICAR FTP
systemctl disable vsftpd
echo "DESHABILITANDO FTP"

#INICAR SAMBA
systemctl disable smb

systemctl disable nmb
echo "DESHABILITANDO SAMBA"
