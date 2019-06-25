#! /bin/bash

#Borrar las reglas por defecto
iptables -F 

echo "Borrando reglas por defecto"

#Verificar
iptables -L -t mangle
iptables -L -t raw
iptables -L -t filter
iptables -L -t nat

#Guardar la configuración 

service iptables save
echo "Iptables guardado"

#Reglas de NAT
iptables -t nat -A PREROUTING -s x.x.x.x/x -p tcp --dport 80 -j ACCEPT 
iptables -t nat -A PREROUTING -s x.x.x.x/x -p tcp --dport 443 -j ACCEPT 
iptables -t nat -A POSTROUTING -s x.x.x.x/x -o enp0s3 -j MASQUERADE

echo "Reglas de NAT"

#Reglas de Filter
#ALLOW DNS TRAFFIC THROUGH THE FIREWALL
iptables -t filter -A FORWARD -i enp0s8 -o enp0s3 -p udp --dport 53 -j ACCEPT
iptables -t filter -A FORWARD -i enp0s3 -o enp0s8 -p udp --sport 53 -j ACCEPT
iptables -t filter -A FORWARD -i enp0s8 -o enp0s3 -p tcp --dport 53 -j ACCEPT
iptables -t filter -A FORWARD -i enp0s3 -o enp0s8 -p tcp --sport 53 -j ACCEPT
#ALLOW HTTP/HTTPS TRAFFIC THROUGH THE FIREWALL FROM LAN -> WAN
iptables -t filter -A FORWARD -i enp0s8 -o enp0s3 -p tcp --dport 80 -j ACCEPT
iptables -t filter -A FORWARD -i enp0s3 -o enp0s8 -p tcp --sport 80 -j ACCEPT
iptables -t filter -A FORWARD -i enp0s8 -o enp0s3 -p tcp --dport 443 -j ACCEPT
iptables -t filter -A FORWARD -i enp0s3 -o enp0s8 -p tcp --sport 443 -j ACCEPT
#ALLOW HTTP/HTTPS TO THIS FIREWALL
iptables -t filter -A INPUT -i enp0s8 -p tcp --dport 80 -j ACCEPT
iptables -t filter -A OUTPUT -i enp0s8 -p tcp --sport 80 -j ACCEPT
#IF PACKET NO MATCHES, REDIRECT TO CHAIN bloquear 
iptables -t filter -A OUTPUT -j bloquear
iptables -t filter -A INPUT -j bloquear
iptables -t filter -A FORWARD -j bloquear 
#BLOCK THE TRAFFIC 
iptables -t filter -A bloquear -j DROP

echo "Reglas de FILTER"

#DEBALO DE OUTPUT ACCEPT DE LA TABLA FILTER FILTER

#:bloquear - [0:0]

#REINICAR EL IPTABLES

systemctl reload iptables
