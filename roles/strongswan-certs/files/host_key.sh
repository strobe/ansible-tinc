#!/bin/bash
if [ "$#" -eq 3 ]; then
	C=$1
	O=$2
	CN=$3
	echo "generating keys for $C, $O, $CN ..."
else
	echo "usage:\n sh server_key.sh YOUR EXACT HOST NAME or SERVER IP\n Run this script in directory to store your keys"
	exit 1
fi

echo 'CA certs at cacerts/strongswanCert.pem\n'
strongswan pki --print --in cacerts/strongswanCert.pem

sleep 1
echo "\ngenerating server keys ..."
strongswan pki --gen --type rsa --size 2048 --outform pem > private/$CN-hostKey.pem
strongswan pki --pub --in private/$CN-hostKey.pem --type rsa | \
	strongswan pki --issue --lifetime 730 \
	--cacert cacerts/strongswanCert.pem \
	--cakey private/strongswanKey.pem \
	--dn "C=$C, O=$O, CN=$CN" \
	--san $CN \
	--flag serverAuth --flag ikeIntermediate \
	--outform pem > certs/$CN-hostCert.pem
echo "vpn server cert at certs/$CN-hostCert.pem\n"
strongswan pki --print --in certs/$CN-hostCert.pem
