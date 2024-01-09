#!/bin/bash
sleep 30
echo "Starting script…" > /tmp/script_log.txt
best_ping=1000
best_gateway=""
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
for gateway in 192.168.1.1 192.168.1.2 192.168.1.3; do
  ping -c 8 $gateway > /dev/null
  if [ $? -eq 0 ]; then
result=$(ping -c 8 $gateway | tail -1| awk '{print $4}' | cut -d '/' -f 2)
echo "Ping $gateway: $result" >> /tmp/script_log.txt
    if [[ $(echo "$result < $best_ping" | bc) -eq 1 ]]; then
      best_ping=$result
      best_gateway=$gateway
    fi
  else
message="Gateway $gateway is unreachable"
echo $message
  fi
done
echo "Best gateway found: $best_gateway" >> /tmp/script_log.txt
if [[ $best_gateway != "" ]]; then
echo "Trying to set default gateway..." >> /tmp/script_log.txt
sudo ip route replace default via $best_gateway >> /tmp/script_log.txt 2>&1
echo "Default gateway set to $best_gateway" >> /tmp/script_log.txt
fi
