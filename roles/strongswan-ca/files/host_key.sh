#!/bin/bash
if [ $1 ];	then
	CN=$1
	echo "generating keys for $CN ..."
else
	echo "usage:\n sh server_key.sh YOUR EXACT HOST NAME or SERVER IP\n Run this script in directory to store your keys"
	exit 1
fi

echo "C=CH, O=VULTR-VPS-CENTOS, CN=$CN" >> certsOUT-$CN.txt

echo 'CA certs at cacerts/strongswanCert.pem\n'
pki --print --in cacerts/strongswanCert.pem

sleep 1
echo "\ngenerating server keys ..."
pki --gen --type rsa --size 2048 --outform pem > private/$CN-hostKey.pem
pki --pub --in private/$CN-hostKey.pem --type rsa | \
	pki --issue --lifetime 730 \
	--cacert cacerts/strongswanCert.pem \
	--cakey private/strongswanKey.pem \
	--dn "C=CH, O=VULTR-VPS-CENTOS, CN=$CN" \
	--san $CN \
	--flag serverAuth --flag ikeIntermediate \
	--outform pem > certs/$CN-hostCert.pem
echo "vpn server cert at certs/$CN-hostCert.pem\n"
pki --print --in certs/$CN-hostCert.pem
