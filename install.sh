#!/bin/bash
raw_file=$(cat ./autotunnel.sh)
echo "Current content of autossh.sh:"
echo "$raw_file"

echo "==========================================================="
echo "DISCLAIMER: The tokens you provide will only be used within"
echo "this system for the required services (MailTrap and ngrok)."
echo "They will not be shared or used outside of this purpose."
echo "==========================================================="

echo "Enter MailTrap Token:"
read MAILTRAP_TOKEN

echo "Enter NGROK Token:"
read MAILTRAP_TOKEN

echo "Enter EmailID registered with MailTrap:"
read SEND_EMAIL

raw_file=$(echo "$raw_file" | sed "s/MAILTRAP_TOKEN=\".*\"/MAILTRAP_TOKEN=\"$MAILTRAP_TOKEN\"/")
raw_file=$(echo "$raw_file" | sed "s/NGROK_TOKEN=\".*\"/NGROK_TOKEN=\"$NGROK_TOKEN\"/")
raw_file=$(echo "$raw_file" | sed "s/SEND_EMAIL=\".*\"/SEND_EMAIL=\"$SEND_EMAIL\"/")
echo "$raw_file" > /bin/autotunnelssh.sh
chmod +x /bin/autotunnelssh.sh
cp ./autotunnel.service /etc/systemd/system
systemctl daemon-reload
systemctl enable autotunnel.service
systemctl restart autotunnel.service

