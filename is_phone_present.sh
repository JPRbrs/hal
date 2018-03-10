if [ -z $PHONE_MAC ]; then
    echo 'Phone mac env var not found, please set PHONE_MAC'
    exit 1
fi

for i in $(arp -a | grep "$PHONE_MAC" | grep -v incomplete | awk '{print $2}' | tr -d '()'); do
    echo "Trying $i..."
    ping -c 1  -W 1 $i | grep '1 received' && break
done
