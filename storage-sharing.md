# Storage Sharing Protocols

Протоколы:
- SMB - старый и медленный протокол.
- NFS (Network Filesystem)
- iSCSI

## NFS

- https://wiki.debian.org/NFSServerSetup
- https://www.linode.com/docs/guides/how-to-mount-nfs-shares-on-debian-9/


## What is different about NFS and iSCSI?

NFS and iSCSI are fundamentally different ways of data sharing. NFS is built for data sharing among multiple client machines. On the opposite end, iSCSI is a block protocol which supports a single client for each volume on the server. 

source: https://www.promax.com/blog/whats-the-difference-nfs-vs-iscsi