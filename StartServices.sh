#! /bin/bash

#INICAR IPTABLES
systemctl start iptables

#INICAR DCHP
systemctl start dhcpd 

#INICAR SSH
systemctl start sshd 

#INICAR APACHE 
systemctl start httpd 

#INICAR FTP
systemctl start vsftpd

#INICAR SAMBA
systemctl start smb

systemctl start nmb
