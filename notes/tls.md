---
title: SSL/TLS Basics
date: 2022-07-19
---
# About

TLS(Transport Layer Security) serve below features.

## Encryption
Establish a secure data channel with negotiated ciphersuites and keys.

## Integirty
Ensure message integrity.

## Authentication
Both peers identify based on the established chain of trust.

# History
## SSL v1 by Netscape
SSL v1 by Netscape never released in 1994

## SSL v2 
SSL v2 integrated in netscape 1.1 in 1995
Badly broken

## SSL v3
SSL v3 redesigned from scratch by Netscape in 1996
POODLE vulnerability in SSL v3 found at 2014(CVE-2014-3566)

## TLS 1.0
First IETF design RFC 2246 in 1996-1999
TLS v1.0 = SSLv3.1. However not backward compatible with SSL 3.0

## TLS 1.1
RFC 4346 in 2006

## DTLS
DTLS support UDP at RFC 4347

## TLS 1.2
default SHA-256

## TLS 1.3
- Faster hanshake
- Key exchange parameters in suppoted_groups and key_share in the first Client Hello
- Uses PSK instead of both of Session ID and Session Tiket are deprecated

# Cipher suite
A cipher suite is a set of algorithms that help secure network connection. The set of algorithms that ciper suites usually contain include: key exchange algorithm, bulk encryption algorithm, and message authnetication code(MAC).
