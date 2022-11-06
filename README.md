# aes-benchmark

**'openssl speed aes'** return is not really clear so I wrote a script that indicates how many Mbps per second it's possible to encrypt in **AES** on a single core

Create a ram disk :
```
mkdir /tmp/aes/
sudo mount -t tmpfs -o size=1200m tmpfs /tmp/aes/
```

Create a 512Mb random file :
```
dd if=/dev/urandom of=/tmp/aes/512m-plain bs=1M count=512 conv=fsync
```

Run the script :
```
./aes-benchmark.sh
```

Umount the ram disk : 
```
sudo umount  /tmp/aes
```

# Examples

On a laptop with a gen9 i7 :

```
AES-128-CBC
0.932s
549.356 Mbps

AES-192-CBC
1.042s
491.363 Mbps

AES-256-CBC
1.141s
448.729 Mbps
```

On a NAS with an arm9

```
AES-128-CBC
2.399s
213.422 Mbps

AES-192-CBC
2.343s
218.523 Mbps

AES-256-CBC
2.431s
210.613 Mbps
```
