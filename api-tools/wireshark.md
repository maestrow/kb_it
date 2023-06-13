## Decrypting your own HTTPS traffic with Wireshark

- [Decrypting your own HTTPS traffic with Wireshark](https://www.trickster.dev/post/decrypting-your-own-https-traffic-with-wireshark/)

Usefull filters:

- `http2`
- `json`
- `ip.addr == ...`

Q: How to find decrypted packets? A: Sort by protocol and scroll, look at green lines. 


## Decrypting VPN traffic

see Chat GPT conversation.

## NodeJs

- [How to use Wireshark with Node.js (especially with HTTPS / TLS / SSL)](https://gist.github.com/dfrankland/0fec2cd565f1f7b78fb0e3ededf36b89)

- NodeJS has [`--tls-keylog=file`](https://nodejs.org/api/cli.html#--tls-keylogfile) CLI option since v12.16.0. Log TLS key material to a file. The key material is in NSS SSLKEYLOGFILE format and can be used by software (such as Wireshark) to decrypt the TLS traffic.

## dumpcap

source: https://tldr.sh/

> A network traffic dump tool.
> More information: <https://www.wireshark.org/docs/man-pages/dumpcap.html>.

- Display available interfaces:

`dumpcap --list-interfaces`

- Capture packets on a specific interface:

`dumpcap --interface {{1}}`

- Capture packets to a specific location:

`dumpcap --interface {{1}} -w {{path/to/output_file.pcapng}}`

- Write to a ring buffer with a specific max file limit of a specific size:

`dumpcap --interface {{1}} -w {{path/to/output_file.pcapng}} --ring-buffer filesize:{{500000}} --ring-buffer files:{{10}}`