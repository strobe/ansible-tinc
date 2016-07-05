# Introduction

The primary purpose of this playbook is to isolate or secure the private network between VPS
(for example in case if your cloud provider has source/destination check(which may drop some of your packets)
 or shared private network).
 
By default it suitable for CentOS 7, but might be adopted to Debian based install too.

This set up a strongswan IPSec host-to-host tunnels between several servers. 

## Prerequisites

Your local machine must be able to use passwordless login to remote servces.

By default, this playbook will bind IP address on the `eth1` interface (private network interface),
which is specified at groups_vars. You have to update it to your private network interface 
(it very specific for your cloud provider).

### Create Inventory

Create a `/hosts` file with the nodes that you want to include in the VPN:

```
[cert-gen]
s1 ansible_host=162.243.1.x

[vpn]
s1 ansible_host=162.243.1.x
s2 ansible_host=162.243.1.x
s3 ansible_host=162.243.1.x
```

or 

```
[cert-gen]
s1 ansible_host=162.243.1.x

[vpn]
s1 vpn_ip=10.0.0.1 ansible_host=162.243.1.x
s2 vpn_ip=10.0.0.2 ansible_host=162.243.1.x
s3 vpn_ip=10.0.0.3 ansible_host=162.243.1.x
```

(in case Tinc VPN used as way create static IPs network over strongswan IPSec)

s1, s2, s3 - hostnames
'[cert-gen]' section constrain host which will be used for certificates generation.

 