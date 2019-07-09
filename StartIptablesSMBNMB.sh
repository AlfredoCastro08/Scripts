#! /bin/bash

systemctl stop smb
echo "SMB STOPED"
systemctl stop nmb
echo "NMB STOPED"
systemctl restart iptables
echo "IPTABLES RESTARTED"
systemctl restart smb
echo "SMB RESTARTED"
systemctl restart nmb
echo "NMB RESTARTED"
