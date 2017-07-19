#!/bin/bash
# ddd
while true;
do
    TIMEOUT=5
    SITE_TO_CHECK="WWW.QQ.COM"
    RET_CODE=`curl -I -s --connect-timeout $TIMEOUT $SITE_TO_CHECK -w %{http_code} | tail -n1`
    if [ "x$RET_CODE" = "x200" ]; then
	echo "Network OK, will send mail.."
	break
    else
	echo "Network not ready, wait..."
	sleep 1s
    fi
done
#
ETH0_IP_ADDR=`ifconfig enp0s3 | sed -n "2,2p" | awk '{print substr($2,1)}'`
#
echo "Current time: `date '+%F %T'`. Enjoy it" | mutt -s "IP Address of RPI: $ETH0_IP_ADDR" 51255356@QQ.COM
