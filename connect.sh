#!/bin/sh

/etc/init.d/ssh restart

echo "nameserver 8.8.8.8"  > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
/bin/sh -c "echo $VPN_PASS | openconnect $VPN_URL $VPN_EXTRA_PARAMS --user=$VPN_USER --passwd-on-stdin" 2> /dev/null

echo "Murió la flor"
