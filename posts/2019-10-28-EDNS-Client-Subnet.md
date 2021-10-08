---
title: EDNS Client Subnet  (ECS) とは
tags: dns edns
author: ugwis
slide: false
---
## 従来の DNS の問題点
多くの権威サーバはクライアントの位置によって異なるレスポンスを返すようになっています。
これは、地理的に近接したエッジサーバへリクエストをルーティングし応答を早くする目的や、一部の国にのみコンテンツを配信するといった目的で使用されている為です。

ただし、従来の DNS の仕組みでは実クライアントの地理的な位置情報を特定するのは困難です。
権威サーバはクエリの送信元 IP から位置情報を推定しますが、キャッシュサーバと実際のクライアントが地理的に近いとは限らない為です。

<img width="945" alt="ecs-not-supported.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/65198/54b285b0-21bd-29fc-7a6a-1e7e2d9cbccc.png">

また、Open Resolver (Google Public DNS など) のような、クライアントがキャッシュサーバを選べる時代になっていることも影響します。

## ECS (EDNS-Client-Subnet) とは
上述するような問題を解消するために、RFC7871 で規定される DNS プロトコル拡張 (EDNS0) の ECS が用いられます。
ECS に対応すると、実クライアントのサブネット範囲を伝達し権威サーバが位置情報を推定する精度が向上します。

<img width="945" alt="ecs-supported.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/65198/63706f0a-8d6e-8509-2990-96ca4f1a3d7c.png">

### リクエスト

キャッシュサーバはクライアントから ECS でないクエリを受け取った場合、送信元 IP からサブネットを含め権威サーバへ問い合わせを行います。
サブネットは maximum cacheable prefix (キャッシュサーバがキャッシュを許容する最大プレフィックス長) により定められ問い合わせを行います。

>In the usual case, where no ECS option was present in the client
   query, the Recursive Resolver initializes the option by setting
   FAMILY of the client's address.  It then uses the value of its
   maximum cacheable prefix length to set SOURCE PREFIX-LENGTH.  For
   privacy reasons, and because the whole IP address is rarely required
   to determine a tailored response, this length SHOULD be shorter than
   the full address, as described in Section 11.
https://tools.ietf.org/html/rfc7871#section-7.1.1

<img width="754" alt="no-ecs-option.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/65198/8551f70c-81a3-412f-df00-38ccbbc85481.png">

一方、ECS が付与されたクエリをキャッシュサーバが受け取った場合、自身の maximum cacheable prefix と付与された SOURCE PREFIX-LENGTH (通知されたクライアントのサブネット) を比較し、プレフィックスの短い（サブネットの範囲が広い）方を採用します。

>If the triggering query included an ECS option itself, it MUST be
   examined for its SOURCE PREFIX-LENGTH.  The Recursive Resolver's
   outgoing query MUST then set SOURCE PREFIX-LENGTH to the shorter of
   the incoming query's SOURCE PREFIX-LENGTH or the server's maximum
   cacheable prefix length.
https://tools.ietf.org/html/rfc7871#section-7.1.1

<img width="754" alt="ecs-option.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/65198/17cb2e3f-8dad-53b7-570f-f534a8e70f54.png">

多くの場合、権威サーバへ通知するサブネットは /32 である必要なく、プライバシーの観点からもプレフィックスは短くするように規定されています。

### レスポンス
権威サーバがクライアントの IP アドレスによって異なるレスポンスを返すのであれば、キャッシュサーバもクライアントの IP アドレスごとにキャッシュする必要があります。
>In the cache, all resource records in the Answer section MUST be tied
   to the network specified in the response.  The appropriate prefix
   length depends on the relationship between SOURCE PREFIX-LENGTH,
   SCOPE PREFIX-LENGTH, and the maximum cacheable prefix length
   configured for the cache.
https://tools.ietf.org/html/rfc7871#section-7.3.1

権威サーバからのレスポンスにはプレフィックス (SCOPE PREFIX-LENGTH) が含まれます。
SCOPE PREFIX-LENGTH が SOURCE PREFIX-LENGTH (通知したクライアントのサブネット) より長い場合は、細かい粒度 (長いプレフィックス) の応答を返す可能性があるので、SOURCE PREFIX-LENGTH を長くし再度リクエストする必要があります。

<img width="985" alt="ecs-cache-behavior.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/65198/f2daf130-89df-623f-858f-875c7baf3960.png">

## ECS (EDNS Client Subnet) を試す
ECS オプションはクライアントから付与し問い合わせることも可能です。

Google Public DNS は EDNS0 に対応しているため、キャッシュサーバとして 8.8.8.8 を使います。

eDNS0 Client Subnet - Interconnect Help
https://support.google.com/interconnect/answer/7658602?hl=en

#### 208.67.222.2/32 から Google Public DNS に対し www.google.com を解決すると想定
```
$ dig www.google.com +subnet=208.67.222.2/32 @8.8.8.8                                                                                       
                                                                                                                                                              
; <<>> DiG 9.10.6 <<>> www.google.com +subnet=208.67.222.2/32 @8.8.8.8                                                                                        
;; global options: +cmd                                                                                                                                       
;; Got answer:                                                                                                                                                
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 57181                                                                                                     
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1                                                                                          
                                                                                                                                                              
;; OPT PSEUDOSECTION:                                                                                                                                         
; EDNS: version: 0, flags:; udp: 512                                                                                                                          
; CLIENT-SUBNET: 208.67.222.2/32/24                                                                                                                           
;; QUESTION SECTION:                                                                                                                                          
;www.google.com.                        IN      A                                                                                                             
                                                                                                                                                              
;; ANSWER SECTION:                                                                                                                                            
www.google.com.         299     IN      A       216.58.208.100                                                                                                
                                                                                                                                                              
;; Query time: 37 msec                                                                                                                                        
;; SERVER: 8.8.8.8#53(8.8.8.8)                                                                                                                                
;; WHEN: Sun Oct 27 23:57:52 JST 2019                                                                                                                         
;; MSG SIZE  rcvd: 71
```

/24 でキャッシュされているようです。
ということは、208.67.222.0 - 208.67.222.254 の範囲からのリクエストであれば 216.58.208.100 が返ってくるはずです。

#### 208.67.222.3/32 から

```
$ dig www.google.com +subnet=208.67.222.3/32 +short @8.8.8.8
216.58.208.100
```

#### 208.67.222.254/32 から
```
$ dig www.google.com +subnet=208.67.222.254/32 +short @8.8.8.8
216.58.208.100
```
合っていそうですね。

#### 208.67.221.0/32 から
```
$ dig www.google.com +subnet=208.67.221.0/32 +short @8.8.8.8       
172.217.2.4
```
208.67.222.0/24 の範囲を外れたので別の値が返ってきました。

