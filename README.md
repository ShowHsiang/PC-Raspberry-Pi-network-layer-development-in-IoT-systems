# Raspberry-Pi-network-layer-development-in-IoT-systems
#Installing and updating software#
Open the terminal and update the software list:
```bash
sudo apt update
sudo apt upgrade
```

Raspberry Pi Acceptance Network Signal Strength Test Tool: Wavemon
Type in the Raspberry Pi terminal:
```bash
sudo apt-get install wavemon
wavemon
```
Then you can check parameters including:
1.  signal level
2.	Link Quality: is calculated based on the difference between signal strength and noise level. High Link Quality indicates a more stable and reliable wireless connection.
3.	RX / TX: These are the number and size (in KiB) of packets received (RX) and sent (TX).
4.	Mode: 'Managed' - This indicates that the wireless interface is controlled by the network manager.
5.	Channel: '1 (width: 20 MHz)' - This specifies that the wireless signal is using channel 1 in the 2.4 GHz band with a channel width of 20 MHz.
6.	RX/TX rate: This is the rate at which the wireless network receives/sends data.
7.	Power Mgt: on - Indicates that the power management feature of the wireless interface is on.
8.	TX-Power: This is the transmit power of the wireless interface.
9.	inactive: This indicates the amount of time the wireless interface has been idle since the last time there was a data transfer. If this is a long time, it may mean that the connection is inactive.
10.	retry: This indicates the number of retries when sending packets. If this number is high, it may mean that there is a problem with the wireless connection, causing the packet to take multiple attempts to be sent successfully.
11.	rts/cts (Request to Send/Clear to Send): This is a conflict avoidance mechanism used to reduce packet conflicts in a wireless network. If turned on, a device will send an RTS packet before sending data, and then only begin data transmission when it receives a CTS response. This is useful in environments where there is a lot of network congestion or interference.
12.	frag (Fragmentation threshold): This refers to the wireless network packet fragmentation size threshold. If the packet size exceeds this value, it will be divided into smaller fragments for transmission. This helps to improve transmission reliability in poor quality wireless signal environments.
13.	qlen (Queue Length): This is the length of the queue of packets that the network device is waiting to send. In most cases, this value is the default setting and indicates the maximum length of the packet queue that the network interface can handle.
