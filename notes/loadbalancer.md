---
title: Load Balancing
date: 2021-01-18
---
# About
Basic functions
1. request balancing across multiple servers
2. request/response buffering (or not)
3. keep availability and reliability by sending request only to healthy servers
4. etc.

# Classification
There are five types of Load Balancing. The exact classification depends on the vendor, but here it is roughly classified according to the protocol that the load balancer terminates.

## L2 Load Balancing (Link Aggregation/Bonding)
Link Aggregation is well known as load balancing in ethernet. This is also one of the load balancing. 
Originating from Cisco's EtherChannel, it is defined as Link Aggregation by many vendors.
Bandwidth can be increased by using several source interfaces when transmitting Ethernet frames.
As a load balancing algorithm, hashes such as source / destination IP / Port are often used.
Of course, since it is based on hashing, you may not notice that the bandwidth has increased with a single TCP flow or the like. 

## L3 Load Balancing (IP Multipath)
This is a method of load balancing by L3 routing (ECMP). 
Hash is often used as a load balancing algorithm as well. 

## L4 Load Balancing (TCP/UDP)
## L7 Load Balancing (HTTP/HTTPS)
## Load Balancing by DNS
DNS may also perform load balancing. It is called DNS round robin. DNS round robin expects clients to connect to different IP addresses by rearranging the order of the DNS query response results. 
It is notorious that RFC3484 may not allow glibc's `getaddrinfo()` to be round-robind, as some clients may not behave as expected. 

# Load Balancing Algorithms
## Round Robin
## Hash
## Least Connection
## Least Time

# Other features
## Direct Server Return
This feature is L4 only.
DSR returns the response directly to the client without going through the load balancer.
