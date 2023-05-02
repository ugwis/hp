---
title: Python Networking
date: 2023-04-29
hstyle: ""
---
# TCP Client
```
import socket

HOST = 'google.com'
PORT = 80
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))
    s.sendall(b'GET / HTTP/1.1\nHost: google.com\n\n')
    data = s.recv(1024)
print('Received', repr(data))
```

# TCP Server
```
import socket

ADDR = socket.gethostbyname(socket.gethostname())
PORT = 80

with socket.socket() as s:
    s.bind((ADDR, PORT))
    s.listen(5)
    
    while True:
        client, _ = s.accept()
        print(client.recv(1024))
        client.close()
```
