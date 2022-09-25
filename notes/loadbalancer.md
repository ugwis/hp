---
title: Load Balancing basics
date: 2021-01-18
hstyle: background: url("/images/loadbalancer.png"); line-height: 300px;
---
# About
Basic functions

- Distribute request across multiple servers
- Buffer request/response (or not)
- Keep high availability and high reliability by sending request only to healthy servers
- Reduce the number of connections your server receives
- etc.

# Classification
There are several types of Load Balancing. The exact classification depends on the vendor, but here it is roughly classified according to the protocol that the load balancer terminates or independent from upper layer.

> **NOTE**: Some of the load balancer (like haproxy) enables you to use TLS SNI in TCP mode without TLS termination to route to target servers.


## L2 Load Balancing (Link Aggregation/Bonding)
Link Aggregation (LAG) is well known as load balancing in ethernet. This is also one of the load balancing. Originating from Cisco's EtherChannel, it is defined as Link Aggregation by many vendors.  
Bandwidth can be increased by using several source interfaces when transmitting Ethernet frames. As a load balancing algorithm, hashes such as source / destination IP / Port are often used.  
  
Pros

- Products from many network vendors are compatible, and it is relatively easy to increase bandwidth. 
  
Cons

- Since it's hash-based, it may not increase bandwidth for a single TCP connection.

> **NOTE**: Link Aggregation requires the same configuration the same link at both ends of the connection so that in case of only one side detect failure, cause inconsistency.
> LACP negotiates configuration and detection of failure automatically.


## L3 Load Balancing (IP Multipath)
This is a method of load balancing by L3 routing (ECMP). 
Hash is often used as a load balancing algorithm as well. 
If you use NAT (Network Address Transmission) at the router, 
  
Pros

- Due to the relative simplicity of processing, it is possible to build distributed systems using software.
- Currently, most communication uses IP and is less susceptible to specification changes in upper layers.
  
Cons

- Since it's hash-based, it may not increase bandwidth for a single TCP connection.


## L4 Load Balancing (TCP/UDP)
  
Pros

- TCP/UDP are terminated in Load Balancer and split into front-end connection and back-end connection so that it's able to reduce RTT.
  
Cons

- Basically, upper layer controls (such as HTTP host headers) can't be applied
- The cost of implementing TCP termination from scratch is high. Connection tracking is essential for building a distributed system.

> **NOTE**: Some L4 load balancer such as haproxy parse upper layer protocol like TLS SNI transparently and forward by it.
> More details: https://cbonte.github.io/haproxy-dconv/1.9/configuration.html#7.3.5-req.ssl_sni


## L7 Load Balancing (HTTP/HTTPS)
L7 load balancing terminates Application Protocol such as HTTP/HTTPS. It's also known `proxy`

### Forward Proxy
Forward proxies are rarely used for load balancing. Basically, it is used for intra-net monitoring and security improvement.
For HTTP, the CONNECT method is implemented and the proxy server connects on behalf of the client.

### Reverse Proxy
Reverse proxy receives requests behalf of server and forward many back-end servers. 

## Load Balancing by DNS
DNS may also perform load balancing. It is called DNS round robin or GSLB (Global Server Load Balancing).

### DNS round robin 
DNS round robin expects clients to connect to different IP addresses by rearranging the order of the DNS query response results. 

> **NOTE**: It is notorious that RFC3484 may not allow glibc's `getaddrinfo()` to be round-robind, as some clients may not behave as expected. 


### Global Server Load Balancing (GSLB)
GSLB is a method of hosting in multiple locations such as Tokyo and Osaka for disaster recovery and load balancing, and controlling it with DNS responses.


# Load Balancing Algorithms
## Round Robin

## Hash

## Least Connection

## Least Time


# Other features

## Direct Server Return
This feature is L4 only.
DSR returns the response directly to the client without going through the load balancer.
