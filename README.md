# alpine-samba
samba built with alpine

Run container as below:

```
docker run -it -p 445:445 -v /mnt/nas:/mnt/nas -v /etc/samba/smb.conf:/etc/samba/smb.conf --name samba alpine-samba:late
st
```
