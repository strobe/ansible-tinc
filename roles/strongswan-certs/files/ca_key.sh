#!/bin/bash
if [ "$#" -eq 3 ]; then
	C=$1
	O=$2
	CN=$3
	echo "generating keys for $C, $O, $CN ..."
else
	echo "usage:\n sh ca_key.sh Run this script in directory to store your keys"
	exit 1
fi

mkdir -p private && mkdir -p cacerts && mkdir -p certs

strongswan pki --gen --type rsa --size 4096 --outform pem > private/strongswanKey.pem
strongswan pki --self --ca --lifetime 3650 --in private/strongswanKey.pem --type rsa --dn "C=$C, O=$O, CN=$CN" --outform pem > cacerts/strongswanCert.pem
echo 'CA certs at cacerts/strongswanCert.pem\n'
strongswan pki --print --in cacerts/strongswanCert.pem
