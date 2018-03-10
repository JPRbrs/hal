if [ -z $PHONE_MAC ]; then
    echo 'Phone mac env var not found, please set PHONE_MAC'
    exit 1
fi

for i in $(arp-scan -I eth0 -l | grep "$PHONE_MAC" | awk '{print $1}'); do
    ping -c 1  -W 1 $i | grep '1 received' && echo "Found at $i" && exit 0
    
done
echo "Phone not found"
exit 2
