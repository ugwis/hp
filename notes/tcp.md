---
title: TCP Basics
date: 2022-01-18
---
# About

TCP (Transmission Control Protocol) is defined in [RFC793](https://datatracker.ietf.org/doc/html/rfc793).  
TCP implements the following to ensure reliability over an unreliable underlying protocol:   

- Arrival acknowledgement
- Error checking
- Retransmission
- Order of arrival
- Flow control
- QoS

# History
## RFC 33: New HOST-HOST Protocol
It was finalized in RFC 33 in early 1970, and deployed to all nodes on the ARPANET in December 1970.

## First paper "A Protocol for Packet Network Intercommunication."
Vinton Cerf and Robert Kahn submitted this at the IEEE Transactions on Communications conference in 1974.

## RFC 675: SPECIFICATION OF INTERNET TRANSMISSION CONTROL PROGRAM
RFC 675 was published in December 1974, but it was not fully functional in 1974.

## RFC 793: TRANSMISSION CONTROL PROTOCOL
RFC 675 was revised and two separate RFCs:
- RFC 791 “Internet Protocol”
- RFC 793 “Transmission Control Protocol”

## RFC 879: The TCP Maximum Segment Size
## RFC 1011: OFFICIAL INTERNET PROTOCOLS
## RFC 1122: Requirements for Internet Hosts -- Communication Layers
## RFC 2581: TCP Congestion Control
## RFC 2873: TCP Processing of the IPv4 Precedence Field
## RFC 5681: TCP Congestion Control
## RFC 5961: Improving TCP's Robustness to Blind In-Window Attacks
## RFC 6013: TCP Cokkie Transactions (TCPCT)
## RFC 6093: On the Implementation of the TCP Urgent Mechanism
## RFC 6298: Computing TCP's Retransmission Timer
## RFC 6429: TCP Sender Clarification for Persist Condition
## RFC 6528: Defending against Sequence Number Attacks
## RFC 6691: TCP Options and Maximum Segment Size (MSS)
## RFC 7413: TCP Fast Open
## RFC 793bis: Transmission Control Protocol (TCP) Specification


"IPv4" means 4th version of the original RFC ever published on the internet.

# TCP specification


## Datagram

```
    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |          Source Port          |       Destination Port        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                        Sequence Number                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Acknowledgment Number                      |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |  Data |           |U|A|P|R|S|F|                               |
   | Offset| Reserved  |R|C|S|S|Y|I|            Window             |
   |       |           |G|K|H|T|N|N|                               |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |           Checksum            |         Urgent Pointer        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Options                    |    Padding    |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                             data                              |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

### Source Port / Destination Port
A port number is a 16-bit integer ranging from 0 to 65535.

#### 0 - 1023: System Ports
#### 1024 - 49151: User Ports
#### 49152 - 65535: Dynamic and/or Private Ports

> **NOTE**: Different OS are known to use different ephemeral port ranges.
> Linux: 32768 - 6100 controlled by sysctl knob `net.ipv4.ip_local_port_range` and selected sequentially (not randomization) 
> MacOS: 49152-65535 (IANA suggestion)
> Windows (until XP): 1025-5000
> Windows (later Vista, 7, Server 2008): 49152-65535 (IANA suggestion)

### Sequence Number / Acknowledgement Number

### Flags
#### NS - ECN-nonce
#### CWR - Congestion window reduced
#### ECE - ECN-Echo
#### URG - Urgent
#### ACK - Acknowledgement
#### PSH - Push
#### RST - Reset
#### SYN - Synchronization
#### FIN - Finish

### Window Size


### Options

|  Kind  |  Length  | Meaning Reference                                                                           |
| ------ |  ------  | ------------------------------------------------------------------------------------------- |
| 0      |  -       | End of Option List        [RFC-ietf-tcpm-rfc793bis-28]                                      |
| 1      |  -       | No-Operation      [RFC-ietf-tcpm-rfc793bis-28]                                              |
| 2      |  4       | Maximum Segment Size      [RFC-ietf-tcpm-rfc793bis-28]                                      |
| 3      |  3       | Window Scale      [RFC7323]                                                                 |
| 4      |  2       | SACK Permitted    [RFC2018]                                                                 |
| 5      |  N       | SACK      [RFC2018]                                                                         |
| 6      |  6       | Echo (obsoleted by option 8)      [RFC1072][RFC6247]                                        |
| 7      |  6       | Echo Reply (obsoleted by option 8)        [RFC1072][RFC6247]                                |
| 8      |  10      | Timestamps        [RFC7323]                                                                 |
| 9      |  2       | Partial Order Connection Permitted (obsolete)     [RFC1693][RFC6247]                        |
| 10     |  3       | Partial Order Service Profile (obsolete)  [RFC1693][RFC6247]                                |
| 11     |          | CC (obsolete)     [RFC1644][RFC6247]                                                        |
| 12     |          | CC.NEW (obsolete)         [RFC1644][RFC6247]                                                |
| 13     |          | CC.ECHO (obsolete)        [RFC1644][RFC6247]                                                |
| 14     |  3       | TCP Alternate Checksum Request (obsolete)         [RFC1146][RFC6247]                        |
| 15     |  N       | TCP Alternate Checksum Data (obsolete)    [RFC1146][RFC6247]                                |
| 16     |          | Skeeter   [Stev_Knowles]                                                                    |
| 17     |          | Bubba     [Stev_Knowles]                                                                    |
| 18     |  3       | Trailer Checksum Option   [Subbu_Subramaniam][Monroe_Bridges]                               |
| 19     |  18      | MD5 Signature Option (obsoleted by option 29)     [RFC2385]                                 |
| 20     |          | SCPS Capabilities         [Keith_Scott]                                                     |
| 21     |          | Selective Negative Acknowledgements       [Keith_Scott]                                     |
| 22     |          | Record Boundaries         [Keith_Scott]                                                     |
| 23     |          | Corruption experienced    [Keith_Scott]                                                     |
| 24     |          | SNAP      [Vladimir_Sukonnik]                                                               |
| 25     |          | Unassigned (released 2000-12-18)                                                            |
| 26     |          | TCP Compression Filter    [Steve_Bellovin]                                                  |
| 27     |  8       | Quick-Start Response      [RFC4782]                                                         |
| 28     |  4       | User Timeout Option (also, other known unauthorized use) [***][1]         [RFC5482]         |
| 29     |          | TCP Authentication Option (TCP-AO)        [RFC5925]                                         |
| 30     |  N       | Multipath TCP (MPTCP)     [RFC8684]                                                         |
| 31     |          | Reserved (known unauthorized use without proper IANA assignment) [**]                       |
| 32     |          | Reserved (known unauthorized use without proper IANA assignment) [**]                       |
| 33     |          | Reserved (known unauthorized use without proper IANA assignment) [**]                       |
| 34     | variable | TCP Fast Open Cookie      [RFC7413]                                                         |
| 35-68  |          | Reserved                                                                                    |
| 69     |  N       | Encryption Negotiation (TCP-ENO)  [RFC8547]                                                 |
| 70     |          | Reserved (known unauthorized use without proper IANA assignment) [**]                       |
| 71-75  |          | Reserved                                                                                    |
| 76     |          | Reserved (known unauthorized use without proper IANA assignment) [**]                       |
| 77     |          | Reserved (known unauthorized use without proper IANA assignment) [**]                       |
| 78     |          | Reserved (known unauthorized use without proper IANA assignment) [**]                       |
| 79-252 |          | Reserved                                                                                    |
| 253    |  N       | RFC3692-style Experiment 1 (also improperly used for shipping products) [*]       [RFC4727] |
| 254    |  N       | RFC3692-style Experiment 2 (also improperly used for shipping products) [*]       [RFC4727] |

(Source of the table: https://www.iana.org/assignments/tcp-parameters/tcp-parameters.xhtml)



#### MSS

The maximum segment size (MSS) is a parameter of the options field of the TCP header that specifies the largest amount of data.

> **NOTE**: MSS Clamping

#### Timestamp
#### SACK Permitted
#### SACK
#### Window Scaling

## TCP State Machine
![TCP State Machine](https://quickchart.io/graphviz?layout=neato&graph=digraph%20tcp_state%20{splines=false;CLOSED1[label=%22CLOSED%22,pos%20=%20%220,0!%22];LISTEN[pos=%220,-2!%22];SYN_RCVD[pos=%22-3,-3!%22];SYN_SENT[pos=%223,-3!%22];ESTABLISHED[pos=%220,-4!%22];FIN_WAIT_1[pos=%22-3,-5!%22];FIN_WAIT_2[pos=%22-3,-7!%22];CLOSING[pos=%220,-5!%22];TIME_WAIT[pos=%220,-7!%22];CLOSE_WAIT[pos=%223,-5!%22];LAST_ACK[pos=%223,-7!%22];CLOSED2[label=%22CLOSED%22,pos=%220,-9!%22];CLOSED1%20-%3E%20LISTEN%20[label=%22appl:passive%20open\nsend:%3Cnothing%3E%22];CLOSED1%20-%3E%20SYN_SENT%20[label=%22%20%20appl:active%20open%20%20\n%20%20send:SYN%20%20%22];LISTEN%20-%3E%20SYN_RCVD%20[label=%22recv:SYN\nsend:SYN,ACK%22];LISTEN%20-%3E%20SYN_SENT%20[label=%22appl:send%20data\nsend:SYN%22];SYN_RCVD%20-%3E%20LISTEN%20[label=%22recv:RST%22];SYN_RCVD%20-%3E%20CLOSED1%20[label=%22timeout%20send:RST%22];SYN_RCVD%20-%3E%20FIN_WAIT_1%20[label=%22appl:close\nsend:FIN%22];SYN_RCVD%20-%3E%20ESTABLISHED%20[label=%22recv:ACK\nsend:%3Cnothing%3E%22];SYN_SENT%20-%3E%20SYN_RCVD%20[label=%22recv:SYN%20send:SYN,ACK%20simultaneous%20open%22];SYN_SENT%20-%3E%20CLOSED1%20[label=%22%20%20appl:close%20%20\n%20%20or%20timeout%20%20%22];SYN_SENT%20-%3E%20ESTABLISHED%20[label=%22recv:SYN,ACK\nsend:ACK%22];ESTABLISHED%20-%3E%20CLOSE_WAIT%20[label=%22recv:FIN\nsend:ACK%22];ESTABLISHED%20-%3E%20FIN_WAIT_1%20[label=%22appl:close\nsend:FIN%22];CLOSE_WAIT%20-%3E%20LAST_ACK%20[label=%22appl:close\nsend:FIN%22];LAST_ACK%20-%3E%20CLOSED2%20[label=%22recv:ACK\nsend:%3Cnothing%3E%22];FIN_WAIT_1%20-%3E%20CLOSING%20[label=%22recv:FIN\nsend:ACK%22];FIN_WAIT_1%20-%3E%20TIME_WAIT%20[label=%22recv:FIN,ACK\nsend:ACK%22];FIN_WAIT_1%20-%3E%20FIN_WAIT_2%20[label=%22recv:ACK\nsend:%3Cnothing%3E%22];CLOSING%20-%3E%20TIME_WAIT%20[label=%22recv:ACK\nsend:%3Cnothing%3E%22];FIN_WAIT_2%20-%3E%20TIME_WAIT%20[label=%22recv:FIN\nsend:ACK%22];TIME_WAIT%20-%3E%20CLOSED2%20;})

# Features

## 3-wayhandshake


## Flow Control
Flow control is a function that notifies each other of the amount that can be received and avoids a buffer overflow and a heavy load on the receiver.

Window Scaling (RFC 1323)
`window-size = window(0~65535) * 2^shift.cnf(0~14 or -1)`  
rwnd (receive window size)
```
sysctl net.ipv4.tcp_window_scaling
```

## Congestion Control
cwnd (congestion window size)
ssthresh(slow start threshold)

- Loss Based (Tahoe/Reno/New Reno/Cubic)
- Delay Based (Vegas/BBR)
- Loss + Delay Based (compound TCP)

### Loss Based Congestion Control
### Delay Based Congestion Control
### Loss + Delay Based Congestion Control

# Well-known issues

## Congestion collapse

# TCP Tips
## TCP_DEFER_ACCEPT
Linux Kernel 2.6.32 or >
## TCP Fast Open
