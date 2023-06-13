## Mitmproxy as a service

source: https://discourse.mitmproxy.org/t/mitm-proxy-on-ubuntu-startup/943

Create file /home/user/ipx.sh and make it executable

    #!/bin/bash
    /usr/local/bin/mitmdump --showhost --ssl-insecure --set upstream_cert=false &>> /var/log/mitmdump.log

Create file `/lib/systemd/system/mitmdump.service`

    [Unit]
    Description=mitmdump service
    After=network.target

    [Service]
    Type=simple
    User=root
    ExecStart=/home/user/ipx.sh
    Restart=always
    RestartSec=1

    [Install]
    WantedBy=multi-user.target

Reload system services

    systemctl daemon-reload

Enable service at startup

    systemctl enable mitmdump.service

Start service

    systemctl start mitmdump.service

Use `mitmdump` instead of `mitmproxy`.


## Export the current request/response as curl/httpie/raw/request/response to clipboard

source: https://stackoverflow.com/questions/21489645/get-a-raw-request-response-from-mitm-proxy

press colon : and input one of commands and enter
```
export.clip curl @focus
export.clip httpie @focus
export.clip raw @focus
export.clip raw_request @focus
export.clip raw_response @focus
```