#!/bin/bash

if [ $1 ];	then
	CN=$1
	echo "generating keys for $CN ..."
else
	echo "usage:\n sh ca_key.sh Run this script in directory to store your keys"
	exit 1
fi

echo "C=CH, O=VULTR-VPS-CENTOS, CN=$CN" >> certsOUT-$CN.txt

mkdir -p private && mkdir -p cacerts && mkdir -p certs

pki --gen --type rsa --size 4096 --outform pem > private/strongswanKey.pem
pki --self --ca --lifetime 3650 --in private/strongswanKey.pem --type rsa --dn "C=CH, O=VULTR-VPS-CENTOS, CN=$CN" --outform pem > cacerts/strongswanCert.pem
echo 'CA certs at cacerts/strongswanCert.pem\n'
pki --print --in cacerts/strongswanCert.pem
