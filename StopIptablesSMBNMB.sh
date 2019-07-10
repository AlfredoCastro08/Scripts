#! /bin/bash

#AC 09/072019
systemctl stop iptables
echo "IPTABLES STOPED"
systemctl stop smb
echo "SMB STOPED"
systemctl stop nmb
echo "NMB STOPED"
systemctl restart smb
echo "SMB RESTARTED"
systemctl restart nmb
echo "NMB RESTARTED"
