#! /bin/bash  

#Habilitar servicios

#IPTABLES
systemctl enable iptables 
echo "HABILITANDO IPTABLES"

#DHCP
systemctl enable dhcpd 
echo "HABILITANDO DHCP"

#SSH
systemctl enable sshd
echo "HABILITANDO SSH"

#HTTP
systemctl enable hhtpd 
echo "HABILITANDO APACHE"

#FTP
systemctl enable vsftpd
echo "HABILITANDO "FTP"

#SAMBA
systemctl enable smb
systemctl enable nmb
