sudo ip route add default via 192.168.x.y
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
