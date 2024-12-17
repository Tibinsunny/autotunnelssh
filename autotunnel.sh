#!/bin/bash
NGROK_PATH=$(whereis ngrok | awk '{print $2}')
if [ -z "$NGROK_PATH" ]; then
    echo "ngrok not found. Please install ngrok or check the path." 
    exit 1
fi
NGROK_TOKEN=""
MAILTRAP_TOKEN=""
SEND_EMAIL=""
$NGROK_PATH authtoken $NGROK_TOKEN
$NGROK_PATH tcp 22 > ngrok.log 2>&1 &
sleep 5
NGROK_URL=$(curl -s http://127.0.0.1:4040/api/tunnels)
PUBLIC_URL=$(echo "$NGROK_URL" | jq -r '.tunnels[0].public_url')

if [ -z "$PUBLIC_URL" ]; then
    echo "Failed to retrieve ngrok URL"
    exit 1
fi

curl --location --request POST \
  'https://send.api.mailtrap.io/api/send' \
  --header "Authorization: Bearer $MAILTRAP_TOKEN" \
  --header 'Content-Type: application/json' \
  --data-raw "$(cat <<EOF
{
    "from": {"email": "hello@demomailtrap.com", "name": "SSH Tunnel"},
    "to": [{"email": "$SEND_EMAIL"}],
    "subject": "New SSH Login in Home Server",
    "text": "ngrok to access ssh is with PUBLIC_URL: $PUBLIC_URL",
    "category": "Integration Test"
}
EOF
)"
echo "ngrok URL sent: $PUBLIC_URL"
