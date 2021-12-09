
# Привязка домена к хостингу

В панели управления sweb есть возможность купить доменное имя. Т.о. Space Web выступает в роли партнера для компаний-регистраторов. Проверить каким регистратором был зарегистрировал ваш домен можно через сервис или команду whois. 

Если вы хотите перерегистрировать домен на другой хостинг, то нужно указать в настройках вашего доменна сервера хостинга. Если домен был куплен чререз sweb, то получить доступ к на

В статье [СМЕНА DNS-СЕРВЕРОВ](https://help.sweb.ru/entry/97/) написано как получить доступ к настройкам домена (к личному кабинету регистратора). 

Если вы хотите привязать доменное имя к хостингу sweb, то укажите следующие сервера DNS в настройках вашего домена:

- ns1.spaceweb.ru
- ns2.spaceweb.ru
- ns3.spaceweb.pro
- ns4.spaceweb.pro


## Выявление проблем с DNS

- https://blog.dnsimple.com/2017/08/debugging-dns/
- https://superuser.com/questions/367969/how-can-i-direct-a-query-to-specific-dns-server


Утилиты для разбора проблем с DNS:

- whois example.com
- dig example.com
- dig example.com +trace
- nslookup example.com f.root-servers.net


# Примеры ответов команд whois и dig

```
$ whois example.com
% By submitting a query to RIPN's Whois Service
% you agree to abide by the following terms of use:
% http://www.ripn.net/about/servpol.html#3.2 (in Russian) 
% http://www.ripn.net/about/en/servpol.html#3.2 (in English).

domain:        example.com
nserver:       ns1.spaceweb.ru.
nserver:       ns2.spaceweb.ru.
nserver:       ns3.spaceweb.pro.
nserver:       ns4.spaceweb.pro.
state:         REGISTERED, DELEGATED, UNVERIFIED
person:        Private Person
registrar:     RU-CENTER-RU
admin-contact: https://www.nic.ru/whois
created:       2019-10-23T10:11:12Z
paid-till:     2022-10-23T10:11:12Z
free-date:     2022-11-23
source:        TCI

Last updated on 2021-11-21T15:16:31Z

$ dig example.com +trace

; <<>> DiG 9.16.1-Ubuntu <<>> example.com +trace
;; global options: +cmd
.			6660	IN	NS	m.root-servers.net.
.			6660	IN	NS	l.root-servers.net.
.			6660	IN	NS	k.root-servers.net.
.			6660	IN	NS	j.root-servers.net.
.			6660	IN	NS	i.root-servers.net.
.			6660	IN	NS	h.root-servers.net.
.			6660	IN	NS	g.root-servers.net.
.			6660	IN	NS	f.root-servers.net.
.			6660	IN	NS	e.root-servers.net.
.			6660	IN	NS	d.root-servers.net.
.			6660	IN	NS	c.root-servers.net.
.			6660	IN	NS	b.root-servers.net.
.			6660	IN	NS	a.root-servers.net.
;; Received 262 bytes from 127.0.0.53#53(127.0.0.53) in 0 ms

ru.			172800	IN	NS	d.dns.ripn.net.
ru.			172800	IN	NS	b.dns.ripn.net.
ru.			172800	IN	NS	e.dns.ripn.net.
ru.			172800	IN	NS	f.dns.ripn.net.
ru.			172800	IN	NS	a.dns.ripn.net.
ru.			86400	IN	DS	7729 8 2 C035871113BB7C70C1FBFC1C9BFDFA9781733348D54F7EF9A4AD021A A00336F3
ru.			86400	IN	RRSIG	DS 8 1 86400 20211204050000 20211121040000 14748 . MzQY5SC7LUtHPTgQ1N4YSwNkSK/sUhoebw2QwzdNwbbeM44CXAIcmdC/ hZe7XC11KHEMoE3adadu4Z0Xhf57TG73fhQenCp5/tsaxAUJUUPush/5 harMxfnvBZWH+3trPp9nAnmwHt2yfzxY5VnnZKiDzOJzjmXrjxYmOZhL DlNajwvGpmxxd8BKCrWUs00GusmBSE+EJmdamsf1iVGPWLsc8sYItDB0 MuwHnDEQvDHWok4oyzT0doFTQz927YnkzHBo70bp5A+s6uNX86tqpmoF iQOQrUtYMgD2AqtKk+/BaxfEphRO0ZpSWkpLYuUzBWQsgkP7ut73CXw3 egBwig==
;; Received 719 bytes from 192.33.4.12#53(c.root-servers.net) in 43 ms

example.com.	345600	IN	NS	ns2.ukit.com.
example.com.	345600	IN	NS	ns3.ukit.com.
example.com.	345600	IN	NS	ns1.ukit.com.
TDUI9D4JKUDS8B9T86GJ39PGFLCNLGM5.ru. 3600 IN NSEC3 1 1 3 00FF TE33KGTAQU9M5CRQ3IBSILQU11GFGTTT NS SOA RRSIG DNSKEY NSEC3PARAM
TDUI9D4JKUDS8B9T86GJ39PGFLCNLGM5.ru. 3600 IN RRSIG NSEC3 8 2 3600 20211222140200 20211115104038 52638 ru. gZdutFwtrBdpRrvaxcTY7e6tjtv7FLncuXxEOP9PBv0+iWiM7Qvl8f93 7RlwFToDJ7Z5bNV3hFEYIh9NoUTOHClDKQqjyWOadwamf4wJlbGD+LmX 46FnKj5hCD77plCSeMS3uCp/m0ji+z1Yw4sbPdOHKSNWGxZSjoVDoIhO Qas=
BOLGDP4OMT4DSP5L8UAE7T0M5ALS8SVE.ru. 3600 IN NSEC3 1 1 3 00FF BOU5GU9OE0HUQ3T779O1G0UK9E5HOPBS NS DS RRSIG
BOLGDP4OMT4DSP5L8UAE7T0M5ALS8SVE.ru. 3600 IN RRSIG NSEC3 8 2 3600 20211221050042 20211115104038 52638 ru. CR7bpuflmVSdvRQbBjhrUp9h02QPzF3fvSEEmuwd+jxt9xQKHW0Hf/0U KgaI+r1VVi9IPQHlCrkPfEmqU2FzomjGWxe9hDRHVf/HSg340Aanw0RT FvjTRrQaUdZzPGfN/jex541uP0D0hgoryjuaHaxTXwM4Y7IjMotlW1Kq 69w=
;; Received 606 bytes from 193.232.128.6#53(a.dns.ripn.net) in 3 ms

;; Received 44 bytes from 192.243.48.188#53(ns2.ukit.com) in 135 ms
```

После некоторого времени ожидания (около 1.5 часа), получен ответ с обновленными данными:

```
$ dig example.com +trace

; <<>> DiG 9.16.1-Ubuntu <<>> example.com +trace
;; global options: +cmd
.			7156	IN	NS	f.root-servers.net.
.			7156	IN	NS	m.root-servers.net.
.			7156	IN	NS	g.root-servers.net.
.			7156	IN	NS	k.root-servers.net.
.			7156	IN	NS	j.root-servers.net.
.			7156	IN	NS	b.root-servers.net.
.			7156	IN	NS	c.root-servers.net.
.			7156	IN	NS	d.root-servers.net.
.			7156	IN	NS	a.root-servers.net.
.			7156	IN	NS	i.root-servers.net.
.			7156	IN	NS	l.root-servers.net.
.			7156	IN	NS	h.root-servers.net.
.			7156	IN	NS	e.root-servers.net.
;; Received 262 bytes from 127.0.0.53#53(127.0.0.53) in 0 ms

ru.			172800	IN	NS	a.dns.ripn.net.
ru.			172800	IN	NS	b.dns.ripn.net.
ru.			172800	IN	NS	d.dns.ripn.net.
ru.			172800	IN	NS	e.dns.ripn.net.
ru.			172800	IN	NS	f.dns.ripn.net.
ru.			86400	IN	DS	7729 8 2 C035871113BB7C70C1FBFC1C9BFDFA9781733348D54F7EF9A4AD021A A00336F3
ru.			86400	IN	RRSIG	DS 8 1 86400 20211204050000 20211121040000 14748 . MzQY5SC7LUtHPTgQ1N4YSwNkSK/sUhoebw2QwzdNwbbeM44CXAIcmdC/ hZe7XC11KHEMoE3adadu4Z0Xhf57TG73fhQenCp5/tsaxAUJUUPush/5 harMxfnvBZWH+3trPp9nAnmwHt2yfzxY5VnnZKiDzOJzjmXrjxYmOZhL DlNajwvGpmxxd8BKCrWUs00GusmBSE+EJmdamsf1iVGPWLsc8sYItDB0 MuwHnDEQvDHWok4oyzT0doFTQz927YnkzHBo70bp5A+s6uNX86tqpmoF iQOQrUtYMgD2AqtKk+/BaxfEphRO0ZpSWkpLYuUzBWQsgkP7ut73CXw3 egBwig==
;; Received 691 bytes from 199.7.83.42#53(l.root-servers.net) in 27 ms

example.com.	345600	IN	NS	ns3.spaceweb.pro.
example.com.	345600	IN	NS	ns4.spaceweb.pro.
example.com.	345600	IN	NS	ns1.spaceweb.ru.
example.com.	345600	IN	NS	ns2.spaceweb.ru.
TDUI9D4JKUDS8B9T86GJ39PGFLCNLGM5.ru. 3600 IN NSEC3 1 1 3 00FF TE33KGTAQU9M5CRQ3IBSILQU11GFGTTT NS SOA RRSIG DNSKEY NSEC3PARAM
TDUI9D4JKUDS8B9T86GJ39PGFLCNLGM5.ru. 3600 IN RRSIG NSEC3 8 2 3600 20211222140200 20211115104038 52638 ru. gZdutFwtrBdpRrvaxcTY7e6tjtv7FLncuXxEOP9PBv0+iWiM7Qvl8f93 7RlwFToDJ7Z5bNV3hFEYIh9NoUTOHClDKQqjyWOadwamf4wJlbGD+LmX 46FnKj5hCD77plCSeMS3uCp/m0ji+z1Yw4sbPdOHKSNWGxZSjoVDoIhO Qas=
BOLGDP4OMT4DSP5L8UAE7T0M5ALS8SVE.ru. 3600 IN NSEC3 1 1 3 00FF BOU5GU9OE0HUQ3T779O1G0UK9E5HOPBS NS DS RRSIG
BOLGDP4OMT4DSP5L8UAE7T0M5ALS8SVE.ru. 3600 IN RRSIG NSEC3 8 2 3600 20211221050042 20211115104038 52638 ru. CR7bpuflmVSdvRQbBjhrUp9h02QPzF3fvSEEmuwd+jxt9xQKHW0Hf/0U KgaI+r1VVi9IPQHlCrkPfEmqU2FzomjGWxe9hDRHVf/HSg340Aanw0RT FvjTRrQaUdZzPGfN/jex541uP0D0hgoryjuaHaxTXwM4Y7IjMotlW1Kq 69w=
;; Received 688 bytes from 193.232.156.17#53(f.dns.ripn.net) in 115 ms

example.com.	552	IN	NS	ns4.spaceweb.pro.
example.com.	552	IN	NS	ns2.spaceweb.ru.
example.com.	552	IN	NS	ns3.spaceweb.pro.
example.com.	552	IN	NS	ns1.spaceweb.ru.
;; BAD (HORIZONTAL) REFERRAL
;; Received 225 bytes from 77.222.51.244#53(ns3.spaceweb.pro) in 11 ms

example.com.	552	IN	NS	ns1.spaceweb.ru.
example.com.	552	IN	NS	ns4.spaceweb.pro.
example.com.	552	IN	NS	ns2.spaceweb.ru.
example.com.	552	IN	NS	ns3.spaceweb.pro.
;; BAD (HORIZONTAL) REFERRAL
;; Received 225 bytes from 77.222.51.244#53(ns3.spaceweb.pro) in 15 ms

example.com.	552	IN	NS	ns4.spaceweb.pro.
example.com.	552	IN	NS	ns2.spaceweb.ru.
example.com.	552	IN	NS	ns3.spaceweb.pro.
example.com.	552	IN	NS	ns1.spaceweb.ru.
;; BAD (HORIZONTAL) REFERRAL
;; Received 225 bytes from 77.222.51.244#53(ns3.spaceweb.pro) in 15 ms

example.com.	600	IN	A	77.222.62.138
example.com.	600	IN	NS	ns2.spaceweb.ru.
example.com.	600	IN	NS	ns3.spaceweb.pro.
example.com.	600	IN	NS	ns4.spaceweb.pro.
example.com.	600	IN	NS	ns1.spaceweb.ru.
;; Received 241 bytes from 77.222.50.244#53(ns1.spaceweb.ru) in 15 ms
```