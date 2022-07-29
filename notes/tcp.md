---
title: TCP Basics
date: 2022-01-18
---
# About

TCP (Transmission Control Protocol) is defined in [RFC793](https://datatracker.ietf.org/doc/html/rfc793).

# Histroy
## Origin
## RFC 33: New HOST-HOST Protocol
It was finalized in RFC 33 in early 1970, and deployed to all nodes on the ARPANET in December 1970.

## RFC 675: SPECIFICATION OF INTERNET TRANSMISSION CONTROL PROGRAM

## RFC 793: TRANSMISSION CONTROL PROTOCOL

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

## Flags
### NS - ECN-nonce
### CWR - Congestion window reduced
### ECE - ECN-Echo
### URG - Urgent
### ACK - Acknowledgement
### PSH - Push
### RST - Reset
### SYN - Synchronization
### FIN - Finish



## Options

|  Kind  |  Length  | Meaning Reference |
|  ----  |   ----   |       ----        |
| 0      |  -       | End of Option List        [RFC-ietf-tcpm-rfc793bis-28] |
| 1      |  -       | No-Operation      [RFC-ietf-tcpm-rfc793bis-28] |
| 2      |  4       | Maximum Segment Size      [RFC-ietf-tcpm-rfc793bis-28] |
| 3      |  3       | Window Scale      [RFC7323] |
| 4      |  2       | SACK Permitted    [RFC2018] |
| 5      |  N       | SACK      [RFC2018] |
| 6      |  6       | Echo (obsoleted by option 8)      [RFC1072][RFC6247] |
| 7      |  6       | Echo Reply (obsoleted by option 8)        [RFC1072][RFC6247] |
| 8      |  10      | Timestamps        [RFC7323] |
| 9      |  2       | Partial Order Connection Permitted (obsolete)     [RFC1693][RFC6247] |
| 10     |  3       | Partial Order Service Profile (obsolete)  [RFC1693][RFC6247] |
| 11     |          | CC (obsolete)     [RFC1644][RFC6247] |
| 12     |          | CC.NEW (obsolete)         [RFC1644][RFC6247] |
| 13     |          | CC.ECHO (obsolete)        [RFC1644][RFC6247] |
| 14     |  3       | TCP Alternate Checksum Request (obsolete)         [RFC1146][RFC6247] |
| 15     |  N       | TCP Alternate Checksum Data (obsolete)    [RFC1146][RFC6247] |
| 16     |          | Skeeter   [Stev_Knowles] |
| 17     |          | Bubba     [Stev_Knowles] |
| 18     |  3       | Trailer Checksum Option   [Subbu_Subramaniam][Monroe_Bridges] |
| 19     |  18      | MD5 Signature Option (obsoleted by option 29)     [RFC2385] |
| 20     |          | SCPS Capabilities         [Keith_Scott] |
| 21     |          | Selective Negative Acknowledgements       [Keith_Scott] |
| 22     |          | Record Boundaries         [Keith_Scott] |
| 23     |          | Corruption experienced    [Keith_Scott] |
| 24     |          | SNAP      [Vladimir_Sukonnik] |
| 25     |          | Unassigned (released 2000-12-18)   |
| 26     |          | TCP Compression Filter    [Steve_Bellovin] |
| 27     |  8       | Quick-Start Response      [RFC4782] |
| 28     |  4       | User Timeout Option (also, other known unauthorized use) [***][1]         [RFC5482] |
| 29     |          | TCP Authentication Option (TCP-AO)        [RFC5925] |
| 30     |  N       | Multipath TCP (MPTCP)     [RFC8684] |
| 31     |          | Reserved (known unauthorized use without proper IANA assignment) [**]      |
| 32     |          | Reserved (known unauthorized use without proper IANA assignment) [**]      |
| 33     |          | Reserved (known unauthorized use without proper IANA assignment) [**]      |
| 34     | variable | TCP Fast Open Cookie      [RFC7413] |
| 35-68  |          | Reserved   |
| 69     |  N       | Encryption Negotiation (TCP-ENO)  [RFC8547] |
| 70     |          | Reserved (known unauthorized use without proper IANA assignment) [**]      |
| 71-75  |          | Reserved   |
| 76     |          | Reserved (known unauthorized use without proper IANA assignment) [**]      |
| 77     |          | Reserved (known unauthorized use without proper IANA assignment) [**]      |
| 78     |          | Reserved (known unauthorized use without proper IANA assignment) [**]      |
| 79-252 |          | Reserved   |
| 253    |  N       | RFC3692-style Experiment 1 (also improperly used for shipping products) [*]       [RFC4727] |
| 254    |  N       | RFC3692-style Experiment 2 (also improperly used for shipping products) [*]       [RFC4727] |

(Source of the table: https://www.iana.org/assignments/tcp-parameters/tcp-parameters.xhtml)



# MSS

The maximum segment size (MSS) is a parameter of the options field of the TCP header that specifies the largest amount of data.

## MSS Clamping

# Features

## 3-wayhandshake


## Flow Control
Flow control is a function that notifies the sender of the amount that can be received and avoids a buffer overflow and a heavy load on the receiver.

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
