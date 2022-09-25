---
title: ICMP
date: 2022-07-18
hstyle:
---
# ICMP Parameters

from https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml

## Type 0 — Echo Reply
| Codes | Description                                                           | Reference | 
| ----- | --------------------------------------------------------------------- | --------- |
| 0     | No Code                                                               |           |

## Type 3 — Destination Unreachable
| Codes | Description                                                           | Reference |
| ----- | --------------------------------------------------------------------- | --------- |
| 0 	| Net Unreachable                                                       | [RFC792]  |
| 1 	| Host Unreachable                                                      | [RFC792]  |
| 2 	| Protocol Unreachable                                                  | [RFC792]  |
| 3 	| Port Unreachable                                                      | [RFC792]  |
| 4 	| Fragmentation Needed and Don't Fragment was Set                       | [RFC792]  |
| 5 	| Source Route Failed                                                   | [RFC792]  |
| 6 	| Destination Network Unknown                                           | [RFC1122] |
| 7 	| Destination Host Unknown                                              | [RFC1122] |
| 8 	| Source Host Isolated                                                  | [RFC1122] |
| 9 	| Communication with Destination Network is Administratively Prohibited | [RFC1122] |
| 10 	| Communication with Destination Host is Administratively Prohibited    | [RFC1122] |
| 11 	| Destination Network Unreachable for Type of Service                   | [RFC1122] |
| 12 	| Destination Host Unreachable for Type of Service                      | [RFC1122] |
| 13 	| Communication Administratively Prohibited                             | [RFC1812] |
| 14 	| Host Precedence Violation                                             | [RFC1812] |
| 15 	| Precedence cutoff in effect                                           | [RFC1812] |

## Type 5 — Redirect
| Codes | Description                                                           | Reference |
| ----- | --------------------------------------------------------------------- | --------- |
| 0     | Redirect Datagram for the Network (or subnet) 	                |           |
| 1     | Redirect Datagram for the Host 	                                |           |
| 2     | Redirect Datagram for the Type of Service and Network 	        |           |
| 3     | Redirect Datagram for the Type of Service and Host                    |           |

## Type 8 — Echo
| Codes | Description                                                           | Reference | 
| ----- | --------------------------------------------------------------------- | --------- |
| 0     | No Code                                                               |           |


## Type 9 — Router Advertisement
| Codes | Description                                                           | Reference | 
| ----- | --------------------------------------------------------------------- | --------- |
| 0     | Normal router advertisement                                           | [RFC3344] |
| 16    | Does not route common traffic                                         | [RFC3344] |

## Type 10 — Router Selection
| Codes | Description                                                           | Reference | 
| ----- | --------------------------------------------------------------------- | --------- |
| 0     | No Code                                                               |           |


## Type 11 — Time Exceeded
| Codes | Description                                                           | Reference | 
| ----- | --------------------------------------------------------------------- | --------- |
| 0     | Time to Live exceeded in Transit                                      |           |
| 1     | Fragment Reassembly Time Exceeded                                     |           |

## Type 12 — Parameter Problem
| Codes | Description                                                           | Reference | 
| ----- | --------------------------------------------------------------------- | --------- |
| 0     | Pointer indicates the error                                           |           |
| 1     | Missing a Required Option                                             | [RFC1108] |
| 2     | Bad Length                                                            |           |

## Type 13 — Timestamp
| Codes | Description                                                           | Reference | 
| ----- | --------------------------------------------------------------------- | --------- |
| 0     | No Code                                                               |           |


## Type 14 — Timestamp Reply
| Codes | Description                                                           | Reference | 
| ----- | --------------------------------------------------------------------- | --------- |
| 0     | No Code                                                               |           |


## Type 19 — Reserved (for Security)
## Types 20-29 — Reserved (for Robustness Experiment)
## Type 40 — Photuris
| Codes | Description                                                           | Reference | 
| ----- | --------------------------------------------------------------------- | --------- |
| 0 	| Bad SPI                                                               |           |
| 1 	| Authentication Failed                                                 |           |
| 2 	| Decompression Failed                                                  |           |
| 3 	| Decryption Failed                                                     |           |
| 4 	| Need Authentication                                                   |           |
| 5     | Need Authorization                                                    |           |

## Type 41 — ICMP messages utilized by experimental mobility protocols such as Seamoby
## Type 42 — Extended Echo Request
| Codes | Description                                                           | Reference | 
| ----- | --------------------------------------------------------------------- | --------- |
| 0     | No Error                                                              | [RFC8335] |

## Type 43 — Extended Echo Reply
| Codes | Description                                                           | Reference | 
| ----- | --------------------------------------------------------------------- | --------- |
| 0     | No Error                                                              | [RFC8335] |
| 1     | Malformed Query                                                       | [RFC8335] |
| 2     | No Such Interface                                                     | [RFC8335] |
| 3     | No Such Table Entry                                                   | [RFC8335] |
| 4     | Multiple Interfaces Satisfy Query                                     | [RFC8335] |

## Type 253 — RFC3692-style Experiment 1
## Type 254 — RFC3692-style Experiment 2

